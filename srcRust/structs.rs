// type
//   Sphere* = object
//     Alias*: string
//     A*: float
//     D*: float
//     situations*: seq[Situation]
//   Relation* = enum
//     LessThanTerminalVelocity, TerminalVelocity, GreaterThanTerminalVelocity
//   Situation* = object
//     v_0*: float
//     x_max*: float
//     relation*: Relation
//   DirectionDrag* = enum
//     UpDrag, UpNoDrag, DownDrag, DownNoDrag
//   Metric* = enum
//     Speed, KineticEnergy, PotentialEnergy, WorkOfDrag
//   DataPoint* = object
//     x*: float
//     y*: float
//     metric*: Metric

pub struct Sphere {
    Alias: String,
    A: f32,
    D: f32,
    situations: Vec<Situation>,
}

pub enum Relation {
    LessThanTerminalVelocity,
    TerminalVelocity,
    GreaterThanTerminalVelocity,
}

pub struct Situation {
    v_0: f32,
    x_max: f32,
    relation: Relation,
}

pub enum DirectionDrag {
    UpDrag,
    UpNoDrag,
    DownDrag,
    DownNoDrag,
}

#[derive(Debug)]
pub enum Metric {
    Speed,
    KineticEnergy,
    PotentialEnergy,
    WorkOfDrag,
}

#[derive(Debug)]
pub struct DataPoint<'a> {
    pub x: f32,
    pub y: f32,
    pub metric: &'a Metric,
}
