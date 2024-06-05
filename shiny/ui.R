## app.R ##
library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)


dashboardPage(skin = "blue",
  dashboardHeader(title = "Consommation Alcool"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Stats", tabName = "Stats", icon = icon("list-alt")),
      menuItem("Graphiques", tabName = "Graphiques", icon = icon("bar-chart")),
      selectInput("age", "Age Group:", sort(unique(tableMat_filtered$age)), multiple = TRUE),
      selectInput("sex", "Sex:", sort(unique(tableMat_filtered$sex)), multiple = TRUE)
    
    )
  ),
  dashboardBody(
    tabItems(
      # Stats tab content
      tabItem(tabName = "Stats",
              fluidRow(
                valueBoxOutput("individusBox"),
                valueBoxOutput("dimensionscolsBox"),
                valueBoxOutput("dimensionsrowsBox")),
              fluidRow(infoBoxOutput("averageAgeBox"),
                       infoBoxOutput("proportionWomenBox"),
                       infoBoxOutput("proportionMenBox"))
      ),
      
      # Second tab content
      tabItem(tabName = "Graphiques",
              fluidRow(
                box(  
                  title = "Consommation d'alcool le weekend par sexe", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("alcoholWeekendBysexPlot", height = 250)),
                
                box(  
                  title = "Consommation d'alcool la semaine par sexe", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("alcoholWeekBysexPlot", height = 250))
              ),
              fluidRow(
                box(  
                  title = "Consommation d'alcool le weekend par age", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("alcoholWeekendByagePlot", height = 250)),
                box(  
                  title = "Consommation d'alcool la semaine par age", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("alcoholWeekByagePlot", height = 250))
                
              )
      )
    )
  )
)



