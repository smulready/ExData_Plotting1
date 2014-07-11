plot1 <- function(filename = "household_power_consumption.txt") {
    
    ## Know the indices to import are 66637 - 69516
    ## First Index: 66637
    ## Last Index: 69516
    ## Num Indices: 2880
    indices <- c(66637:69516)
    power_data <- read.table(filename, header = TRUE, sep = ";", 
                             na.strings = "?",stringsAsFactors = FALSE,
                             nrows = 69517)[indices,]
    power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")
    #power_data$Day <- weekdays(power_data$Date,abbreviate = TRUE)
    
    png("plot1.png",bg="transparent") # 480 pixels x 480 pixels
    hist(power_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
    #dev.copy(png,"plot1.png")
    dev.off()
    
} 