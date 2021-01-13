#set and get location
setwd("D:/wd")
rm(list =ls())

#pembacaan dataset
dataset <- read.csv("Cryotherapy.csv", sep = ",")

#library
install.packages("C50")
install.packages("printr")
library(C50)
library(printr)

#Membuat model decision tree menggunakan C5.0
model <- C5.0(Result_of_Treatment ~., data=dataset)

#jika model error cek class/tipe dari kolom Result_of_Trearment
class(dataset$Result_of_Treatment)

#mengubah tipe class ke factor
dataset$Result_of_Treatment <- as.factor(dataset$Result_of_Treatment)
model <- C5.0(Result_of_Treatment ~., data=dataset)

#melihat hasil model
model
summary(model)

#menampilkam gambar/pohon model
plot(model)

#membuat dataset
datatesting <- dataset[,1:6]

#prediksi
predictions <- predict(model, datatesting)

#membandingkan hasil prediksi dari datatesting dengan dataset
table(predictions, dataset$Result_of_Treatment)

#Memngetahui rule model
rulemodel <- C5.0(Result_of_Treatment ~., data = dataset, rules = TRUE)
rulemodel
summary(rulemodel)
