# Filename: ReadHHFile.R
# Defines function to read household power consumption file into the hhpower R data frame,
# Called from multiple other files in this repository.
# Returns data frame containing data for two days.
# 

ReadHHFile <- function() {
    hhpower = read.csv.sql("household_power_consumption.txt", 
                           sep=";",
                           sql = 
                               "select * from file where Date in ('1/2/2007', '2/2/2007')")
    # Generate a single date/time column equivalent to the combination of the date & time columns
    hhpower$DateTime = strptime(paste(hhpower$Date, hhpower$Time), "%d/%m/%Y %H:%M:%S")
    
    # Now drop the original date and time string columns to avoid confusion
    hhpower = hhpower[,!names(hhpower) %in% c("Date", "Time")]
    hhpower    # Return data frame  
}