#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

Middle <- read_csv("MiddleEast-RigCount.csv")
Middle <- data.frame(Middle)
names(Middle) <- gsub("X","", names(Middle))
Middleast <- Middle[1:10,1:7]
Africa <-Middle[1:10, 8:14]
names(Africa) <-gsub("_1","", names(Africa))
Latinamerica<- Middle[1:11,15:21]
names(Latinamerica) <-gsub("_2","", names(Latinamerica))
Europe <- Middle[1:18,22:28]
names(Europe) <-gsub("_3","", names(Europe))
Asiapacific <- Middle[1:12,29:35]
names(Asiapacific) <-gsub("_4","", names(Asiapacific))
Price <- Middle[1:6, 36:37]

Midd <- read_csv("Midd.csv", col_types = cols(Date = col_character()))
Midd <- data.frame(Midd)

options(shiny.sanitize.errors = FALSE)


library(graphics)
library(shiny)

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    plot(Price$Year, Price$Price....bbl., type = "b", col = "red", xlab = "Year", ylab = "Price in $/bbl", main = "Average Brent Oil Prices")
  })
  
  output$plot1 <- renderPlot({
    barplot(Middleast[,input$YEARME], names.arg = Middleast$MIDDLE.EAST, xlab = "Middle-East Countries", ylab = "Number of Rigs", border = "Red", col = "blue", density = 10, cex.names = 0.7)
  })
  output$plot2 <- renderPlot({
    barplot(Midd[,input$ME], names.arg = Midd$MIDDLE.EAST, xlab = "Years", ylab = "Number of Rigs", border = "blue", col = "red", density = 10)
  })
  output$plot3 <- renderPlot({
    barplot(Africa[,input$YEARAF], names.arg = Africa$AFRICA, xlab = "African Countries", ylab = "Number of Rigs", border = "Red", col = "blue", density = 10, cex.names = 0.7)
  })
  output$plot4 <- renderPlot({
    barplot(Midd[,input$AFR], names.arg = Midd$AFRICA, xlab = "Years", ylab = "Number of Rigs", border = "blue", col = "red", density = 10)
  })
  output$plot5 <- renderPlot({
    barplot(Latinamerica[,input$YEARLT], names.arg = Latinamerica$Latin.America, xlab = "Latin American Countries", ylab = "Number of Rigs", border = "Red", col = "blue", density = 10, cex.names = 0.7)
  })
  output$plot6 <- renderPlot({
    barplot(Midd[,input$LTN], names.arg = Midd$Latin.America, xlab = "Years", ylab = "Number of Rigs", border = "blue", col = "red", density = 10)
  })
  output$plot7 <- renderPlot({
    barplot(Europe[,input$YEAREU], names.arg = Europe$EUROPE, xlab = "European Countries", ylab = "Number of Rigs", border = "Red", col = "blue", density = 10, cex.names = 0.6)
  })
  output$plot8 <- renderPlot({
    barplot(Midd[,input$EUR], names.arg = Midd$EUROPE, xlab = "Years", ylab = "Number of Rigs", border = "blue", col = "red", density = 10)
  })
  output$plot9 <- renderPlot({
    barplot(Asiapacific[,input$YEARAP], names.arg = Asiapacific$ASIA.PACIFIC, xlab = "Asia Pacific Countries", ylab = "Number of Rigs", border = "Red", col = "blue", density = 10, cex.names = 0.6)
  })
  output$plot10 <- renderPlot({
    barplot(Midd[,input$ASP], names.arg = Midd$ASIA.PACIFIC, xlab = "Years", ylab = "Number of Rigs", border = "blue", col = "red", density = 10)
  })
})
