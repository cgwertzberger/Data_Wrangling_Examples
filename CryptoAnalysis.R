rm(list=ls())

Top20<-read.csv("Top20.csv")

#Correlation Calulation

coins<-c()
corr<-c()
no<-1
coinsreturn<-c()
stocksreturn<-c()
pvalue<-c()
beta<-c()


for (i in Top20$Symbol) {
  j<-read.csv(paste(i,".csv",sep=""))
  k<-((tail(j$Close,1)-head(j$Open,1))/head(j$Open,1))*100
  stocksreturn[no]<-k
  l<-((tail(j$CloseCrypto,1)-head(j$OpenCrypto,1))/head(j$OpenCrypto,1))*100
  coinsreturn[no]<-l
  coins[no]<-i
  y<-cor.test(j$Close,j$CloseCrypto)
  corr[no]<-y$estimate
  pvalue[no]<-y$p.value
  beta[no]<-cov(j$CloseCrypto,j$Close)/var(j$Close)
  no<-no+1
}


CoinCorr<-data.frame(coins,corr,pvalue)
write.csv(CoinCorr,"CoinCorr.csv")

CoinBeta<-data.frame(coins,beta)
write.csv(CoinBeta,"CoinBeta.csv")

CoinRet<-data.frame(coins,coinsreturn,stocksreturn)
CoinRet$diff<-CoinRet$coinsreturn-CoinRet$stocksreturn
write.csv(CoinRet,"CoinRet.csv")

dotchart(CoinCorr$corr,labels = CoinCorr$coins)
barplot(CoinRet$diff,names.arg=CoinRet$coins,xlab ="Currency",ylab = "Return Difference in %",main="Difference in Return Between Cryptos and The SP500")

#Boxplot
boxplot(corr,data=CoinCorr, main="Correlation between Crypto and Stock Market", 
        ylab="Correlation", col = "Orange")

#Bar Plot
CoinCorr2<-CoinCorr[ which(CoinCorr$pvalue<.05), ]
View(CoinCorr2)

barplot(CoinCorr2$corr,names.arg=CoinCorr2$coins,xlab ="Currency",ylab = "Correlation to Stock Market",
        main="Correlation Between Cryptos and The SP500", col = "Light Blue")
