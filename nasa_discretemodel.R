#First Time Only
i=1
iteration = 0

# Repeat to extract number of  request as per hour (file 10min lag)
c=0
ST= iteration*10000
ED= ST + 959
ED_CHECK_TEN_MIN = iteration*10000 + 5959
ST_DATE = c(19950801, 19950802, 19950803, 19950804, 19950805, 19950806, 19950807)

while(i<=1569916)
{
  if(!is.na(nstv1[i]))
  {
    if(nstv1[i]==ST_DATE[4])  #Change the ST_DATE[ARRAY] value for specific date
    {
      if(nsttv1[i]>=ST && nsttv1[i]<=ED)
      {
        c= c+1 
      }
      else if(ED <= ED_CHECK_TEN_MIN)
      {
        print(c)
        write.table(c,file="nasaaugfile.csv", sep= "," , append = TRUE, row.names = FALSE, col.names = FALSE)
        c=0
        ST = ST+1000
        ED = ED+1000
      }
      else
      {
        break
      }
    }
  }
  i= i+1
}

# Repeat for next hour maximum 24 hrs in day

i = i-1
iteration= iteration+1
