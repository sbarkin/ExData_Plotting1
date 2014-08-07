# Filename: Plot4.R
# Generate plot4, which consists of four graphs displayed together, two of which are the same
# as plots 2 and 3 earlier in this assignment
# (and therefore invoke the same code contained in those files rather than repeating the code here)

MakeGraph4 <- function(filename = NULL, hhpower) {
    
    if (!is.null(filename))
        png(filename)
    
    # This plot consists of four graphs, displayed 2x2
    par(mfcol = c(2,2))   # Displays graphs 1 & 2 in first column, then 3 & 4 in second column

    # Because we are not passing a filename to these functions, they will use the 
    # currently opened file device
    MakeGraph2(NULL, hhpower)
    MakeGraph3(NULL, hhpower)
    plot(hhpower$DateTime, hhpower$Voltage, type = "l", col = "black",
         xlab = "datetime", ylab = "Voltage")
    plot(hhpower$DateTime, hhpower$Global_reactive_power, type = "l", col = "black",
         xlab = "datetime", ylab = "Global_reactive_power")
    # If this function opened a file, then close it now.
    if (!is.null(filename))
        dev.off()
}

if (!exists("hhpower"))
    hhpower = ReadHHFile()
MakeGraph4("Plot4.png", hhpower)

