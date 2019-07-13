lg= read.table('access_log_Aug95', fill = TRUE)
#  reading the apache log from the Clarknet log file, nrows define the number of row 
#  you want to read from the log file.

names(lg)
# it will show number of coloumns, by default it gives column names from V1, v2 onwards
# [1] "V1" "V2" "V3" "V4" "V5" "V6" "V7" "V8"

attach(lg)
# From now on, I can use V1 instead of LOGS$V1 to refer to the
#first column of the LOGS variable, V2 for the second column

#-------------- Visualize Status of the website --------------------
summary(V7)
# Analyzing the data, Summary() function used to display, Min, Meadian, Q1, mean, 
# Q3, Max  or summary(lg$v7)

table(lg[,7])
#It represents the 8th coloumn information, number of columns containing information

# 200  204  302  304  403  404  500 
# 8775    1  136  pr874    6  199  9

# 200 having 8775 number: means website is working fine.


barplot(table(lg[,7]))
# visulize the data in bar graph

png('req.png',width=600,height=400)
barplot(table(lg[,7]))
dev.off()
# the bar garph will be stored in the image name: req.png
# Give interpreation as per the graph.

#------------- Visualize number of request per week --------------
#I wanted to visualize the number of requests per week
#day and per hour of the day. Getting the date and time from the
#V4 column is a little tricky but it can be done using the following
#command:

newv4 <- strptime(V4 , format('[%d/%b/%Y:%H:%M:%S'))
# strptime function convert the string data to calculated format

day= format(newv4,"%A")
# extracting days from the newv4 variable: %d represents the date and %A represents
#   the day of week on that date

head(day)

table(factor(day, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")))
#display the number of request on day of week. 
# The barplot display the number of request on the days of week.
# factor is a categorical variable that is dummy variable created by R. 
# it calculatet the number of request on day of week. 

#------------------  Visualize the request as per hour --------------
acf(table(factor(day, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))))
pacf(table(factor(day, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))))
  
barplot(table(factor(day, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))))

hours = format(newv4, "%H")

head(hours)

barplot(table(hours), xlab="Hour", ylab="Count", col="lightgreen",las=2, border="gray")


acf(table(hours), xlab="Hour", ylab="Count", col="lightgreen",las=2, border="gray")
pacf(table(hours), xlab="Hour", ylab="Count", col="lightgreen",las=2, border="gray")


tv1<-as.numeric(strftime(strptime(newv4,"%Y-%m-%d"),"%Y%m%d"))
ttv1 <- as.numeric(strftime(strptime(newv4,"%Y-%m-%d %H:%M:%S"),"%H%M%S"))
tvv <- as.numeric(strftime(strptime(newv4,"%Y-%m-%d %H:%M:%S"),"%Y%m%d%H%M"))
v_request <- as.numeric(strftime(strptime(newv4,"%Y-%m-%d %H:%M:%S"),"%H%M"))
