library(UsingR)
data(galton)
shinyServer(
  function(input, output) {
    output$Histogram <- renderPlot({
      hist(galton$parent, xlab='Parent height', col='firebrick1',main='Exploratory Data Analysis',xlim=c(64,74),ylim=c(0,250))
      avg <- input$avg
      lines(c(avg, avg), c(0, 220),col="yellow",lwd=4)
      mse <- mean((galton$parent - avg)^2)
      t_values = t.test(galton$parent,mu=avg)
      text(69, 250, paste('Average            = ', avg))
      text(72,250,paste('Metrics'))
      text(72, 230, paste("P-value of t-test   = ",round(t_values$p.value,18)))
      text(72, 210, paste("T-statistic of t-test   = ", round(t_values$statistic, 2)))
      text(72, 190, paste("Mean Squared Error = ", round(mse, 2)))
    })
  }
)
