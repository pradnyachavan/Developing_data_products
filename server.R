
source("datarep.R")
server <- shinyServer(function(input, output) {
  
  
  
  
  output$distPlot <- renderPlot({
    crime2<-subset(crime , Category == input$Category & Day_night == input$Day_night &  year(mdy(crime$Dates)) == input$Dates )
    map <- qmap('san francisco',zoom=12)
    map + geom_point(data = crime2, aes(x = X, y = Y, color="crime type"))
  })
  
  
  output$count <- renderText({ 
    crime2<-subset(crime , Category == input$Category & Day_night == input$Day_night &  year(mdy(crime$Dates)) == input$Dates )
    paste("Total no. of cases :",nrow(crime2))
  })
  
  
  output$barplot <- renderPlot({ 
    crime2<-subset(crime , Category == input$Category & Day_night == input$Day_night &  year(mdy(crime$Dates)) == input$Dates )
    par(mar = c(4,14,2,0.5))
    barplot(sort(table(crime2$Resolution)),decrasing=TRUE,space = 0.5,las=2,cex.names = 0.6,horiz=TRUE,col = "navy")
  })
  
  
})

