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

use std::io;
use std::fmt;

const CSVSDIR: &str = "../csvs/"

// FIXME: only pass by reference if necessary
pub fn write_to_csv(alias: &str, direction: &DirectionDrag, relation: &Relation, data: Vec<DataPoint>, v_0: f32) {
    let mut text: String = "x,y,metric";
    for p in data.iter() {
        text = format!("{}\n", text);
        let x = p.x.to_string();
        let y = p.y.to_string();
        text = format!("{}{},{},{}", text, x, y, p.metric);
    }
    let path = format!("{}{}_{}_{}_{}.csv", csvsDir, direction, alias, relation, v_0);
    // FIXME: figure out whether or not to pass by reference
    writeFile(path, text)
}


