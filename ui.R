## Sidebar 
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("laptop-code"))
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
                width = 3,
                title = "Distribution p",
                
                sliderInput("slider_m11", "Mean 1:", -3.0, 3.0, 0.0, step = h),
                sliderInput("slider_m12", "Mean 2:", -3.0, 3.0, 0.0, step = h),
                
                sliderInput("slider_s11", "Std 1:", 0.0, 3.0, 1.0, step = h),
                sliderInput("slider_s12", "Std 2:", 0.0, 3.0, 1.0, step = h),
                
                sliderInput("slider_n1", "n_1:", 1, 1000, 200),
              ),
              box(
                width = 3, 
                title = "Distribution q",
                sliderInput("slider_n2", "n_2:", 1, 1000, 200),
                selectInput(
                  "dist", "Distribution", list("Gaussian", "C-shape")
                )
              ),
              box(
                width = 3,
                title = "Controls",
                sliderInput("slider_var", "MMD var:", 0.0, 10.0, 1.0, step = h),
                radioButtons("bias", "Biased estimator:",
                             choiceNames = list("TRUE", "FALSE"),
                             choiceValues = list(TRUE, FALSE)),
                numericInput("seed", "RNG seed", 123, step = 1)
              )
            )
    )
  )
)

## UI
ui <- dashboardPage(
  dashboardHeader(title = "MMD dashboard"),
  sidebar,
  body
)
