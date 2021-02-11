import ggplotnim
import os

const csvPath = "csvs/"
# const plotsPath = "plots/"
# const xLabel = "Displacement (x)"
# const yLabel = "Value"

var i = 0
for f in os.walkFiles(csvPath):
  if i == 1:
    continue
  ## toDf(File to be made into DataFrame)
  let dataFrame = toDf(readCsv(f))
  ## ggplot(DataFrame, aes(columns))
  ## geom_line
  ## geom_freqPoly
  ## geom_errorBar
  ## geom_bar
  ## geom_histogram
  ## geom_tile
  ## geom_text
  ## geom_raster
  ggplot(dataFrame, aes(x = "x", y = "y", color = "metric")) +
  geom_point() +
  ggsave("test.pdf")
  i += 1
