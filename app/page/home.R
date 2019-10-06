import("shiny")
import("shiny.semantic")

export("ui")
export("init_server")

page_builder <- use("page/page_builder.R")
home_fun <- use("logic/home_fun.R")

ui <- function(id) {
  ns <- NS(id)
  ui_body <- div(
    uiOutput(ns("text"))
  )

  page_builder$page_template(ui_body, "home-wrapper")
}

init_server <- function(id) {
  callModule(server, id)
}

server <- function(input, output, session) {
  ns <- session$ns
  output$text <- renderUI(tags$p(home_fun$home_text("Example of server")))
}
