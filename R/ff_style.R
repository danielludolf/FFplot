#' Add Forsyth Futures' theme to ggplot graph
#'
#' This function allows you to add the Forsyth Futures' theme to your ggplot graphics.
#' @keywords ff_style
#' @export
#' @examples
#' ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
#'  ggplot2::geom_point() +
#'  ggplot2::labs(title = "Fuel economy declines as weight increases",
#'                subtitle = "Fuel economy declines as weight increases") +
#'  ff_style()

ff_style <- function(){

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
    plot.caption = ggplot2::element_text(family=font,
                                         size=12,
                                         hjust=0,
                                         margin=ggplot2::margin(0, 0, 0, 0)),
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
                                       color="#00000c", margin = ggplot2::margin(t = 10, r = 0, b = 15, l = 0)),
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
    strip.background = ggplot2::element_rect(fill="#FFFFFF"),
    strip.text = ggplot2::element_text(size = 12, hjust = 0)
  )
}

#' Forsyth Futures' color palette
#'
#' Vector of Forsyth Futures' color palette
#' @keywords ff_colors
#' @export

ff_colors <- c('#85cae4','#9cd4ee','#83b2c8','#6a91a2','#415862','#004c89','#3176ce','#205391','#163e6b','#0c2946',
               '#00043e','#000947','#000531','#00968a','#66dfd0','#47a096','#357a72','#23544f','#8bb185','#d2fbc4',
               '#9dbc93','#7d9575','#5d7057','#ffc13d','#ddaf4f','#b89242','#7a602b','#3e3115','#f38538','#cc7b42',
               '#a86536','#6c4123','#311d0e','#00000c','#8c8c8c','#4c4c4c','#333333','#000000','#888887','#d4d4d3',
               '#959594','#6e6e6e','#484848')
