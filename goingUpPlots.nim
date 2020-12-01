# going up
import ggplotnim, sequtils, seqmath, streams, math

const plotsDir = "plots/"

proc plotSpeed() =
  let x = linspace(0.0, 30.0, 1000)
  let y = x.mapIt(pow(sin(it), 2.0))
  let df = seqsToDf(x, y)
  ggplot(d)

proc velocityGoingUp(x: float): float =
  let v = sqrt()
