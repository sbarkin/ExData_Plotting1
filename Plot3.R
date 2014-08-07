# Filename: Plot3.R
# Generates graph #3 in the assignment, callable for assignment part 3 and 4.


# Function: MakeGraph3
# Generate graph #3.  If filename is specified, open this file as a PNG file, and send the graph
# there.  If not specified (or specified as NULL), send to the current device, which may be a 
# file or the screen.  Note that this graph may not display properly on the screen, or non-PNG files.

MakeGraph3 <- function(filename = NULL, hhpower) {
    
    if (!is.null(filename))
        png(filename)
    
    plot(hhpower$DateTime, hhpower$Sub_metering_1, 
         type = "l", ylab = "Energy Sub Metering", xlab = "", col = "black")
    points(hhpower$DateTime, hhpower$Sub_metering_2, 
           type = "l", col = "red")
    points(hhpower$DateTime, hhpower$Sub_metering_3, 
           type = "l", col = "blue")
    
    legend(x = "topright",
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col = c("black", "red", "blue"), 
           lwd= 2)
    
    # If this function opened a file, then close it now.
    if (!is.null(filename))
        dev.off()
}

if (!exists("hhpower"))
    hhpower = ReadHHFile()
MakeGraph3("Plot3.png", hhpower)