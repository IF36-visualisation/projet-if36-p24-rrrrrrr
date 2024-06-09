library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)

library(grid)
library(gridExtra) 


#Prepare the data for the exploration

      #Je n'ai maintenant que besoin de goout, Dalc, Walc, age et sex donc je garde les colonnes qui m'interesse pour économiser les traitements
      tableMat1 <- tableMat[,c("goout","Dalc","Walc","age","sex")]
      head(tableMat1)
      
      
      #Personnes sortant fréquemment
      tableMat_filtered <- tableMat1 %>% filter(goout > 4)
      
      #Personnes sortant beaucoup
      freq_dalc <- table(tableMat_filtered$Dalc)
      total <- sum(freq_dalc)
      freq_dalc <- (freq_dalc / total) * 100
      
      freq_walc <- table(tableMat_filtered$Walc)
      total_walc <- sum(freq_walc)
      freq_walc <- (freq_walc / total_walc) * 100
      
      
      notes <- c(1, 2, 3, 4, 5)
      df_dalc <- data.frame(notes = factor(notes), frequences = freq_dalc)
      df_walc <- data.frame(notes = factor(notes), frequences = freq_walc)
      
      #personnes ne sortant pas beaucoup
      
      tableMat_filtered_inf <- tableMat %>% filter(goout < 4)
      
      freq_dalc_inf <- table(tableMat_filtered_inf$Dalc)
      total_inf <- sum(freq_dalc_inf)
      freq_dalc_inf <- (freq_dalc_inf / total_inf) * 100
      
      freq_walc_inf <- table(tableMat_filtered_inf$Walc)
      total_walc_inf <- sum(freq_walc_inf)
      freq_walc_inf <- (freq_walc_inf / total_walc_inf) * 100
      
      
      df_dalc_inf <- data.frame(notes = factor(notes), frequences = freq_dalc_inf)
      df_walc_inf <- data.frame(notes = factor(notes), frequences = freq_walc_inf)




