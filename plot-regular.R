library(rlang)
library(readxl)
library(circlize)

data <- read_excel("circumplot.xlsx", "data")
pars <- read_excel("circumplot.xlsx", "pars")

# cairo_pdf("circumplot.pdf", pointsize = 12)
png("circumplot.png", width = 1800, height = 1800, res = 300)
circos.par(gap.after = set_names(pars$gap.after, pars$name))
chordDiagram(data,
             order = pars$name,
             grid.col = set_names(pars$grid.col, pars$name))
circos.clear()
dev.off()
