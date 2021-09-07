mod data;
mod structs;

pub fn getDomain(&x_max: f32) -> Vec[f32] {
    let step = *x_max / data::n;
    let mut i = *x_max;
    let result = Vec<f32>::new();
    while i >= 0 {
        result.push(i);
        i -= step;
    }
    result[result.len() - 1] = 0.0;
    result
}

pub fn dataSpeed(&domain: Vec[f32], D: f32, x_Max: f32) -> Vec[structs::DataPoint] {
    data::turnIntoDataPoints(
        domain,
        domain
            .iter()
            .map(|x| {
                (data::m * data::g / data::D * ( 1 -  E.pow(2 * data::D / data::m * ( x - x_max )))).sqrt()
            })
            .collect(Vec<f32>),
        structs::Metric.Speed
    )
}

pub fn dataKineticEnergy(&domain: Vec[f32], D: f32, x_Max: f32) -> Vec[structs::DataPoint] {
    data::turnIntoDataPoints(
        domain,
        domain
            .iter()
            .map(|x| {
                // 0.5*m*(m*g/D*(1-pow(E, 2*D/m*(x-x_max))))
                x // FIXME
            })
            .collect(Vec<f32>),
        structs::Metric.KineticEnergy
    )
}

pub fn dataPotentialEnergy(&domain: Vec[f32], D: f32, x_Max: f32) -> Vec[structs::DataPoint] {
    data::turnIntoDataPoints(
        domain,
        domain
            .iter()
            .map(|x| {
               // m*g*x
               x // FIXME
            })
            .collect(Vec<f32>),
        structs::Metric.PotentialEnergy
    )
}

pub fn dataWork(&domain: Vec[f32], D: f32, x_Max: f32) -> Vec[structs::DataPoint] {
    data::turnIntoDataPoints(
        domain,
        domain
            .iter()
            .map(|x| {
               // m*g*(x-x_max)-m^2*g/(2*D)*(pow(E, 2*D*(x-x_max)/m)-1)
               x // FIXME
            })
            .collect(Vec<f32>),
        structs::Metric.WorkOfDrag
    )
}
