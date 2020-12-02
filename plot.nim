import os,
       streams,
       strformat,
       strutils,
       csv,
       ggplotnim

const plotsDir = "plots/"

# x, y, metric
proc plotPath(readPath: string) =
  let df = toDf(readCsv(readPath))
  let writePath = &"{plotsDir}{readPath.split('.')[0]}.png"
  ggplot(df, aes("x", color="metric")) +
    geom_line() +
    ggsave(writePath)

proc plotAll*() =
  for kind, path in walkDir(csvsDir):
    plotPath(path)
