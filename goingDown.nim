# going down
import sequtils, sugar, math, structs

const m = 0.5
const g = 9.81
const n = 100

# FIXME: need to rework this for going down

proc getDomain(x_max: float): seq[float] =
  let step = x_max / n
  var i = x_max
  while i >= 0:
    result.add(i)
    i -= step
  result[len(result) - 1] = 0.0

proc turnIntoDataPoints(x: seq[float], y: seq[float], metric: Metric): seq[DataPoint] =
  var i = 0
  for item in x:
    result.add(DataPoint(x: x[i], y: y[i], metric: metric))
    i += 1

proc dataSpeed*(D: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    sqrt(m*g/D*(1-pow(E, 2*D/m*(x-x_max))))
  )
  return turnIntoDataPoints(domain, range, Metric.Speed)

proc dataKineticEnergy*(D: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    0.5*m*(m*g/D*(1-pow(E, 2*D/m*(x-x_max))))
  )
  return turnIntoDataPoints(domain, range, Metric.KineticEnergy)

proc dataPotentialEnergy*(D: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    m*g*x
  )
  return turnIntoDataPoints(domain, range, Metric.PotentialEnergy)

proc dataWork*(D: float, x_max: float): seq[DataPoint] =
  let domain = getDomain(x_max)
  let range = domain.map(x =>
    m*g*(x-x_max)-m^2*g/(2*D)*(pow(E, 2*D*(x-x_max)/m)-1)
  )
  return turnIntoDataPoints(domain, range, Metric.Work)

