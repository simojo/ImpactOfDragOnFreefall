import sequtils, sugar, math, structs, data

proc dataSpeed*(domain: seq[float], v_0: float): seq[DataPoint] =
  let range = domain.map(x =>
    sqrt(v_0^2-2*g*(x))
  )
  return turnIntoDataPoints(domain, range, Metric.Speed)

proc dataKineticEnergy*(domain: seq[float], v_0: float): seq[DataPoint] =
  let range = domain.map(x =>
    0.5*m*(v_0^2-2*g*(x))
  )
  return turnIntoDataPoints(domain, range, Metric.KineticEnergy)

proc dataPotentialEnergy*(domain: seq[float], v_0: float): seq[DataPoint] =
  let range = domain.map(x =>
    m*g*x
  )
  return turnIntoDataPoints(domain, range, Metric.PotentialEnergy)
