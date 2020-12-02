import streams, strutils, main

const tablesDir* = "tables/"

proc writeToCSV(alias, direction, relation, data: seq[DataPoint]) =
  var i = 0
  var text = "x,y,metric\n"
  for p in data:
    i += 1
    text += &"{p.x},{p.y},{p.Metric}"
    if i != len(data):
      text += "\n"
  let path = &"{alias}_{relation}_{direction}.csv"
  writeFile(path, text)

proc 
