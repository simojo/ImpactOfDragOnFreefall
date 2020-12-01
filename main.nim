type
  Sphere* = object
    A*: float
    D*: float
    Situations*: seq[Situation]
  Situation* = object
    v_0*: float
    x_max*: float
