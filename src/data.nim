import structs

## globals
const m* = 0.5
const g* = 9.81
const n* = 100
const A_1* = 1.80
const A_2* = 3.60e-2
const A_3* = 7.20e-4

## procs
proc turnIntoDataPoints*(x: seq[float], y: seq[float], metric: Metric): seq[DataPoint] =
  var i = 0
  for item in x:
    let thisX = x[i]
    var thisY = y[i]
    if y[i] == Nan:
      thisY = 0.0
    result.add(DataPoint(x: thisX, y: thisY, metric: metric))
    i += 1

