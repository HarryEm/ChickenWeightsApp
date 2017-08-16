library(shiny)

shinyUI(fluidPage(
        titlePanel("Predict Chicken Weight over time"),
        sidebarLayout(
                sidebarPanel(
                        numericInput("numeric", "Which Diet are you predicting on for model 2?", 
                                     value = 1, min = 1, max = 4, step = 1),
                        sliderInput("sliderTime", "What is the time?", 0, 21, value = 0),
                        checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
                        checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
                        submitButton("Submit") # New!
                ),
                mainPanel(
                        h3("Documentation explaining how to use this app:"),
                        h5("The below interactive chart makes use of the ChickenWeight
                           dataset to predict what the weight of a chick in grams will 
                           be on a given day, here the Time variable, using a simple linear
                           model of weight vs time, model 1, and a more complex model which also
                           includes one of four diet types, model 2. Please enter the day you want to
                           predict a weight for and which diet you would like to use in the case
                           of the more complex model to compare results. You can also change the
                           diet you are predicting on to see how we expect this to affect weight
                           for a given day."),
                        plotOutput("plot1"),
                        h3("Predicted Weight from Model 1:"),
                        textOutput("pred1"),
                        h3("Predicted Weight from Model 2:"),
                        textOutput("pred2")
                )
        )
))
