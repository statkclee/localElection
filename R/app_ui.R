#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {

  tagList(
    tags$style("@import url(https://use.fontawesome.com/releases/v5.7.2/css/all.css);"),
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shinydashboard::dashboardPage(
      skin = "black",
      header = shinydashboard::dashboardHeader(
        title = "제8회 지방선거"
      ),

      shinydashboard::dashboardSidebar(
        id = "tabs",
        shinydashboard::sidebarMenu(
          shinydashboard::menuItem("입섭", tabName = "ipsum", icon = icon("tachometer-alt")),
          shinydashboard::menuItem("개요", icon = icon("th"), tabName = "overview")
        )
      ),
      shinydashboard::dashboardBody(

        shinydashboard::tabItems(
          shinydashboard::tabItem("ipsum", mod_shinipsum_ui("mod_shinipsum_1")),
          shinydashboard::tabItem("overview", mod_overview_ui("mod_overview_1"))
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "localElection"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
