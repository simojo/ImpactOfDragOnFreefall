import ggplotnim,
       streams,
       strformat,
       strutils,
       os

const tablesDir* = "tables/"
const plotsDir = "plots/"

# x, y, metric
proc plotPath(readPath: string) =
  echo "check"
  let df = toDf(readCsv(readPath))
  let writePath = &"{plotsDir}{readPath.split('.')[0]}.png"
  ggplot(df, aes("x", color="metric")) +
    # geom_freqpoly()
    geom_line() +
    ggsave(writePath)

proc plotAll*() =
  echo "check"
  for kind, path in walkDir(tablesDir):
    plotPath(path)

plotAll()
