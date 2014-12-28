library(ggplot2)
data1         <- read.csv("output/catcher_in_the_rye.csv", header=FALSE, stringsAsFactors=FALSE)
data1$dataset <- "Catcher in the Rye"
data2         <- read.csv("output/to_kill_a_mocking_bird.csv", header=FALSE, stringsAsFactors=FALSE)
data2$dataset <- "To Kill a Mocking Bird" 


data        <- rbind(data1, data2) #merge them 

names(data) <- c("gen_number","sentence", "dataset")
data$len    <- nchar(data$sentence)
visual      <- ggplot(data, aes(x=gen_number, y=..density.., colour=dataset)) +
geom_histogram(bin=5) +
scale_x_continuous(name="Number of generations") +
scale_y_continuous(name="Frequency") +
theme_bw() + 
facet_wrap(~ dataset) + 
theme(legend.position="none")
print(visual)

line   <- readline() #wait for a key to press

visual <- ggplot(data, aes(x=len, y=gen_number)) +
geom_smooth(se=FALSE) +
geom_point() +
facet_wrap(~ dataset, scales = "free")+
theme(legend.position="none") +
scale_y_continuous(name="Number of generations") +
scale_x_continuous(name="Sentence length") 
print(visual)
