mod structs;

pub const m: f32 = 0.5;
pub const g: f32 = 9.81;
pub const n: f32 = 100.0;
pub const A_1: f32 = 1.80;
pub const A_2: f32 = 3.60e-2;
pub const A_3: f32 = 4.20e-4;

pub fn turn_into_data_points(&xs: Vec<f32>, &ys: Vec<f32>, metric: &structs::Metric) -> Vec<structs::DataPoint> {
    xs
        .iter()
        .zip(ys
            .into_iter()
            .map(|y| if y.to_string() == "nan" { 0.0 } else { y }))
        .map(|xy| structs::DataPoint {
            // FIXME: I have no idea why I must dereference this, look into later
            x: *xy.0,
            y: xy.1,
            metric: metric
        })
        .collect::<Vec<structs::DataPoint>>()
}
