shinyServer(function(input, output) {
        model1 <- lm(weight ~ Time, data=ChickWeight)
        model2 <- lm(weight ~ factor(Diet) + Time, data=ChickWeight)
        
        model1pred <- reactive({
                TimeInput <- input$sliderTime
                predict(model1, newdata = data.frame(Time = TimeInput))
        })
        
        model2pred <- reactive({
                TimeInput <- input$sliderTime
                predict(model2, newdata = 
                                data.frame(Time = TimeInput,
                                           Diet = input$numeric))
        })
        output$plot1 <- renderPlot({
                TimeInput <- input$sliderTime
                
                plot(ChickWeight$Time, ChickWeight$weight, xlab = "Time", 
                     ylab = "Weight", bty = "n", pch = 16,
                     xlim = c(0, 21), ylim = c(35, 373))
                if(input$showModel1){
                        abline(model1, col = "red", lwd = 2)
                }
                if(input$showModel2){
                        model2lines <- predict(model2, newdata = data.frame(
                                Time = 0:21, Diet = input$numeric
                        ))
                        lines(0:21, model2lines, col = "blue", lwd = 2)
                }
                legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
                       col = c("red", "blue"), bty = "n", cex = 1.2)
                points(TimeInput, model1pred(), col = "red", pch = 16, cex = 2)
                points(TimeInput, model2pred(), col = "blue", pch = 16, cex = 2)
        })
        
        output$pred1 <- renderText({
                model1pred()
        })
        
        output$pred2 <- renderText({
                model2pred()
        })
})