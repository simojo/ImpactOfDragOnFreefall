// import structs

// ## globals
// const m* = 0.5
// const g* = 9.81
// const n* = 100
// const A_1* = 1.80
// const A_2* = 3.60e-2
// const A_3* = 7.20e-4

// ## procs
// proc turnIntoDataPoints*(x: seq[float], y: seq[float], metric: Metric): seq[DataPoint] =
//   var i = 0
//   for item in x:
//     let thisX = x[i]
//     var thisY = y[i]
//     if $y[i] == "nan":
//       thisY = 0.0
//     result.add(DataPoint(x: thisX, y: thisY, metric: metric))
//     i += 1

mod structs;

pub const m: f32 = 0.5;
pub const g: f32 = 9.81;
pub const n: f32 = 100.0;
pub const A_1: f32 = 1.80;
pub const A_2: f32 = 3.60e-2;
pub const A_3: f32 = 4.20e-4;

pub fn turnIntoDataPoints(x: Vec<f32>, y: Vec<f32>, metric: structs::Metric) -> Vec<structs::DataPoint> {
    let mut result = Vec::<structs::DataPoint>::new();
    let mut i = 0;
    for item in &x {
        let thisX = x[i];
        let mut thisY = y[i];
        if y[i].to_string() == "nan" {
            thisY = 0.0;
        }
        result.push(structs::DataPoint {
            x: thisX,
            y: thisY,
            metric: metric.clone(),
        });
        i += 1;
    }
    result
}

fn main() {
    println!("done");
}
