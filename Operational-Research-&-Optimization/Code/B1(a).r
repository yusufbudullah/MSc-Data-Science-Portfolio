library(ggplot2)

#Full-Time staff
FT <- data.frame(
  Staff = paste0("FT", 1:6),
  Start = c(10, 10, 11, 13, 14, 14)
)

# 4 hour working block 
FT_block1 <- data.frame(
  Staff = FT$Staff,
  Start = FT$Start,
  End   = FT$Start + 4,
  Type  = "Full-Time"
)

# 3 ohur working block after break
FT_block2 <- data.frame(
  Staff = FT$Staff,
  Start = FT$Start + 5,
  End   = FT$Start + 8,
  Type  = "Full-Time"
)


# Part-time staff

PT <- data.frame(
  Staff = paste0("PT", 1:3),
  Start = c(10, 11, 18)
)

PT_block <- data.frame(
  Staff = PT$Staff,
  Start = PT$Start,
  End   = PT$Start + 4,
  Type  = "Part-Time"
)


schedule <- rbind(FT_block1, FT_block2, PT_block)


#Plot
ggplot(schedule,
       aes(y = Staff, x = Start, xend = End, color = Type)) +
  geom_segment(size = 6) +
  scale_x_continuous(
    breaks = 10:22,
    limits = c(10, 22)
  ) +
  labs(
    title = "Optimal Staffing Schedule (Gantt Chart)",
    x = "Time (Hours)",
    y = "Staff"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    axis.text.y = element_text(size = 10)
  )