# Filename: Plot2.R
# Generates graph #2 in the assignment, callable for assignment part 2 and 4.


# Function: MakeGraph2
# Generate graph #2.  If filename is specified, open this file as a PNG file, and send the graph
# there.  If not specified (or specified as NULL), send to the current device, which may be a 
# file or the screen.  Note that this graph may not display properly on the screen, or non-PNG files.
# Note: Not sure why weekday labels automatically appear rather than dates

MakeGraph2 <- function(filename = NULL, hhpower) {
    
    if (!is.null(filename))
        png(filename)
    
    plot(hhpower$DateTime, hhpower$Global_active_power, 
         type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", col = "black")
    
    # If this function opened a file, then close it now.
    if (!is.null(filename))
        dev.off()
}

if (!exists("hhpower"))
    hhpower = ReadHHFile()
MakeGraph2("Plot2.png", hhpower)