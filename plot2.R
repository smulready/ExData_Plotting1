plot2 <- function(input_file = "household_power_consumption.txt",
                  output_file = "plot2.png") {
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
    plot(1:2880, power_data$Global_active_power , type='l', xlab='',
         ylab="Global Active Power (kilowatts)", axes=FALSE)
    axis(1, at = c(1,1441,2880), lab = c("Thu", "Fri", "Sat"))
    axis(2)
    box()
}