# Define server logic required to draw a histogram
function(input, output, session) {

  set.seed(122)
  histdata <- rnorm(500)
  
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  #Make the data reactive from the slider (nbr of observations)
  
  reactive_data_step1_age <- reactive({
    req(input$age) # Require input
    tableMat_filtered %>% filter(age %in% input$age)}) # Filter full dataset by AgeGroup input
  
  reactive_data_step2_sex <- reactive({
    req(input$sex) # Require input
    reactive_data_step1_age() %>% filter(sex %in% input$sex) # Filter full dataset by Sex input
  })
 
  
  #Outputs
  
  
  #Alcohol by sex in weekend plot
  output$alcoholWeekendBysexPlot <- renderPlot({
    
    # Require reactive_data_step2_sex
    req(reactive_data_step2_sex())
    
    
    # Create summary_data using reactive_data_step2_sex
    summary_data <- reactive_data_step2_sex() %>%
      group_by(Walc, sex) %>%
      summarise(count = n()) %>%
      ungroup()
    
    # Create the stacked bar chart
    ggplot(summary_data, aes(x = factor(Walc), y = count, fill = sex)) +
      geom_bar(stat = "identity", position = "stack") +
      labs(x = "Consommation d'alcool le weekend (Walc)", y = "Nombre d'individus", title = 
             "Consommation d'alcool le week-end chez les personnes sortant souvent par sexe") +
      scale_fill_manual(values = c("yellow3", "mediumpurple"), labels = c("Femme", "Homme")) +
      labs(fill = "Sexe") +
      theme_minimal() 
  })
  
  #Alcohol by sex in week plot
  output$alcoholWeekBysexPlot <- renderPlot({
    
    # Require reactive_data_step2_sex
    req(reactive_data_step2_sex())
    
    
    # Create summary_data using reactive_data_step2_sex
    summary_data <- reactive_data_step2_sex() %>%
      group_by(Dalc, sex) %>%
      summarise(count = n()) %>%
      ungroup()
    
    # Create the stacked bar chart
    ggplot(summary_data, aes(x = factor(Dalc), y = count, fill = sex)) +
      geom_bar(stat = "identity", position = "stack") +
      labs(x = "Consommation d'alcool en semaine (Dalc)", y = "Nombre d'individus", title = 
             "Consommation d'alcool la semaine chez les personnes sortant souvent par sexe") +
      scale_fill_manual(values = c("yellow3", "mediumpurple"), labels = c("Femme", "Homme")) +
      labs(fill = "Sexe") +
      theme_minimal() 
  })

  #Alcohol by age in weekend plot
  output$alcoholWeekendByagePlot <- renderPlot({
    
    # Require reactive_data_step2_sex
    req(reactive_data_step2_sex())
    
    
    summary_data <- reactive_data_step2_sex() %>%
      group_by(Walc, age) %>%
      summarise(count = n()) %>%
      ungroup()
    
    # Créer le graphique à barres empilées
    ggplot(summary_data, aes(x = factor(Walc), y = count, fill = factor(age))) +
      geom_bar(stat = "identity", position = "stack") +
      scale_fill_manual(values = c("#FF0000","#FF4500", "#FF6347", "#99FFFF", "#00ccFF", "#0000FF"),
                        labels = c("15 ans", "16 ans", "17 ans", "18 ans", "19 ans", "22 ans")) +
      labs(x = "Consommation d'alcool le weekend (Walc)", y = "Nombre d'individus", title = "Consommation d'alcool le weekend chez les personnes sortant souvent par sexe") +
      labs(fill = "Age") +
      theme_minimal()
  })    
  
  #Alcohol by age in week plot
  output$alcoholWeekByagePlot <- renderPlot({
    
    # Require reactive_data_step2_sex
    req(reactive_data_step2_sex())
    
    
    summary_data <- reactive_data_step2_sex() %>%
      group_by(Dalc, age) %>%
      summarise(count = n()) %>%
      ungroup()
    
    # Créer le graphique à barres empilées
    ggplot(summary_data, aes(x = factor(Dalc), y = count, fill = factor(age))) +
      geom_bar(stat = "identity", position = "stack") +
      scale_fill_manual(values = c("#FF0000","#FF4500", "#FF6347", "#99FFFF", "#00ccFF", "#0000FF"),
                        labels = c("15 ans", "16 ans", "17 ans", "18 ans", "19 ans", "22 ans")) +
      labs(x = "Consommation d'alcool la semaine (Dalc)", y = "Nombre d'individus", title = "Consommation d'alcool la semaine chez les personnes sortant souvent par sexe") +
      labs(fill = "Age") +
      theme_minimal()
  })    
  
  
  
  #Value boxes
  
  output$individusBox <- renderValueBox({
    valueBox(paste0( max(input$age), " Ans"), "Groupe d'âge le plus élevé", icon = icon("list", lib = "glyphicon"),
             color = "red")
  })
  
  output$dimensionscolsBox <- renderValueBox({
    valueBox(ncol(reactive_data_step2_sex()), "Nombre de colonnes du dataset sélectionné", icon = icon("book", lib = "glyphicon"),
             color = "orange")
  })
  
  output$dimensionsrowsBox <- renderValueBox({
    valueBox(nrow(reactive_data_step2_sex()), "Nombre d'individus sélectionnés", icon = icon("book", lib = "glyphicon"),
             color = "orange")
  })
  
  output$averageAgeBox <- renderInfoBox({
    avg_age <- mean(reactive_data_step2_sex()$age, na.rm = TRUE)
    infoBox("Age moyen", paste0( round(avg_age), " Ans"), icon = icon("arrow-up"), color = "blue")
  })
  
  output$proportionWomenBox <- renderInfoBox({
    
    girls_selected <- reactive_data_step2_sex() %>%
      filter(sex == "F")

    infoBox("Proportion de femmes", paste0( round((nrow(girls_selected)/nrow(reactive_data_step2_sex()) )* 100), "%"), icon = icon("weight-hanging"), color = "black")
  })
  
  output$proportionMenBox <- renderInfoBox({
    
    men_selected <- reactive_data_step2_sex() %>%
      filter(sex == "M")
    
    infoBox("Proportion d'hommes", paste0( round((nrow(men_selected)/nrow(reactive_data_step2_sex()) )* 100), "%"), icon = icon("weight-hanging"), color = "black")
  })

}
