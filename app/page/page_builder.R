import("shiny")
import("shiny.semantic")
import("shiny.router")

export("page_template")

# This creates UI for the page.
page_template <- function(page_body, page_class, pages_text) {
  div(
    class = glue::glue("ui {page_class}"),
    div(
      class = "ui grid",
      div(
        class = "sixteen wide column content page-container",
        div(
          class = "ui segment",
          page_body
        )
      )
    )
  )
}
