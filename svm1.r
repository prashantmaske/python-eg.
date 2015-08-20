#code 
#svm
library(e1071)
data=read.csv('11.csv') #read the data

#subsetting the data
data1=data[data[58]==1,]
data0=data[data[58]==0,]

#creating sample
sa1=sample(1:nrow(data1),round(0.8*nrow(data1)),replace=F)
sa0=sample(1:nrow(data0),round(0.8*nrow(data0)),replace=F)

#creating train and test data
data1_train=data1[sa1,]
data0_train=data0[sa0,]
data1_test=data1[-sa1,]
data0_test=data0[-sa0,]

#final train and test data with scaling
train_data=rbind(data1_train,data0_train)
test_data=rbind(data1_test,data0_test)
scaled_train_data=data.frame(cbind(scale(train_data[,-58],center=F,scale=T),V58=train_data[58]))
scaled_test_data=data.frame(cbind(scale(test_data[,-58],center=F,scale=T),V58=test_data[58]))

#applying svm
svmreg<-svm(V58~.,scaled_train_data,type="C-classification") #training
summary(svmreg)
presvm<-predict(svmreg,scaled_test_data[,-58]) #prediction 

#creating table of actual data and predicted data and 
#calculating accuracy using confusion matrix
library(caret)
table1=table(presvm,scaled_test_data[,58])
acc=confusionMatrix(table1)$overall['Accuracy']
cat('accuracy is ',acc*100,'\n')

#output
Call:
svm(formula = V58 ~ ., data = scaled_train_data, type = "C-classification")


Parameters:
   SVM-Type:  C-classification 
 SVM-Kernel:  radial 
       cost:  1 
      gamma:  0.01754386 

Number of Support Vectors:  1030

 ( 478 552 )


Number of Classes:  2 

Levels: 
 0 1



Loading required package: lattice
Loading required package: ggplot2
Loading required package: methods
accuracy is  93.26819 

