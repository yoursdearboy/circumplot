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
             grid.col = set_names(pars$grid.col, pars$name),
             annotationTrack = c("grid", "axis"),
             preAllocateTracks = 1)
circos.trackPlotRegion(track.index = 1, panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")
  ylim = get.cell.meta.data("ylim")
  sector.name = get.cell.meta.data("sector.index")
  circos.text(mean(xlim), ylim[1] + .2, sector.name, facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5), cex = .8)
}, bg.border = NA)
circos.clear()
dev.off()
