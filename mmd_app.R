require(EasyMMD)
require(shinydashboard)
source('ui.R')
source('server.R')

shinyApp(ui, server)
