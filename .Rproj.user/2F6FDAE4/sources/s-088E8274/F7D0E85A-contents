
library(shiny)
library(shinybrowser)
library(highcharter)
library(DT)

ui <- navbarPage(
  div(div(
    id = "nav_logo",
    img(src = "peng-logo.png")
  ), "Mfano"
  ),
  id = "tabs",
  tags$head(includeCSS("www/custom.css")),
  collapsible = TRUE,
  tabPanel("About", 
           shiny::includeHTML("www/about.html")),
  tabPanel("Kwanza", 
           fluidRow(style = "height: 2vh"),
           fluidRow(
             column(6, offset = 3 ,
                    highchartOutput("kwanza_graph"))
           )),
  tabPanel("Pili", 
           fluidRow(
             id = "pili_output",
             column(5,
                    highchartOutput("pili_graph")),
             
             column(4, offset = 2, 
                    DTOutput("pili_table"))
             )
           ),
  tabPanel("Tatu", 
           column(6, offset = 3 ,
                  highchartOutput("tatu_graph"))),
  detect() 
  )

