## Sidebar 
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("laptop-code")),
    menuItem("MMD", tabName = "mmd", icon = icon("subscript"))
  )
)

## Body content
h <- 0.05
body <- dashboardBody(
  tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(plotOutput("plot1", height = 550)),
              
              box(
                title = "Controls",
                
                sliderInput("slider_m11", "Mean 1:", -3.0, 3.0, 0.0, step = h),
                sliderInput("slider_m12", "Mean 2:", -3.0, 3.0, 0.0, step = h),
                
                sliderInput("slider_s11", "Std 1:", 0.0, 3.0, 1.0, step = h),
                sliderInput("slider_s12", "Std 2:", 0.0, 3.0, 1.0, step = h),
                
                sliderInput("slider_n1", "n_1:", 1, 500, 200),
                sliderInput("slider_n2", "n_2:", 1, 500, 200),
                sliderInput("slider_var", "MMD var:", 0.0, 10.0, 1.0, step = h)
              )
            )
    ),
    
    # Second tab content
    tabItem(tabName = "mmd",
            h2("Empty tab")
    )
  )
)

## UI
ui <- dashboardPage(
  dashboardHeader(title = "MMD dashboard"),
  sidebar,
  body
)
