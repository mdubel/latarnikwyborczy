library(shiny)
library(shinyWidgets)
library(dplyr)
library(DT)
library(plotly)
library(shinydashboard)

dashboardPage(title = "Demo",
              dashboardHeader(
                title = "Demo", #tags$img(src="logo.svg"),
                titleWidth = 150
              ),
              dashboardSidebar(
                width = 150,
                sidebar$ui("sidebar")
              ),
              dashboardBody(
                tags$head(
                  tags$link(rel = "stylesheet", type = "text/css", href = "css/general.css")
                ),
                home$ui("home")
              )
)