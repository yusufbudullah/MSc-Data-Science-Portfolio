/* Renaming columns for consistency */
data clean_railway;
  set Assmt.sampled_railway_inconsistencies;
  rename
    'Transaction ID'n       = Transaction_ID
    'Date of Purchase'n     = Date_of_Purchase
    'Time of Purchase'n     = Time_of_Purchase
    'Purchase Type'n        = Purchase_Type
    'Payment Method'n       = Payment_Method
    'Railcard'n             = Railcard
    'Ticket Class'n         = Ticket_Class
    'Ticket Type'n          = Ticket_Type
    'Price'n                = Price
    'Departure Station'n    = Departure_Station
    'Arrival Destination'n  = Arrival_Destination
    'Date of Journey'n      = Date_of_Journey
    'Departure Time'n       = Departure_Time
    'Arrival Time'n         = Arrival_Time
    'Actual Arrival Time'n  = Actual_Arrival_Time
    'Journey Status'n       = Journey_Status
    'Reason for Delay'n     = Reason_for_Delay
    'Refund Request'n       = Refund_Request;
run;
/*Pre Processing*/

/* Fixing typos in ticket type, journey status, and reason for delay */
data cleaned;
    set clean_railway;

    length Ticket_Type $8 Journey_Status $9 Reason_for_Delay $20;

    if lowcase(Ticket_Type) in ("adavnce", "davance") then Ticket_Type = "Advance";
    if Journey_Status in ("On Tmie", "On Tiem") then Journey_Status = "On Time";
	
	if index(lowcase(Reason_for_Delay), "weather") > 0 then Reason_for_Delay = "Weather";
    if Reason_for_Delay = "Signal failure" then Reason_for_Delay = "Signal Failure";
run;


/*Check changes made correctly*/
/* Reason for Delay – Frequency + bar chart */
proc freq data=cleaned;
  tables Reason_for_Delay / plots=freqplot;
run;

/* Ticket Type – e.g., Advance, Anytime, Season */
proc freq data=cleaned;
  tables Ticket_Type / plots=freqplot;
run;

/* Journey Status – Delayed vs On Time */
proc freq data=cleaned;
  tables Journey_Status / plots=freqplot;
run;


/* Fixing known station name variants */
data cleaned;
    set cleaned;

    length Departure_Station $30;

    if lowcase(Departure_Station) in (
        "amnchester piccadilly", "mancehster piccadilly", 
        "mnachester piccadilly", "macnhester piccadilly") 
        then Departure_Station = "Manchester Piccadilly";

    if lowcase(Departure_Station) = "london st pnacras" then 
        Departure_Station = "London St Pancras";
run;

/*Check changes made correctly*/
/* Frequency table for all departure stations */
proc freq data=cleaned;
  tables Departure_Station;
run;



/* Handling missing values */
data cleaned;
    set cleaned;

    length Railcard $8 Reason_for_Delay $20;

    /* Assign 'None' to missing or blank Railcard values */
	if missing(Railcard) then Railcard = "None";

    /* Assign 'No Delay' if delay reason is missing but journey was on time */
    if missing(Reason_for_Delay) and Journey_Status = "On Time" then 
        Reason_for_Delay = "No Delay";
run;


/*Check changes made correctly*/
/* Railcard – Frequency count + bar chart */
proc freq data=cleaned;
  tables Railcard / plots=freqplot;
run;

/* Reason for Delay – Frequency + bar chart */
proc freq data=cleaned;
  tables Reason_for_Delay / plots=freqplot;
run;

/* Feature Engineering*/

data engineered;
    set cleaned;

    /* Log transformation */
    if Price > 0 then Log_Price = log(Price);

    /* Delay reason grouping */
    length Reason_Group $20;
    if Reason_for_Delay in ("Signal Failure", "Technical Issue") then Reason_Group = "Infrastructure";
    else if Reason_for_Delay in ("Staff Shortage", "Staffing", "Traffic") then Reason_Group = "Operational";
    else if Reason_for_Delay = "Weather" then Reason_Group = "Weather";
    else if Reason_for_Delay = "No Delay" then Reason_Group = "None";
    else Reason_Group = "Other";

    /* Delay duration */
    if Journey_Status = "Delayed" and not missing(Actual_Arrival_Time) and not missing(Arrival_Time) then do;
        Delay_Duration = Actual_Arrival_Time - Arrival_Time;
        Delay_Duration_Minutes = Delay_Duration / 60;
    end;

    /* Delay category */
    if Journey_Status = "Cancelled" then Delay_Category = "Cancelled";
    else if Delay_Duration_Minutes = . then Delay_Category = "No Delay";
    else if Delay_Duration_Minutes <= 10 then Delay_Category = "Minor";
    else if Delay_Duration_Minutes <= 30 then Delay_Category = "Moderate";
    else Delay_Category = "Severe";

    /* Hour and day of week */
    Hour = hour(Departure_Time);
    DayOfWeek = weekday(Date_of_Journey);

    /* Route */
    length Route $50;
    Route = catx(" to ", Departure_Station, Arrival_Destination);
run;


/* Check basic stats for log-transformed price */
proc univariate data=engineered;
    var Log_Price;
    histogram Log_Price;
run;

/* Check frequency of grouped delay reasons */
proc freq data=engineered;
    tables Reason_Group / plots=freqplot;
run;



/* Check delay duration distribution */
proc univariate data=engineered;
    var Delay_Duration_Minutes;
    histogram Delay_Duration_Minutes;
