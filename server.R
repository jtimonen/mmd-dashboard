sample_gaussian <- function(n, m, s) {
  x1 <- stats::rnorm(n, m[1], s[1])
  x2 <- stats::rnorm(n, m[2], s[2])
  x <- cbind(x1, x2)
  return(x)
}

sample_c <- function(n, sigma, R) {
  t <- seq(0, pi, length.out = n)
  x1 <- R*cos(t) + stats::rnorm(n, 0, sigma)
  x2 <- R*sin(t) + stats::rnorm(n, 0, sigma)
  x <- cbind(x1, x2)
  return(x)
}

server <- function(input, output) {
  pch <- 16
  S <- 6
  output$plot1 <- renderPlot({
    set.seed(input$seed)
    m1 <- c(input$slider_m11, input$slider_m12)
    m2 <- c(0, 0)
    s1 <- c(input$slider_s11, input$slider_s12)
    s2 <- c(1, 1)
    n1 <- input$slider_n1
    n2 <- input$slider_n2
    var <- input$slider_var
    if (input$dist == "Gaussian") {
      y <- sample_gaussian(n2, m2, s2)
    } else {
      y <- sample_c(n2, 0.2, 2.0)
    }
    x <- sample_gaussian(n1, m1, s1)
    mmd <- MMD(x, y, var = var*diag(2), bias = input$bias)
    lab <- if (input$bias) "MMD = " else "MMD_u = "
    mmd <- paste0(lab, round(mmd, 5))
    plot(x[,1], x[,2], pch = pch, col = "firebrick", main = mmd,
         xlim = c(-S,S), ylim = c(-S,S), 
         xlab = expression(x[1]), ylab = expression(x[2]))
    points(y[,1], y[,2], pch = pch, col = "#2081f9")
  })
}
