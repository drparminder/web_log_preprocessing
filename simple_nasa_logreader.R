nslg= read.table('access_log_Aug95', fill = TRUE)

names(nslg)

attach(nslg)

summary(V7)

table(lg[,7])

barplot(table(lg[,7]))

dev.off()

nsnewv4 <- strptime(V4 , format('[%d/%b/%Y:%H:%M:%S'))

dayns= format(nsnewv4,"%A")

head(dayns)

table(factor(dayns, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")))

barplot(table(factor(dayns, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))))

hoursns = format(nsnewv4, "%H")

head(hoursns)

nstv1<-as.numeric(strftime(strptime(nsnewv4,"%Y-%m-%d"),"%Y%m%d"))
nsttv1 <- as.numeric(strftime(strptime(nsnewv4,"%Y-%m-%d %H:%M:%S"),"%H%M%S"))
nstvv <- as.numeric(strftime(strptime(nsnewv4,"%Y-%m-%d %H:%M:%S"),"%Y%m%d%H%M"))
