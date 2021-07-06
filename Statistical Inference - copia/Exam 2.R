x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp


pnorm(70, mean=80, sd=10,lower.tail = TRUE)

qnorm(0.95, 1100,75/10,lower.tail=TRUE)

pbinom(q=4, size=5, prob=0.5, lower.tail = FALSE)
pbinom(q=4, size=5, prob=0.5, lower.tail = FALSE)

pbinom(3,size=5,prob=0.5, lower.tail = FALSE)

#The respiratory disturbance index (RDI), a measure of sleep disturbance, 
#for a specific population has a mean of 15 (sleep events per hour) and a 
#standard deviation of 10. They are not normally distributed. Give your best 
#estimate of the probability that a sample mean RDI of 100 people is between 
#14 and 16 events per hour?

prob <- pnorm(16, mean = 15, sd = 10/sqrt(100)) - pnorm(14, mean = 15, sd = 10/sqrt(100))
paste(round(prob * 100), '%', sep = "")

