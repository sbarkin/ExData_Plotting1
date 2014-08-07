# Filename: Plot1.R
# Generates graph #1 in the assignment, callable for assignment part 1 and 4.

# Function: MakeGraph1
# Generate graph #1.  If filename is specified, open this file as a PNG file, and send the graph
# there.  If not specified (or specified as NULL), send to the current device, which may be a 
# file or the screen.  Note that this graph may not display properly on the screen, or non-PNG files.

MakeGraph1 <- function(filename = NULL, hhpower) {
    
    if (!is.null(filename))
        png(filename)
    
    # If filename is not provided or is set to NULL, then display on currently open device, which
    # may be an existing file (with its own "mfcol" and "mfrow" parameters potentially set) or the screen
    # Note that this graph may not display properly on the screen, but will display properly in a 
    # PNG file.
    hist(hhpower$Global_active_power,
         col="red",
         xlab="Global Active Power (kilowatts)",
         main = "Global Active Power", mar = c(1,3,2,4))
    
    # If this function opened a file, then close it now.
    if (!is.null(filename))
        dev.off()
}

if (!exists("hhpower"))
    hhpower = ReadHHFile()
MakeGraph1("Plot1.png", hhpower)
