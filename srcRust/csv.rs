// import strformat, structs

// const csvsDir* = "../csvs/"

// proc writeToCSV*(alias: string, direction: DirectionDrag, relation: Relation, data: seq[DataPoint], v_0: float) =
//   var text = "x,y,metric"
//   for p in data:
//     text = &"{text}\n"
//     let x = ($p.x)
//     let y = ($p.y)
//     text = &"{text}{x},{y},{p.metric}"
//   let path = &"{csvsDir}{direction}_{alias}_{relation}_{v_0}.csv"
//   writeFile(path, text)
