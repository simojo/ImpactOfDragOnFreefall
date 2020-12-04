type
  Sphere* = object
    Alias*: string
    A*: float
    D*: float
    situations*: seq[Situation]
  Relation* = enum
    LessThanTerminalVelocity, TerminalVelocity, GreaterThanTerminalVelocity
  Situation* = object
    v_0*: float
    x_max*: float
    relation*: Relation
  DirectionDrag* = enum
    UpDrag, UpNoDrag, DownDrag, DownNoDrag
  Metric* = enum
    Speed, KineticEnergy, PotentialEnergy, Work
  DataPoint* = object
    x*: float
    y*: float
    metric*: Metric
