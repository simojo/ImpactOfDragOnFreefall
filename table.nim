import streams, strformat, strutils, main

const tablesDir* = "tables/"

proc writeToCSV(alias, direction, relation, data: seq[DataPoint]) =
  var i = 0
  var text = "x,y,metric\n"
  for p in data:
    i += 1
    text = &"{text}{p.x},{p.y},{p.Metric}"
    if i != len(data):
      text = &"{text}\n"
  let path = &"{direction}_{alias}_{relation}.csv"
  writeFile(path, text)

proc 
