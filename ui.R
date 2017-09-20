#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(readr)
library(shiny)

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

shinyUI(fluidPage(
  titlePanel("REGION-WISE DISTRIBUTION OF OIL RIGS IN THE WORLD"),
  sidebarLayout(
    sidebarPanel(
      h2("Select from the below tabs to see the changes in the respective plots"),
      selectInput("YEARME", "PLOT 1 - CHOOSE YEAR", 
                  choices = names(Middleast[,2:7])),
      selectInput("ME", "PLOT 2 - CHOOSE MIDDLE-EAST COUNTRY", 
                  choices = names(Midd[2:11])),
      selectInput("YEARAF", "PLOT 3 - CHOOSE YEAR", 
                  choices = names(Africa[,2:7])),
      selectInput("AFR", "PLOT 4 - CHOOSE AFRICAN COUNTRY", 
                  choices = names(Midd[,13:22])),
      selectInput("YEARLT", "PLOT 5 - CHOOSE YEAR", 
                  choices = names(Latinamerica[,2:7])),
      selectInput("LTN", "PLOT 6 - CHOOSE LATIN AMERICAN COUNTRY", 
                  choices = names(Midd[,24:34])),
      selectInput("YEAREU", "PLOT 7 - CHOOSE YEAR", 
                  choices = names(Europe[,2:7])),
      selectInput("EUR", "PLOT 8 - CHOOSE EUROPEAN COUNTRY", 
                  choices = names(Midd[,36:53])),
      selectInput("YEARAP", "PLOT 9 - CHOOSE YEAR", 
                  choices = names(Asiapacific[,2:7])),
      selectInput("ASP", "PLOT 10 - CHOOSE ASIA-PACIFIC COUNTRY", 
                  choices = names(Midd[,55:66]))
    ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("WELCOME", br(),
                           h4("Hello user.",br(),"","This application helps you to analyse the rig counts around the World.I have divided the 10 plots into Region-wise segments. Choose your respective region of interest and input the year to see the changes in Oil Rig-Count between different countries in that respective region. You can also analyse each individual countries changes of the number of Oil Rigs with the help of the lower plot in each tab."),
                           h4(br(),"",br(), "Below are the changes of average Brent Oil Price between 2012 to 2017, and is said to be one of the major cause of fluctuation in rig counts. We can use this as a reference when going through the different plots"),
                           plotOutput("plot"),
                           h4("HAVE A GREAT DAY")),
                           
                  tabPanel("MIDDLE-EAST COUNTRIES - PLOT 1&2", br(),
                           h3("PLOT 1 - Compare Rig Count in Middle-East 2012/2017"),
                           h5("By choosing the required year from the respective tab, we can analyse the changes below."),
                           plotOutput("plot1"),
                           h3("PLOT 2 - Compare Rig Count of each Middle-East Countries 2012/2017"),
                           h5("By choosing the required country from the respective tab, we can analyse the changes below."),
                           h5("AVERAGE OIL PRICES", br(),"2012 - 109.45$/bbl",br(), "2013 - 105.87$/bbl",br(), "2014 - 96.29$/bbl",br(), "2015 - 49.49$/bbl",br(), "2016 - 40.68$/bbl",br(), "2017 - 49.83$/bbl"),
                           plotOutput("plot2")),
                  tabPanel("AFRICAN COUNTRIES - PLOT 3&4", br(),
                           h3("PLOT 3 - Compare Rig Count in Africa 2012/2017"),
                           h5("By choosing the required year from the respective tab, we can analyse the changes below."),
                           plotOutput("plot3"),
                           h3("PLOT 4 - Compare Rig Count of each African Countries 2012/2017"),
                           h5("By choosing the required country from the respective tab, we can analyse the changes below."),
                           h5("AVERAGE OIL PRICES", br(),"2012 - 109.45$/bbl",br(), "2013 - 105.87$/bbl",br(), "2014 - 96.29$/bbl",br(), "2015 - 49.49$/bbl",br(), "2016 - 40.68$/bbl",br(), "2017 - 49.83$/bbl"),
                           plotOutput("plot4")),
                  tabPanel("LATIN AMERICAN COUNTRIES - PLOT 5&6", br(),
                          h3("PLOT 5 - Compare Rig Count in Latin America 2012/2017"),
                          h5("By choosing the required year from the respective tab, we can analyse the changes below."),
                          plotOutput("plot5"),
                          h3("PLOT 6 - Compare Rig Count of each Latin American Countries 2012/2017"),
                          h5("By choosing the required country from the respective tab, we can analyse the changes below."),
                          h5("AVERAGE OIL PRICES", br(),"2012 - 109.45$/bbl",br(), "2013 - 105.87$/bbl",br(), "2014 - 96.29$/bbl",br(), "2015 - 49.49$/bbl",br(), "2016 - 40.68$/bbl",br(), "2017 - 49.83$/bbl"),
                          plotOutput("plot6")),
                 tabPanel("EUROPEAN COUNTRIES - PLOT 7&8", br(),
                          h3("PLOT 7 - Compare Rig Count in Europe 2012/2017"),
                          h5("By choosing the required year from the respective tab, we can analyse the changes below."),
                          plotOutput("plot7"),
                          h3("PLOT 8 - Compare Rig Count of each European Countries 2012/2017"),
                          h5("By choosing the required country from the respective tab, we can analyse the changes below."),
                          h5("AVERAGE OIL PRICES", br(),"2012 - 109.45$/bbl",br(), "2013 - 105.87$/bbl",br(), "2014 - 96.29$/bbl",br(), "2015 - 49.49$/bbl",br(), "2016 - 40.68$/bbl",br(), "2017 - 49.83$/bbl"),
                          plotOutput("plot8")),
                 tabPanel("ASIA PACIFIC COUNTRIES - PLOT 9&10", br(),
                          h3("PLOT 9 - Compare Rig Count in Asia Pacific 2012/2017"),
                          h5("By choosing the required year from the respective tab, we can analyse the changes below."),
                          plotOutput("plot9"),
                          h3("PLOT 10 - Compare Rig Count of each Asia Pacific Countries 2012/2017"),
                          h5("By choosing the required country from the respective tab, we can analyse the changes below."),
                          h5("AVERAGE OIL PRICES", br(),"2012 - 109.45$/bbl",br(), "2013 - 105.87$/bbl",br(), "2014 - 96.29$/bbl",br(), "2015 - 49.49$/bbl",br(), "2016 - 40.68$/bbl",br(), "2017 - 49.83$/bbl"),
                          plotOutput("plot10")))
 
    ),
    position = c("right")
  )))