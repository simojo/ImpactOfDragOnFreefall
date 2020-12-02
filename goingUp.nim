# going up
import sequtils, sugar, math, structs

const m = 0.5
const g = 9.81
const n = 100

proc getDomain(x_max: float): seq[float] =
  let step = x_max / n
  var i = 0.00
  while i <= x_max:
    result.add(i)
    i += step
  result.add(x_max)

proc turnIntoDataPoints(x: seq[float], y: seq[float], metric: Metric): seq[DataPoint] =
  var i = 0
  for item in x:
    result.add(DataPoint(x: x[i], y: y[i], metric: metric))
    i += 1

proc dataSpeed*(D: float, v_0: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    sqrt((v_0^2+m*g/D)*pow(E, -2*D*(x)/m)-(m*g/D))
  )
  return turnIntoDataPoints(domain, range, Metric.Speed)

proc dataKineticEnergy*(D: float, v_0: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    0.5*m*((v_0^2+m*g/D)*pow(E, -2*D*(x)/m)-(m*g/D))
  )
  return turnIntoDataPoints(domain, range, Metric.KineticEnergy)

proc dataPotentialEnergy*(D: float, v_0: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    m*g*x
  )
  return turnIntoDataPoints(domain, range, Metric.PotentialEnergy)

proc dataWork*(D: float, v_0: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    m*g*(x)+m/(2*D)*((D*v_0^2+m*g)*(pow(E, -2*D*(x)/m)-1))
  )
  return turnIntoDataPoints(domain, range, Metric.Work)

