# Package of Forsyth Futures' ggplot2 and plotly Styles

The FFplot package provides Forsyth Futures analysts the ability to create and export customized ggplot2 and plotly graphs.

## Installation

1. Install the devtools package, if not already installed: `install.packages('devtools')`.
2. Install the FFTemplates package directly from GitHub: `devtools::install_github('danielludolf/FFplot')`.
3. `library(FFplot)` within R.

## Reference

* `ff_style` allows you to add the Forsyth Futures' theme to your ggplot graphics
* `ff_ggplot` allows you to create a static ggplot graph with Forsyth Futures' theming
* `ff_ggplotly` allows you to convert a ggplot graph into an interactive plotly graphic with Forsyth Futures' theming
* `ff_colors` vector of Forsyth Futures' color palette

For examples and parameter definitions, type '?`ff_style`', '?`ff_ggplot`' or '?`ff_ggplotly`' in the Console after loading the package, i.e., `library(FFplot)`.
