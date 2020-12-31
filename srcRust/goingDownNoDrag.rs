// import sequtils, sugar, math, structs, data

// proc dataSpeed*(domain: seq[float], x_max: float): seq[DataPoint] =
//   let range = domain.map(x =>
//     sqrt(-2*g*(x-x_max))
//   )
//   return turnIntoDataPoints(domain, range, Metric.Speed)

// proc dataKineticEnergy*(domain: seq[float], x_max: float): seq[DataPoint] =
//   let range = domain.map(x =>
//     0.5*m*(-2*g*(x-x_max))
//   )
//   return turnIntoDataPoints(domain, range, Metric.KineticEnergy)

// proc dataPotentialEnergy*(domain: seq[float], x_max: float): seq[DataPoint] =
//   let range = domain.map(x =>
//     m*g*x
//   )
//   return turnIntoDataPoints(domain, range, Metric.PotentialEnergy)
