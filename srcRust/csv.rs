use std::io;
use std::fmt;
use std::fs

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
    let path = format!("{}{}_{}_{}_{}.csv", CSVSDIR, direction, alias, relation, v_0);
    File::create(path)
        .write_all(text.as_bytes())
        .expect(format!("failed to write to {}", path));
}
