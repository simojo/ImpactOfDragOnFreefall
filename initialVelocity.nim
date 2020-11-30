# A, m
from strutils import parseFloat
import math
import os

const g = 9.81

proc initialVelocityLessThanTV(m: float, D: float): float =
  let v = sqrt((m * g) / D) - 2
  return v

proc initialVelocityTV(m: float, D: float): float =
  let v = sqrt((m * g) / D)
  return v

proc initialVelocityGreaterThanTV(m: float, D: float): float =
  let v = sqrt((m * g) / D) + 2
  return v

proc coefDrag(A: float): float =
  let p = 1.139
  let c_d = 0.47
  let D = 0.5 * p * c_d * A
  return D

let A = parseFloat(commandLineParams()[0])
let m = parseFloat(commandLineParams()[1])

let D = coefDrag(A)
echo "v_o < TV: ", initialVelocityLessThanTV(m, D)
echo "v_o = TV: ", initialVelocityTV(m, D)
echo "v_o > TV: ", initialVelocityGreaterThanTV(m, D)
