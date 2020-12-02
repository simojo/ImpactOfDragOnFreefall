import plot

type
  Sphere* = object
    Alias*: string
    A*: float
    D*: float
    situations*: seq[Situation]
    direction*: Direction
  Relation* = enum
    LessThanTerminalVelocity, TerminalVelocity, GreaterThanTerminalVelocity
  Situation* = object
    v_0*: float
    x_max*: float
    relation*: Relation
  Direction* = enum
    Up, Down
  Metric* = enum
    Speed, KineticEnergy, PE, Work
  DataPoint* = object
    x*: float
    y*: float
    metric*: Metric

plotAll()
