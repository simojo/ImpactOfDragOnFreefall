import sequtils, sugar, math, structs, data

proc getDomain*(x_max: float): seq[float] =
  let step = x_max / n
  var i = 0.00
  while i <= x_max:
    result.add(i)
    i += step
  result.add(x_max)

proc dataSpeed*(domain: seq[float], D: float, v_0: float): seq[DataPoint] =
  let range = domain.map(x =>
    sqrt((v_0^2+m*g/D)*pow(E, -2*D*(x)/m)-(m*g/D))
  )
  return turnIntoDataPoints(domain, range, Metric.Speed)

proc dataKineticEnergy*(domain: seq[float], D: float, v_0: float): seq[DataPoint] =
  let range = domain.map(x =>
    0.5*m*((v_0^2+m*g/D)*pow(E, -2*D*(x)/m)-(m*g/D))
  )
  return turnIntoDataPoints(domain, range, Metric.KineticEnergy)

proc dataPotentialEnergy*(domain: seq[float], D: float, v_0: float): seq[DataPoint] =
  let range = domain.map(x =>
    m*g*x
  )
  return turnIntoDataPoints(domain, range, Metric.PotentialEnergy)

proc dataWork*(domain: seq[float], D: float, v_0: float): seq[DataPoint] =
  let range = domain.map(x =>
    m*g*(x)+m/(2*D)*((D*v_0^2+m*g)*(pow(E, -2*D*(x)/m)-1))
  )
  return turnIntoDataPoints(domain, range, Metric.WorkOfDrag)

