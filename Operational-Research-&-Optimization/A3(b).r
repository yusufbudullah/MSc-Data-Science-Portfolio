library(ggplot2)

# Activities
tasks <- c(
  "Finalise Menu",
  "Order Ingredients",
  "Design Marketing",
  "Arrange Tables",
  "Promote Event",
  "Final Setup"
)

# Most probable times (m)
m <- c(3, 2, 4, 2, 3, 2)

# Start times 
start <- c(0, 3, 3, 5, 7, 10)
end <- start + m


# Gantt data
df <- data.frame(
  name = factor(tasks, levels = tasks),
  start = start,
  end = end
)

# Gantt chart
ggplot(df, aes(x = start, xend = end, y = name, yend = name)) +
  geom_segment(size = 6, color = "orange") +
  scale_x_continuous(breaks = 0:14) +
  xlab("Days") +
  ylab("Activity") +
  ggtitle("Gantt Chart for Event Setup (Most Probable Time)") +
  theme_minimal()