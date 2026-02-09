library(markovchain)

states
states <- c(50, 80, 100, 120)


# sample 90 days 

set.seed(123) 
customers <- sample(
  states,
  size = 90,
  replace = TRUE
)

# transitions from the sample
from <- customers[-length(customers)]
to   <- customers[-1]

# transition count matrix
transition_counts <- table(from, to)


# transition probabilities
P <- prop.table(transition_counts, margin = 1)
P

# transition probabilities matrix 
Pm <- matrix(
  as.numeric(P),
  nrow = nrow(P),
  ncol = ncol(P),
  byrow = FALSE
)

rownames(Pm) <- rownames(P)
colnames(Pm) <- colnames(P)

Pm
# Check 
class(Pm)
is.matrix(Pm)
rowSums(Pm)

# create Markov chain object
MC <- new("markovchain",
          states = as.character(states),
          transitionMatrix = Pm,
          name = "Daily Customer Visits")

MC


#Plot the Markov chain
plot(MC)


# steady-state probabilities
steadyStates <- steadyStates(MC)
steadyStates

# print steady-state probabilities
paste("The probability of having 50 customers is", steadyStates[1])
paste("The probability of having 80 customers is", steadyStates[2])
paste("The probability of having 100 customers is", steadyStates[3])
paste("The probability of having 120 customers is", steadyStates[4])