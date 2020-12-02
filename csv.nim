import streams, strformat, strutils, main, structs

const csvsDir* = "csvs/"
const sigDigs = 3

proc writeToCSV*(alias: string, direction: Direction, relation: Relation, data: seq[DataPoint]) =
  var text = "x,y,metric"
  for p in data:
    text = &"{text}\n"
    # let x = ($p.x)[0..(sigDigs - 1)]
    # let y = ($p.y)[0..(sigDigs - 1)]
    let x = ($p.x)
    let y = ($p.y)
    text = &"{text}{x},{y},{p.metric}"
  let path = &"{csvsDir}{direction}_{alias}_{relation}.csv"
  writeFile(path, text)
