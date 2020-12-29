#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(   fluidPage(
    headerPanel("TEXT WORDS APP PREDICTION"
    ),
    mainPanel(
        h3("DESCRIPTION OF THE APP"),
        p("Predictive algorithms have been among us for a long time now, almost 
          every cellphone has this feature, but also there are some other 
          advanced applications to text predictors."),
        p("This App takes a sample size of a data set and trough that it makes 
          an estimation of probabilities of possible next words, take the four 
          more probable words and show them in the screen so you can select the 
          word that correspond to what you want to say."),
        p("In order to use the application you must type something in the box, 
          as you begin typing the App is going to predict the next word, when 
          that happen you just need to select the word that you want with the 
          cursor with one click. To predict another word in a sentence you 
          should delete the previous text and write the new sentence."),
        p("This application was develop using natural language processing, 
          n-grams, Markov and Katz’s model."),
        h3("TEXT INPUT"),
        p("Type here your text in order to make the prediction"),
        textInput("inputTxt", "Type in word(s) below:", width = "90%"),
        uiOutput("words"),
        br(),
        wellPanel(
            h4("DOCUMENTATION"),
            p("The following is Slide Deck Presentation for the App"),
            HTML("<p> Slide Deck Presentation  <a href='http://rpubs.com/' target='_blank'>http://rpubs.com/</a></p>"),
            
        )
        
    )
))

