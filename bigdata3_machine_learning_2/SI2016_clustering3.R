# clustering code

W_table = read.table('weather.csv',
                     header=TRUE,sep=",",
                     stringsAsFactors = TRUE)

#1 RISK_MM is same as 'rain tomorrow' so drop it

#this not work
W_table=W_table[,-'RISK_MM']

#subset with select is more flexible
W_table=subset(W_table, select=-c(RISK_MM))

#2  Get numeric columns only
col_classes = sapply(W_table,class)
num_inds    = c(which(col_classes=='numeric'), which(col_classes=='integer'))
W_num       = W_table[,num_inds]


#Remomve rows that are missing data
rem_ind  = complete.cases(W_num)
print(paste('Number of incomplete cases:',length(which(rem_ind==FALSE)) ))
W_num    = W_num[rem_ind,]


#EXTRA tidbit:
#here's a way to check out histrograms interactively
for (i in seq(1,dim(W_num)[2])){ 
  if (hist(W_num[,i],main=paste(names(W_table)[i])))
      readline('continue...or escape')
}


#3  now we can use 'scale' function
W_mncntr=scale(W_num,center=TRUE,scale=TRUE)

#4 Run kmeans for 20 values of K
kg=matrix(0,20,2)
for (i in 1:20){
  ktest=kmeans(W_mncntr,i,20,5);
  kg[i,1]=i;
  kg[i,2]=ktest$tot.withinss;  
}
plot(kg[,1],kg[,2],main='kmeans within cluster SS, weatherdata numerics')

#try
str(ktest)
#for example:
#  cluster has a cluster number assignments for each datum
#  centers are center points for each cluster
#  tot sum of squares
#  within sum of squares



#Step 4 now try Matrix Factorization 

#Because W_num is non-square run SVD
Wsvd=svd(W_mncntr)

#Step 5  plot the singular values
plot(1:length(Wsvd$d),Wsvd$d,main='SVD singular values')

#or
plot(1:length(Wsvd$d),cumsum(Wsvd$d/sum(Wsvd$d)),main='SVD cumulative variance ')  #plotting cumulative sum  

#Note, One could take first 6 components as an approximation to original data, 
Wsvd_with6=Wsvd$u[,1:6] %*% diag(Wsvd$d[1:6]) %*% Wsvd$v[1:6,]

#But for us, 
#Step 6
#   lets just take first 3 components as a project of orginal data
W3 = as.matrix(W_num) %*% Wsvd$v[,1:3]    #notice that W_num was still a dataframe

#get Kmeans for 4 clusters 
k4 = kmeans(W_num,4,20,5)
#get color scheme
col2use = c('red','blue','black','yellow')
#get cluster assignment in colors
colassignments = col2use[k4$cluster]
plot(W3[,1],W3[,2],col=colassignments,main='cluster pts project to 1,2 SVD components')


#NOTES:
#label color by Rain Day today or tomorrow
#try jsut evap, min temp, max temp, rainfall, sunshine
# normalize everything


# to plot center points, first project them into space
c3 = k4$centers%*% Wsvd$v[,1:3]
points(c3[,1],c3[,2],pch=8,cex=1.5)

#to get a bigger list of colors take a sample of colors
#colrs2use=colors()[seq(21,631,40)]; #sample every 40th color from 21st thru 631st, 
#colrs2use=colrs2use[1:K]        #take K=num of clusters to plot 

# end  ===================================================


#other stuff to try
#library(cluster) 
#clusplot(C_mncntr, kres$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)


#install.packages('mclust')
#library('mclust')
#emfit=Mclust(C_mncntr);
#plot(emfit)

### Note emfit selected 4 clusters;


