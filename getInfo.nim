# A
from strutils import parseFloat
import math
import os

const g = 9.8
const m = 0.5
let A_1 = 1.80
let A_2 = 3.60 * pow(10.0, -2.0)
let A_3 = 7.20 * pow(10.0, -4.0)
let A = parseFloat(commandLineParams()[0])

proc initialVelocityLessThanTV(D: float): float =
  let v = sqrt((m * g) / D)
  return v - (v * 0.5)

proc initialVelocityTV(D: float): float =
  let v = sqrt((m * g) / D)
  return v

proc initialVelocityGreaterThanTV(D: float): float =
  let v = sqrt((m * g) / D)
  return v + (v * 0.5)

proc coefDrag(A: float): float =
  let p = 1.139
  let c_d = 0.47
  let D = 0.5 * p * c_d * A
  return D

proc maxHeight(v_0: float, D: float): float =
  let x_max = -1*m*ln((m*g)/(D*v_0^2+m*g))/(2*D)
  return x_max

proc getInfoGivenCrossSection(A: float): float =
  let D = coefDrag(A)
  echo "A: ", A
  echo "D: ", D

  let lttv = initialVelocityLessThanTV(D)
  let x1 = maxHeight(lttv, D)
  echo "Less than TV:"
  echo "  v_0:   ", lttv
  echo "  x_max: ", x1

  let tv = initialVelocityTV(D)
  let x2 = maxHeight(tv, D)
  echo "Equal to TV:"
  echo "  v_0:   ", tv
  echo "  x_max: ", x2

  let gttv = initialVelocityGreaterThanTV(D)
  let x3 = maxHeight(gttv, D)
  echo "Greater than TV:"
  echo "  v_0:   ", gttv
  echo "  x_max: ", x3

echo getInfoGivenCrossSection(A_1)
echo getInfoGivenCrossSection(A_2)
echo getInfoGivenCrossSection(A_3)
