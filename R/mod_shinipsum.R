#' shinipsum UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_shinipsum_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      fluidRow(
        column(width = 5,
               h2("환영합니다.")),
        br(),br(),br()
      ),
      fluidRow(
        column(width = 10,
               shinydashboard::box(
                 background = "blue",
                 h2("첫 타이틀"),
                 title = "Congrats!"),
               br(), br(), br(), br()
        )),
      fluidRow(
        shinydashboard::box(
          title = "인터랙티브 표",
          width = 6,
          DT::dataTableOutput(ns('data_table'))),
        shinydashboard::box(
          title = "그래프",
          width = 6,
          plotOutput(ns("plot"))
        )
      )
    )
  )
}

#' shinipsum Server Functions
#'
#' @noRd
mod_shinipsum_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$data_table <- DT::renderDT({
      shinipsum::random_DT(5, 3, "numeric")
    })

    output$plot <- renderPlot({
      shinipsum::random_ggplot(type = "line")
    })

  })
}

## To be copied in the UI
# mod_shinipsum_ui("shinipsum_1")

## To be copied in the server
# mod_shinipsum_server("shinipsum_1")
