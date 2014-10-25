library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  
  output$plot <- reactivePlot(function() {
    par(mfrow=c(1,3)) 
    
    a1 <- input$w1_a
    a2 <- input$w2_a
    f1 <- input$w1_f
    f2 <- input$w2_f
    p1 <- input$w1_p
    p2 <- input$w2_p
    
    t <- seq(0, 1, by=0.01)
    y1 <- a1*sin(2*pi*f1*t+p1)
    y2 <- a2*sin(2*pi*f2*t+p2)
    y3 <- a1*sin(2*pi*f1*t+p1) + a2*sin(2*pi*f2*t+p2)
    plot(t, y1, type="l", xlab="t", ylab="", main="Wave 1",col=input$clr, cex.lab=2, cex.axis=2,cex.main=2) 
    plot(t, y2, type="l", xlab="t", ylab="", main="Wave 2",col=input$clr,cex.lab=2, cex.axis=2,cex.main=2) 
    plot(t, y3, type="l", xlab="t", ylab="", main="Superposition of Two Waves",col=input$clr,cex.lab=2, cex.axis=2,cex.main=2) 
        
  }, height=400)
  
})
