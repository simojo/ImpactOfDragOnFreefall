# A, m
from strutils import parseFloat
import math
import os

const g = 9.8
const m = 0.5

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

let A = parseFloat(commandLineParams()[0])

let D = coefDrag(A)
echo "Less than TV: ", initialVelocityLessThanTV(D), " m/s"
echo "Equal to TV: ", initialVelocityTV(D), " m/s"
echo "Greater than TV: ", initialVelocityGreaterThanTV(D), " m/s"
