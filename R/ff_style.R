#' Add Forsyth Futures' theme to ggplot chart
#'
#' This function allows you to add the Forsyth Futures' theme to your ggplotgraphics.
#' @keywords ff_static
#' @export
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'  ggplot2::geom_point() +
#'  ggplot2::labs(title = "Fuel economy declines as weight increases",
#'                subtitle = "Fuel economy declines as weight increases") +
#'  ff_static()

ff_static <- function(){

  # this is the same as Helvetica font
  font <- "sans"

  ggplot2::theme(

    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family=font,
                                       size=18,
                                       face="bold",
                                       color="#00000c",
                                       margin=ggplot2::margin(0, 0, 5, 0)),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family=font,
                                          size=16,
                                          margin=ggplot2::margin(5, 0, 25, 0)),
    plot.caption = ggplot2::element_blank(),
    #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=14,
                                        color="#00000c"),

    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    axis.title.x = ggplot2::element_text(family=font,
                                       size=14,
                                       color="#00000c", margin = ggplot2::margin(t = 10, r = 0, b = 0, l = 0)),
    axis.title.y = ggplot2::element_text(family=font,
                                         size=14,
                                         color="#00000c", margin = ggplot2::margin(t = 0, r = 20, b = 0, l = 0)),
    axis.text = ggplot2::element_text(family=font,
                                      size=12,
                                      color="#00000c"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),

    #Grid lines
    #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color="#d4d4d3"),
    panel.grid.major.x = ggplot2::element_blank(),

    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),

    #Strip background (This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = ggplot2::element_rect(fill="white"),
    strip.text = ggplot2::element_text(size = 12, hjust = 0)
  )
}

#' Add Forsyth Futures' theme to plotly chart
#'
#' This function allows you to add the Forsyth Futures' theming to your plotlygraphics.
#' @keywords ff_interactive
#' @export
#' @examples
#' p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'  ggplot2::geom_point() +
#'  ggplot2::labs(title = "Fuel economy declines as weight increases",
#'                subtitle = "Fuel economy declines as weight increases") +
#' ff_interactive(p)

ff_interactive <- function(plot){

 message("Do not use ff_static() before ff_interactive()")

 plotly::ggplotly(plot, tooltip = "text", width = 750, height = 550) %>%
   # remove plotly logo in the top right-hand corner
   # TODO removed unneeded features on modebar
   plotly::config(displaylogo = FALSE) %>%
   plotly::layout(margin = list(b = 90, t = 100),
                  yaxis = list(title = list(standoff = 20L), ticks = ""),
                  xaxis = list(title = list(standoff = 20L), ticks = ""),
                  font = list(family = "Helvetica"),
                  modebar = list(orientation = "v"),
                  images = list(
                    list(
                      source = "https://raw.githubusercontent.com/forsythfuture/FFTemplates/main/inst/rmarkdown/templates/data_request_template/skeleton/logo.png",
                      xref = "paper",
                      yref = "paper",
                      x = 1,
                      y = -0.2,
                      sizex = 0.15,
                      sizey = 0.15,
                      xanchor="right",
                      yanchor="bottom")
                    )
                  )
}
