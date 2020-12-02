import math
from main import Sphere, Situation, Relation

const g = 9.81
const m = 0.5
let A_1 = 1.80
let A_2 = 3.60e-2
let A_3 = 7.20e-4

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

proc getInfoGivenCrossSection(A: float, alias: string): Sphere =
  echo ""
  echo "---------------------"
  echo ""
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
  echo ""
  echo "---------------------"
  echo ""
  return Sphere(
    Alias: alias,
    A: A,
    D: D,
    situations: @[
      Situation(
        v_0: lttv,
        x_max: x1,
        relation: Relation.LessThanTerminalVelocity
      ),
      Situation(
        v_0: tv,
        x_max: x2,
        relation: Relation.TerminalVelocity
      ),
      Situation(
        v_0: gttv,
        x_max: x3,
        relation: Relation.GreaterThanTerminalVelocity
      )
    ]
  )

proc start*(): seq[Sphere] =
  return @[
    getInfoGivenCrossSection(A_1, "A_1"),
    getInfoGivenCrossSection(A_2, "A_2"),
    getInfoGivenCrossSection(A_3, "A_3")
  ]

