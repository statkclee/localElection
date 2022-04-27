#' 지방선거 개요 UI 함수
#'
#' @description 지방선거 웹앱 설명.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#'
mod_overview_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("제8회 지방선거 대쉬보드"),
    hr(),
    h2("개발조직"),
    br(),
    tags$div(
      tags$ul(
        tags$li("한국 R 사용자회")
      )
    ),
    h2("데이터"),
    br(),
    tags$div(
      tags$ul(
        tags$li("중앙선거관리 위원회"),
        tags$li("중앙여론조사 심의위원회"),
        tags$li("공공데이터 포털")
      )
    ),
    h2("개발환경"),
    br(),
    tags$div(
      tags$ul(
        tags$li("shiny"),
        tags$li("golem"),
        tags$li("shinydashboard")
      )
    ),
    h2("개발범위"),
    br(),
    tags$div(
      tags$ul(
        tags$li("성남시장"),
        tags$li("경기지사")
      )
    )
  )
}

#' 지방선거 개요 서버 함수
#'
#' @noRd
mod_overview_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_overview_ui("overview_1")

## To be copied in the server
# mod_overview_server("overview_1")
