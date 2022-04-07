
#Left align text
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

create_footer <- function(source_name){
  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(source_name,
                                          x = 0.004, hjust = 0, gp = grid::gpar(fontsize=16)),
                           grid::rasterGrob(png::readPNG('https://raw.githubusercontent.com/forsythfuture/FFTemplates/main/inst/rmarkdown/templates/data_request_template/skeleton/logo.png'), x = 0.944))
  return(footer)
}

#' Arrange alignment and create Forsyth Futures ggplot chart
#'
#' It will left align your title, subtitle and source, add the Forsyth Futures blocks at the bottom right and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your side
#' @return (Invisibly) an updated ggplot object.

#' @keywords ff_ggplot
#' @export
#' @examples
#' ff_ggplot(plot_name = myplot, source = "The source for my data")

ff_ggplot <- function(plot_name, source_name){

  footer <- create_footer(source_name)

  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.045/(height_pixels/450)))
  ## Return (invisibly) a copy of the graph. Can be assigned to a
  ## variable or silently ignored.
  # invisible(plot_grid)
}

#' Add Forsyth Futures' theme to plotly chart
#'
#' This function allows you to convert a ggplot plot into an interactive plotlygraphic with Forsyth Futures' theming.
#' @keywords ff_ggplotly
#' @export
#' @examples
#' p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point(ggplot2::aes(text = paste0(
#'     "wt: ", wt, "<br>",
#'     "mpg: ", mpg, "<br>"))) +
#'   ggplot2::labs(title = "Fuel economy declines as weight increases",
#'                 subtitle = "Fuel economy declines as weight increases")
#' ff_ggplotly(ggplot_name = p)

ff_ggplotly <- function(ggplot_name){

  message("Do not use ff_style() before ff_ggplotly()")

  plotly::ggplotly(ggplot_name, tooltip = "text", width = 750, height = 550) %>%
    # remove plotly logo in the top right-hand corner
    # TODO removed unneeded features on modebar
    plotly::config(displaylogo = FALSE) %>%
    plotly::layout(margin = list(b = 90, t = 100),
                   yaxis = list(title = list(standoff = 20L), ticks = ""),
                   xaxis = list(title = list(standoff = 20L), ticks = ""),
                   font = list(family = "Helvetica"),
                   modebar = list(orientation = "v"),
                   plot_bgcolor = '#FFFFFF',
                   paper_bgcolor = '#FFFFFF',
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
