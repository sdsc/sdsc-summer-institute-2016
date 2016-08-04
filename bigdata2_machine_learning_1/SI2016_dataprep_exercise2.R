# --------------------------
#    PFR data prep code
# --------------------------
setwd("~/Work2016/Comet/SI2016/datacode")

W_df = read.table('weather.csv',
                      header=TRUE,sep=",",
                      stringsAsFactors = TRUE)  #try TRUE


#check you column names
names(W_df)


#check summaries
summary(W_df)

#Notice data has wide variety of scales, so we might want to normalize;
# the scale function is useful, try this:
W_df_scaled = scale(W_df,center=FALSE,scale=TRUE)

#OOPS - scale only operates on numeric matrices, but W_df is dataframe
#try:

#1   define a function to do a z-transform
myscale = function(x) if (class(x)=='integer' || class(x)=='numeric') {
                        (x-mean(x,na.rm=T)) / sd(x,na.rm=T) } else { x}

#3  get a new dataframe and replace with normalized values
W_dfs=W_df
for (i in num_classes) {W_dfs[,i]=myscale(W_dfs[,i])}

#you can compare 
hist(W_df[,'Pressure9am']) 
hist(W_dfs[,'Pressure9am'])

#NOTE, there are packages to normalize, and help transform data frames, but this example is general
# eg see package 'normalize' and 'plyr'


#Step 4
#Now suppose we want to make the Wind Gust Dir values as their own columns

#NOTE: Base R has a reshape command:
#But we will use the reshape2 package

#Run 
#install.packages('reshape2')
library(reshape2)

# long to wide: ie 'cast' repeated measure into wide table
W_cast   =dcast(W_df,  
               formula=Date+Location+ ...~ WindGustDir,   #date, location and the rest are not repeated
                                                          #WindGustDir distinguished the repeated measures
               fill=0,     #this could be 0 or NA, for example. Try 0 first
               value.var="WindGustSpeed")   #which variable has the repeated measurement values

head(W_cast)
write.csv(W_cast,file='Weather_castwide.csv')

#first get names of measured values
names(W_cast)
#which columns have the measure values, what are their names and column number

# wide to long: ie 'melt' repeated measure into long table
W_melt   =melt(W_cast,  na.rm=TRUE,
                     measure.vars=c(23:39),        #which variable has the repeated measurements 
                     variable.name="WindGustDir_cast")    #which varialbe distinguishes those measurements
                     
#if you want to resort records try:
#W_melt_ord = W_melt[ order(W_melt[,1], W_melt[,2]), ]

dim(W_melt)   
#OOPs what happend to the 2 rows, 

#go back and try fill=0 above in cast command

#try
#you can check which original row are NA
na_indices=which(is.na(W_table[,'WindGustDir']))
W_table[na_indices,]
na_indices=which(is.na(W_table[,'WindGustSpeed']))
W_table[na_indices,]


which(W_melt[,'WindGustDir_cast']=='NA')




