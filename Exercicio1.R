# seed

set.seed(50000)

### Problem 1

## function f(x)

f <- function(x){
  4*(1-x)^3
}

rangefx <- range(0:1)

fx_curve <- curve(f, rangefx, n=1000)



reject.beta <- function(nvals)
{
  x.accept <- NULL
  u.accept <- NULL
  nx <- 0
  x.rejected <- NULL
  u.rejected <- NULL
  nrejected <- 0
  while(nx < nvals) {
    Y <- runif(1)
    #Generate u with U~U[0;4]
    U <- runif(1,0,4) #k is the third element
    if(U <= 4*(1-Y)^3) {   #pdf function
      nx <- nx + 1
      x.accept[nx] <- Y
      u.accept[nx] <- U
    }
    else {
      nrejected <- nrejected + 1
      x.rejected[nrejected] <- Y
      u.rejected[nrejected] <- U
    }
  }
  plot(x.accept,u.accept, xlim=c(0,1), ylim=c(0,4.5), pch=20,col="green",xlab="x",ylab="f(x)",main=paste(paste("f(x): n = ", nvals," points generated by the Rejection Method")))
lines(x.rejected,u.rejected,pch=20,col="red",type="p")
return(x.accept)
}

#Rejection Samples
XX_fx_100 <- reject.beta(100)
XX_fx_500 <- reject.beta(500)
XX_fx_1000 <- reject.beta(1000)
XX_fx_5000 <- reject.beta(5000)
XX_fx_10000 <- reject.beta(10000)

#Samples Histogram
hist(XX_fx_100,breaks=20,prob=TRUE,xlim=c(0,1),ylim=c(0,5),xlab="xx", main="Beta(1,4) vs f(x) for n = 100")
lines(x.val,dbeta(x.val,1,4),col="blue")
hist(XX_fx_500,breaks=20,prob=TRUE,xlim=c(0,1),ylim=c(0,5),xlab="xx", main="Beta(1,4) vs f(x) for n = 500") 
lines(x.val,dbeta(x.val,1,4),col="blue")
hist(XX_fx_1000,breaks=20,prob=TRUE,xlim=c(0,1),ylim=c(0,5),xlab="xx",main="Beta(1,4) vs f(x) for n = 1000")
lines(x.val,dbeta(x.val,1,4),col="blue")
hist(XX_fx_5000,breaks=20,prob=TRUE,xlim=c(0,1),ylim=c(0,5),xlab="xx",main="Beta(1,4) vs f(x) for n = 5000")
lines(x.val,dbeta(x.val,1,4),col="blue")
hist(XX_fx_10000,breaks=20,prob=TRUE,xlim=c(0,1),ylim=c(0,5),xlab="xx",main="Beta(1,4) vs f(x) for n = 10000")
lines(x.val,dbeta(x.val,1,4),col="blue")
x.val <- seq(0,1,0.001)




## Q-QPlot beta(1,4)
set.seed(10000)


n <- 10000
sample <- reject.beta(n)
quantiles.pop <- qbeta(seq(0.5/n,1,1/n),1,4)
qq <- cbind(sort(sample), quantiles.pop)
plot(qq, pch=20, xlim=c(0,1), ylim=c(0,0.9), xlab="X", ylab="Y", main="QQ plot for n = 10000")
abline(0,1,col="blue")


#library(SimDesign)
#library(car)
#library(mvtnorm)

#qqPlot(XX_fx_100, "beta", shape1=1, shape2=4, envelope = 0, pch=20)
#qqPlot(XX_fx_500, "beta", shape1=1, shape2=4, envelope = 0, pch=21)
#qqPlot(XX_fx_1000, "beta", shape1=1, shape2=4, envelope = 0, pch=21)
#qqPlot(XX_fx_5000, "beta", shape1=1, shape2=4, envelope = 0, pch=21)
#qqPlot(XX_fx_10000, "beta", shape1=1, shape2=4, envelope = 0, pch=21)







