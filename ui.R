library(shiny)
library(ggplot2)


shinyUI(
    navbarPage("Wave superposition Illustrator",  
               tabPanel("Plot",  
                        h2("Wave superposition Illustrator"),
                        p("Change amplitude, frequency and phase of two individual waves and see how the superposition and individual waves change."),
                        p("For more details, please click the 'Documentation for this App' tab."),
                        plotOutput('plot',width="100%"),
                        
                        hr(),
                        fixedRow(
                          column(3,                       
                                 selectInput('clr', 'Color for plot:', c("Red","Blue","Green"))
                          ),
                          
                          column(4, 
                                 withMathJax("$$\\text{Wave 1: }A\\sin(2\\pi ft + \\varphi)$$"),
                                 sliderInput('w1_a', 'Amplitude', 
                                             min=0, max=10, 
                                             value=1, 
                                             step=1, round=0),
                                 sliderInput('w1_f', withMathJax("$$\\text{Frequency }f$$"),
                                             min=0, max=10, 
                                             value=1, 
                                             step=1, round=0),
                                 sliderInput('w1_p', withMathJax("$$\\text{Phase }\\varphi$$"), 
                                             min=0, max=2*pi, 
                                             value=0, 
                                             step=0.1, round=1)                                                       
                          ),
                          
                          column(5, 
                                 withMathJax("$$\\text{Wave 2: }A\\sin(2\\pi ft + \\varphi)$$"),
                                 sliderInput('w2_a', 'Amplitude', 
                                             min=0, max=10, 
                                             value=1, 
                                             step=1, round=0),
                                 sliderInput('w2_f', withMathJax("$$\\text{Frequency }f$$"),
                                             min=0, max=10, 
                                             value=5, 
                                             step=1, round=1),
                                 sliderInput('w2_p', withMathJax("$$\\text{Phase }\\varphi$$"), 
                                             min=0, max=2*pi, 
                                             value=0, 
                                             step=0.1, round=1)       
                          )

                        )                        
        ),
    
        tabPanel("Documentation for this App",
             mainPanel(
               includeMarkdown("include.Rmd")
             )
        )
    )             
)

