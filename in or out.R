CEOdata <- read.csv("Top 100 CEOs Final 2016.csv")

library(ggplot2)

Ref <- expression(paste("Data from: The Best-Performing CEOs in the World.", italic("Harvard Business Review"), ".2016"))
rect <- data.frame(xmin=3.5, xmax=5.5, ymin=-0.5, ymax=20.5)
  
# Stacked barplot with multiple groups
p <- ggplot(data=CEOdata, aes(x=factor(RANK.GROUP, levels = rev(unique(CEOdata$RANK.GROUP))), fill= INSIDER..OUTSIDER)) +
  geom_bar(stat="count") +
  labs(title="Best CEO: OUTSIDER or INSIDER ?",
       x = "Overall Rank of CEO", y = "Number of CEO",
       caption = Ref)+
  stat_count(aes(y=..count.., label=..count..), geom="text", hjust=2)+
  coord_flip()+
  scale_fill_manual("legend", values = c("INSIDER" = "orange1", "OUTSIDER" = "orangered1"))+
  theme_minimal()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(axis.text.y = element_text(size=10), axis.text.x = element_blank(),
        axis.title=element_text(size=10,face="bold",color="gray45"),
        plot.title = element_text(size=14, hjust = 0.5),
        plot.caption=element_text(hjust = -0.3, color="gray45"))+
  geom_rect(data=rect, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax),
            color="red1",
            alpha=0,
            inherit.aes = FALSE)+
  theme(legend.title=element_blank())
  
p








