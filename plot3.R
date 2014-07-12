plot3 <- function(input_file = "household_power_consumption.txt",
                  output_file = "plot3.png") {
    indices <- c(66637:69516)
    power_data <- read.table(input_file, header = TRUE, sep = ";",
                             na.strings = "?",stringsAsFactors = FALSE,
                             nrows = 69517)[indices,]
    power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")
    
    png(output_file, bg = "transparent")
    plot_func(power_data)
    dev.off()
    
}

plot_func <- function(df) {
    
    plot_range <- range(df$Sub_metering_1,df$Sub_metering_2,df$Sub_metering_3)
    
    plot(df$Sub_metering_1, type='l', xlab='',
         ylab="Energy sub metering", axes=FALSE)
    lines(df$Sub_metering_2, type='l', xlab='',
          ylab="Energy sub metering", col='red')       
    lines(df$Sub_metering_3, type='l', xlab='',
          ylab="Energy sub metering", col='blue')     
    
    axis(1, at = c(1,1441,2880), lab = c("Thu", "Fri", "Sat"))
    axis(2)
    box()
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col = c("black","red","blue"), lty = 1)
}