run;


/* Check frequency of delay categories */
proc freq data=engineered;
    tables Delay_Category / plots=freqplot;
run;


/* Check hourly distribution of departures */
proc freq data=engineered;
    tables Hour / plots=freqplot;
run;


/* Check distribution of journeys across days of the week */
proc freq data=engineered;
    tables DayOfWeek / plots=freqplot;
run;


/* Check frequency of Route combinations */
proc freq data=engineered noprint;
    tables Route / out=Route_Freq;
run;

proc sort data=Route_Freq;
    by descending count;
run;

proc print data=Route_Freq(obs=10);
run;

/*EDA*/
/* Boxplot of Price by Ticket Type to explore fare spread across ticket options */
proc sgplot data=cleaned;
    vbox Price / category=Ticket_Type;
    xaxis label="Ticket Type";
    yaxis label="Ticket Price (£)";
    title "Boxplot of Price by Ticket Type";
run;

/* Pie chart showing distribution of Journey Status (On Time, Delayed, Cancelled) */
proc gchart data=cleaned;
    pie Journey_Status / value=inside percent=outside slice=outside;
    title "Journey Status Distribution";
run;
quit;

/* Boxplot of Price by Payment Method to check if fare values differ by how tickets are paid */
proc sgplot data=cleaned;
    vbox Price / category=Payment_Method;
    xaxis label="Payment Method";
    yaxis label="Ticket Price (£)";
    title "Price Distribution by Payment Method";
run;

/* Heatmap of Departure Station vs Journey Status to spot stations with more delays or cancellations */
proc freq data=cleaned noprint;
    tables Departure_Station*Journey_Status / out=station_status_freq;
run;

proc sgplot data=station_status_freq;
    heatmap x=Departure_Station y=Journey_Status / colorresponse=COUNT colormodel=(blue white red);
    xaxis fitpolicy=rotate;
    title "Heatmap of Journey Status by Departure Station";
run;

/* Scatter plot to explore relationship between Time of Purchase and Ticket Price */
proc sgplot data=cleaned;
    scatter x=Time_of_Purchase y=Price;
    xaxis label="Time of Purchase";
    yaxis label="Ticket Price (£)";
    title "Scatter Plot of Price by Purchase Time";
run;

/* Line chart showing daily journey volume by status to detect trends or disruption periods */
proc freq data=cleaned noprint;
    tables Date_of_Journey*Journey_Status / out=journey_status_by_date;
run;

proc sgplot data=journey_status_by_date;
    series x=Date_of_Journey y=COUNT / group=Journey_Status;
    title "Journey Status Trend Over Time";
run;

/* Heatmap to examine journey outcome by payment method used */
proc freq data=cleaned noprint;
    tables Payment_Method*Journey_Status / out=paystatus;
run;

proc sgplot data=paystatus;
    heatmap x=Payment_Method y=Journey_Status / colorresponse=COUNT colormodel=(blue white red);
    title "Journey Status by Payment Method";
run;

/* Boxplot to visualise how ticket price varies across different ticket classes */
proc sgplot data=cleaned;
    vbox Price / category=Ticket_Class;
    title "Ticket Price by Class";
run;


/*Hypothesis*/
/* Hypothesis 1: Delay severity varies by day of the week */
/* Chi-square test to check if delay severity varies by day of the week */
proc freq data=engineered;
    tables DayOfWeek*Delay_Category / chisq plots=freqplot;
    title "Chi-Square Test: Delay Category by Day of Week";
run;


/* Hypothesis 2: Longer delays are associated with weather-related disruptions */
/* Boxplot of delay duration across grouped delay reasons */
proc sgplot data=engineered(where=(Delay_Duration_Minutes ne .));
    vbox Delay_Duration_Minutes / category=Reason_Group;
    xaxis label="Reason Group";
    yaxis label="Delay Duration (Minutes)";
    title "Delay Duration by Reason Group";
run;

/* One-way ANOVA to test if delay durations differ by reason group */
proc anova data=engineered;
    class Reason_Group;
    model Delay_Duration_Minutes = Reason_Group;
    title "ANOVA: Delay Duration by Reason Group";
run;



/* Hypothesis 3: Severe delays are more common during peak hours */
/* Chi-square test to check if delay severity is associsated with time of day */
proc freq data=engineered(where=(Journey_Status = "Delayed"));
    tables Hour*Delay_Category / chisq plots=freqplot;
    title "Chi-Square Test: Delay Category by Hour";
run;


/* Hypothesis 4: Higher ticket prices result in fewer severe delays */
/* Boxplot of log-transformed price across delay categories */
proc sgplot data=engineered;
    vbox Log_Price / category=Delay_Category;
    xaxis label="Delay Category";
    yaxis label="Log Price";
    title "Log Price by Delay Severity";
run;

/* ANOVA test to determine if price differs by delay category */
proc anova data=engineered;
    class Delay_Category;
    model Log_Price = Delay_Category;
    title "ANOVA: Log Price by Delay Severity";
run;



/* Hypothesis 5: Some routes experience more cancellations than others */
/* Frequency table for cancellations by route */
proc freq data=engineered(where=(Delay_Category = "Cancelled")) noprint;
    tables Route / out=cancel_routes;
run;

/* Sort by cancellation count */
proc sort data=cancel_routes;
    by descending count;
run;

/* Print top 10 routes with most cancellations */
proc print data=cancel_routes(obs=10);
    title "Top 10 Routes with Highest Cancellations";
run;



