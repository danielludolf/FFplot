
# left align text
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

# function that allows for Forsyth Futures logo to be added in the bottom right corner of plots
create_footer <- function(source_name){
  #Make the footer
  footer <- grid::grobTree(# add horizontal line between plot and logo/source
                           # grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           # adds source name in bottom left corner
                           grid::textGrob(source_name,
                                          x = 0.004,
                                          hjust = 0,
                                          gp = grid::gpar(fontsize=8)),
                           # adds Forsyth Futures logo in the bottom right
                           grid::rasterGrob(as.raster(magick::image_read('https://raw.githubusercontent.com/forsythfuture/FFTemplates/main/inst/rmarkdown/templates/data_request_template/skeleton/logo.png')),
                                            x = 0.944)
                           )
  return(footer)
}

#' Create Forsyth Futures' themed ggplot graph
#'
#' This function allows you to create a static ggplot graph with Forsyth Futures' theming.
#' @param plot_name The object name of the plot you have created that you want to format
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your plot

#' @keywords ff_ggplot
#' @export
#' @examples
#' p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point() +
#'   ggplot2::labs(title = "Fuel economy declines as weight increases",
#'                 subtitle = "Fuel economy declines as weight increases")
#' ff_ggplot(plot_name = p, source = "The source for my data")

ff_ggplot <- function(plot_name, source_name){

  footer <- create_footer(paste0('Source: ', source_name))

  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(0.6, 0.045/(550/450)))
  plot_grid
}

#' Create Forsyth Futures' themed plotly graph
#'
#' This function allows you to convert a ggplot graph into an interactive plotly graphic with Forsyth Futures' theming.
#' @param plot_name The object name of the plot you have created that you want to format
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your plot

#' @keywords ff_ggplotly
#' @export
#' @importFrom magrittr "%>%"
#' @examples
#' p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'   ggplot2::geom_point(
#'    ggplot2::aes(
#'     text = paste0(
#'       "wt: ", wt, "<br>",
#'       "mpg: ", mpg, "<br>")
#'     )
#'   ) +
#'   ggplot2::labs(title = "Fuel economy declines as weight increases",
#'                 subtitle = "Fuel economy declines as weight increases")
#' ff_ggplotly(plot_name = p, source = "The source for my data")

ff_ggplotly <- function(plot_name, source_name){

  message("Do not use ff_style() before ff_ggplotly()")

  plotly::ggplotly(plot_name, tooltip = "text", width = 750, height = 550) %>%
    # remove plotly logo in the top right-hand corner and other unneeded buttons
    plotly::config(displaylogo = FALSE, modeBarButtonsToRemove = c("lasso2d", "zoom2d", "pan2d", "select2d", "hoverClosestCartesian", "hoverCompareCartesian")) %>%
    plotly::layout(margin = list(b = 90, t = 100),
                   yaxis = list(title = list(standoff = 20L), ticks = ""),
                   xaxis = list(title = list(standoff = 20L), ticks = ""),
                   font = list(family = "Helvetica"),
                   modebar = list(orientation = "h"),
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
                     ),
                   annotations =
                     list(
                       x = 0,
                       y = -0.18,
                       text = paste0("Source: ", source_name),
                       showarrow = F,
                       xref='paper',
                       yref='paper',
                       align='left',
                       xanchor='left',
                       yanchor='bottom',
                       font=list(size=9, color="#00000c"))
                  )
}
