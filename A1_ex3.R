## Exercise 3 
# Minkyung Park (46858822)
library(tidyverse)
library(ggplot2)
library(gridExtra)

ex3_signif <- read_csv("A1_Ex3_signif.csv")
ex3_not_signif <- read_csv("A1_Ex3_not_signif.csv")

## Pass level

#1. State the Null Hypothesis and the Alternative Hypothesis

print("H0: There is no statistically significant relationship between the X and the Y (= the slope(beta) is zero)")
print("H1: There is statistically significant relationship between the X and the Y (= the slope(beta) is not zero)")

#2_a. plotting y vs. x

plot_1 <- ggplot(ex3_signif) + 
                geom_point(aes(X,Y), color = "steelblue") + 
                ggtitle("Significant") +
                theme(plot.title = element_text(size = 10, face = "bold"))
plot_2 <- ggplot(ex3_not_signif) + 
                geom_point(aes(X,Y), color = "tomato") + 
                ggtitle("Not Significant") +
                ylim(-200, 200) +
                theme(plot.title = element_text(size = 10, face = "bold"))

grid.arrange(plot_1, plot_2, ncol=2,  
             top = "Plotting y vs. x")


#2_b. the scatter plot of the regression residuals ei vs the fitted values yˆ
lm_1 <- lm(Y ~ X, ex3_signif)
lm_2 <- lm(Y ~ X, ex3_not_signif)

par(mfrow = c(2, 1))
scat_1 <- plot(fitted.values(lm_1), resid(lm_1), 
               xlab = "fitted values", 
               ylab = "residuals (ei)", 
               main = "Significant", 
               col = "steelblue",) + abline(0,0)

scat_2 <- plot(fitted.values(lm_2), resid(lm_2), 
               xlab = "fitted values", 
               ylab = "residuals (ei)", 
               main = "Not Significant", 
               col = "tomato" ) + abline(0,0)


#2_c. histogram of the regression residuals ei

histo_1 <- ggplot(lm_1, aes(resid(lm_1))) + 
                   geom_histogram(color="black", fill="steelblue")+
                   ggtitle("Significant")+
                   labs(x="residuals (ei)")+
                  ylim(0,50) +
                  theme(plot.title = element_text(size = 10, face = "bold"))

histo_2 <- ggplot(lm_2, aes(resid(lm_2))) + 
                  geom_histogram(color="black", fill="tomato")+
                  ggtitle("Not Significant")+
                  labs(x="residuals (ei)") +
                  ylim(0, 50) +
                  theme(plot.title = element_text(size = 10, face = "bold"))

grid.arrange(histo_1, histo_2, ncol=2,
             top = "Histograms of residuals")

#3 report the values of the estimated slope βˆ, the 95% CIs for β, the value of t, the degree of freedom df, and the p-value.

model_1 <- lm_1
model_2 <- lm_2

summary(model_1)
confint(model_1, "X",level= 0.95)

summary(model_2)
confint(model_2, "X",level= 0.95)

#4 Write the “decision” of the test, either rejection or not rejection of the Null Hypothesis, at 5% significance level.

print("Since the p-value for the 'model_1' dataset is below 0.05, the null hypothesis (H0) is rejected, meaning the model is significant. However, the p-value for the 'model_2' dataset is 0.6683 which is greater than 0.05, so the H0 is not rejected.")

#5 Write a conclusion to the test, i.e., one or two sentences in English in which you explain the results and describe the relationship or lack of relationship between X and Y .

print("There is significant relationship between X and Y for the model_1 dataset.On the other and, There is no significant relationship between X and Y for the model_2 dataset")


## Credit level

reg <- function(x) {
  fitting <- lm(x[[2]] ~ x[[1]], x)
  summary <- summary(fitting)
  coef <- coef(fitting)
  Intercept <- coef[1]
  Slope <-round(coef[2],6)
  f <- summary$fstatistic
  p <- round(pf(f[1],f[2],f[3],lower.tail=F),4)

  if(p > 0.05) {
    outcome <- glue::glue("The slope is {Slope}, and the p-value is {p}. As the p-valus is larger than 0.05, the null hypothesis is not rejected")
    print(outcome)}
  else {
    outcome <- glue::glue("The slope is {Slope}, and the p-value is {p}. As the p-valus is smaller than 0.05, the null hypothesis is rejected")
    print(outcome)
  }
}

reg(ex3_signif)
reg(ex3_not_signif)


## Distinction level

hypothesis <- function(x){
  return("Null hypothesis of the dataset is that the slope is 0 and X does not have an impact to Y. Althernative hypothesis is that the slope is not 0 and X have an impact to Y")
}


assumptions <- function(x){
  par(mfrow = c(1, 3))
  plot(x$X, x$Y, 
       xlab = "X", 
       ylab = "Y",
       col = "steelblue", 
       main = "Plot; Y vs X")
  model <- lm(Y~X, x)
  hist(resid(model), 
       main = "Histogram of Residuals",
       col = "tomato", border = "black")
  plot(fitted.values(model), resid(model), 
       xlab = "fitted values", 
       ylab = "residuals", 
       main = "Scattor plot; residuals vs fitted values")
  
  par(mfrow = c(1, 1))
}


fit <- function(x){
  regression <- lm(Y ~ X, x)
  summary(regression)
}


decision <- function(x) {
  f <- x$fstatistic
  p <- round(pf(f[1],f[2],f[3],lower.tail=F),4)
  if (p < 0.05) {
    return("Reject Null Hypothesis")
  } else {
    return("Do not reject Null Hypothesis")
  }
}


conclusion<- function(x){
  f <- x$fstatistic
  p <- round(pf(f[1],f[2],f[3],lower.tail=F),4)
  if( p < 0.05){
    return("There is significant relationship between X and Y.")
  }
  else{
    return("There is no significant relationship between X and Y")
  }
}

hypothesis(ex3_signif)
assumptions(ex3_signif)
fit1 <- fit(ex3_signif)
decision(fit1)
conclusion(fit1)

## High distinction level

mytest <- function(x){
  my_hypo <- hypothesis(name)
  cat('\n- Hypothesis-\n', my_hypo,'\n')
  cat('\n- Assumptions-\n')
  assumptions(x)
  f <- fit(x)$fstatistic
  p <- pf(f[1],f[2],f[3],lower.tail=F)
  cat('\n-Linear regression results-\n')
  cat('\np-value:', p,'\n')
  my_dec <- decision (fit1)
  cat('\n-Deicision-\n', my_dec,"\n")
  my_conc <- conclusion(fit1)
  cat('\n-Conclusion-\n', my_conc,"\n")
  
}

mytest(ex3_signif)
mytest(ex3_not_signif)

fit <- function(x){
  regression <- lm(Y ~ X, x)
  sum_mylm <- summary(regression)
  class(sum_mylm) <- 'mylm'
  return(sum_mylm)
}

decision.mylm <- function (x){
  mylm.decision <- decision(x)
  return(mylm.decision)
}

conclusion.mylm <- function (x){
  mylm.conclusion <- conclusion(x)
  return(mylm.conclusion)
}

decision.mylm(fit1)
conclusion.mylm(fit1)

fit2 <- fit(ex3_not_signif)
decision.mylm(fit2)
conclusion.mylm(fit2)


