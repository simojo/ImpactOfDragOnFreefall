import sequtils, sugar, math, structs, data

proc getDomain*(x_max: float): seq[float] =
  let step = x_max / n
  var i = x_max
  while i >= 0:
    result.add(i)
    i -= step
  result[len(result) - 1] = 0.0

proc dataSpeed*(domain: seq[float], D: float, x_max: float): seq[DataPoint] =
  let range = domain.map(x =>
    sqrt(m*g/D*(1-pow(E, 2*D/m*(x-x_max))))
  )
  return turnIntoDataPoints(domain, range, Metric.Speed)

proc dataKineticEnergy*(domain: seq[float], D: float, x_max: float): seq[DataPoint] =
  let range = domain.map(x =>
    0.5*m*(m*g/D*(1-pow(E, 2*D/m*(x-x_max))))
  )
  return turnIntoDataPoints(domain, range, Metric.KineticEnergy)

proc dataPotentialEnergy*(domain: seq[float], D: float, x_max: float): seq[DataPoint] =
  let range = domain.map(x =>
    m*g*x
  )
  return turnIntoDataPoints(domain, range, Metric.PotentialEnergy)

proc dataWork*(domain: seq[float], D: float, x_max: float): seq[DataPoint] =
  let range = domain.map(x =>
    m*g*(x-x_max)-m^2*g/(2*D)*(pow(E, 2*D*(x-x_max)/m)-1)
  )
  return turnIntoDataPoints(domain, range, Metric.WorkOfDrag)

