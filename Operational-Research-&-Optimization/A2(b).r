# States:
# B = Booth (absorbing)
# G = Cafe  (absorbing)
# A, C, D, E, F = Transient rooms

# Transition matrix P1 

P1 <- matrix(c(
  # B   G    A    C    D    E    F
  1,  0,   0,   0,   0,   0,   0,   # B
  0,  1,   0,   0,   0,   0,   0,   # G
  
  1/2, 0,   0,   0,   0,  1/2, 0,   # A
  1/2, 0,   0,   0,  1/2, 0,   0,   # C
  0, 1/3,  0,  1/3,  0,  1/3, 0,   # D
  1/3, 0,   0,   0,  1/3, 0,  1/3,  # E
  0, 1/2,  0,   0,   0,  1/2, 0    # F
), nrow = 7, byrow = TRUE)

# rows and columns
states <- c("B","G","A","C","D","E","F")
dimnames(P1) <- list(states, states)

P1


# Extract R and Q
# R = transient -> absorbing
mat.R <- P1[3:7, 1:2]
mat.R

# Q = transient -> transient
mat.Q <- P1[3:7, 3:7]
mat.Q

# Fundamental matrix N
N <- solve(diag(5) - mat.Q)
N


# Absorption probabilities
absorption_probs <- N %*% mat.R
absorption_probs