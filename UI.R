shinyUI(fluidPage(


  
  headerPanel("Shiny Application"),

  mainPanel(
    tabsetPanel(
      tabPanel("Main Tab", h1('Input'),
               h3('Please use the slidebar to guess a value for the mean:'),
               sliderInput('avg', '',value = 70, min = 64, max = 73, step = 0.05,),
               h1('Output'),
               plotOutput("Histogram")
               
               
               ),
      tabPanel("Documentation", 
               h1('Documentation of the Shiny Application'),
               h3('Summary'),
               "This application is a simple prediction algorithm based on the example provided in the Lectures Slides",
              h3('Input Data'),               
'It uses the galton dataset provided in UsingR package which consists tabulated data set used by Galton in 1885 to study the relationship between a parent\'s height and their childrens',
h3('Usage'),
'The application consists of the Input and the Output sections:',
h4('Input'),
'The user scrolls the sliderbar so as to guess the average height of the parents',
h4('Output'),
'A histogram of the distribution of the parents\' heights appears and the values of the following parameters:',               
h5('Average: The value that the user has selected in the slidebar.'),
h5('p-value: The p-value of the t-test that was conducted against the alternative hypothesis that the mean is not equal to the input mean '),
h5('t-statistic: The t-statistic of the t-test described above.'),
h5('Mean Squared Error: The MSE of the difference of the input vs the real mean')               )
    )
  )
  
  )
)
