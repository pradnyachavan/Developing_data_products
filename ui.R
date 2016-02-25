
library(shiny)
library(ggmap)
library(lubridate)
library(dplyr)
require(markdown)


# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  
  
  titlePanel("Mapping of types of Crime in San Francisco "),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      selectInput("Category", 
                  label= "Crime type:",
                  choices = c("WARRANTS",	"OTHER OFFENSES",	"LARCENY/THEFT",	"VEHICLE THEFT",	"VANDALISM",	
                              "NON-CRIMINAL",	"ROBBERY",	"ASSAULT",	"WEAPON LAWS",	"BURGLARY",	"SUSPICIOUS OCC",
                              "DRUNKENNESS",	"FORGERY/COUNTERFEITING",	"DRUG/NARCOTIC",	"STOLEN PROPERTY",	
                              "SECONDARY CODES",	"TRESPASS",	"MISSING PERSON",	"FRAUD",	"KIDNAPPING",	"RUNAWAY",
                              "DRIVING UNDER THE INFLUENCE",	"SEX OFFENSES FORCIBLE",
                              "PROSTITUTION",	"DISORDERLY CONDUCT",	"ARSON",	"FAMILY OFFENSES",
                              "LIQUOR LAWS",	"BRIBERY",	"EMBEZZLEMENT",	"SUICIDE",	"LOITERING",
                              "SEX OFFENSES NON FORCIBLE",	"EXTORTION",	"GAMBLING",	"BAD CHECKS",	"TREA",	
                              "RECOVERED VEHICLE",	"PORNOGRAPHY/OBSCENE MAT"),
                  selected = "WARRANTS"),
      
      radioButtons("Day_night", 
                   label= "Event time:",
                   c("PM" = "PM",
                     "AM" = "AM"),
                   selected = "AM"),
      
      selectInput("Dates", 
                  label= "Year:",
                  choices = c("2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003"),
                  selected = "2015"),
      
      textOutput("count"),
      h5("Case Resolution"),
      plotOutput("barplot")
      
      
      
    ),
    
  
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(type = "tabs",
        tabPanel( h4("Crime Locations"),plotOutput("distPlot",width = "100%")),
        tabPanel(h4("User Manual"),includeMarkdown("project_documentation.Rmd"))
                 )
    )
    
    
    
    
  )
))