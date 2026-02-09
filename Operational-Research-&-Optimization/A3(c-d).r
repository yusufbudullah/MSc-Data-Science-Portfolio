library(ProjectManagement)

# Activity data 

df <- data.frame(
  ID = LETTERS[1:6],
  opt.time = c(2, 1, 2, 2, 1, 1),
  m.time   = c(3, 2, 4, 3, 2, 2),
  pes.time = c(5, 4, 6, 5, 3, 4)
)


# Expected time & variance (PERT)
df$duration <- (df$opt.time + 4*df$m.time + df$pes.time) / 6
df$variance <- ((df$pes.time - df$opt.time) / 6)^2

df

# Precedence matrix 
# A → B, C
# B → E
# C → D
# D, E → F

M <- matrix(0, 6, 6)
dimnames(M) <- list(LETTERS[1:6], LETTERS[1:6])

M["A", c("B","C")] <- 1
M["B", "E"] <- 1
M["C", "D"] <- 1
M[c("D","E"), "F"] <- 1

M

# CPM / PERT scheduling
project <- schedule.pert(df$duration, M)

paste("The completion time is", project[1])


# Slack & Critical Path
df$slack <- project[[2]][[7]]

critical <- df[df$slack == 0, ]
critical

#Activities that can be delayed
df[df$slack > 0, ]

# Probability of completing within 14 days
mean_time <- sum(critical$duration)
variance <- sum(critical$variance)

pnorm(14, mean = mean_time, sd = sqrt(variance))
paste("The Probability of completing within 14 days", pnorm(14, mean = mean_time, sd = sqrt(variance)))
