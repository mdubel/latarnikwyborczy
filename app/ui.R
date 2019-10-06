tagList(
  tags$head(
    tags$script(src = "js/vendor/selectize.min.js")
  ),
  semanticPage(
    title = "App template",
    div(class = "ui container",
        style = "margin-top: 1em",
        div(class = "ui grid",
            div(class = "twelve wide column",
                div(class = "ui segment",
                    home$ui("home")
                )
            )
        )
    )
  )
)
