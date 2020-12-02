import csv,
       goingDown,
       goingUp,
       streams,
       strformat,
       structs,
       strutils,
       initialVelocityAndMaxHeight

for sphere in getSituations():
  let D = sphere.D
  for situation in sphere.situations:
    var dataPool: seq[DataPoint] = @[]
    dataPool.add(dataSpeed(D, situation.v_0, situation.x_max))
    dataPool.add(dataKineticEnergy(D, situation.v_0, situation.x_max))
    dataPool.add(dataPotentialEnergy(D, situation.v_0, situation.x_max))
    dataPool.add(dataWork(D, situation.v_0, situation.x_max))
    writeToCSV(sphere.Alias, Direction.Up, situation.relation, dataPool)
