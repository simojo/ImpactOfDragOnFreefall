import csv,
       goingDown,
       goingUp,
       structs,
       initialVelocityAndMaxHeight

# FIXME: add initial velocities to graphs

for sphere in getSituations():
  let D = sphere.D
  for situation in sphere.situations:
    var dataPool: seq[DataPoint] = @[]
    dataPool.add(goingUp.dataSpeed(D, situation.v_0, situation.x_max))
    dataPool.add(goingUp.dataKineticEnergy(D, situation.v_0, situation.x_max))
    dataPool.add(goingUp.dataPotentialEnergy(D, situation.v_0, situation.x_max))
    dataPool.add(goingUp.dataWork(D, situation.v_0, situation.x_max))
    writeToCSV(sphere.Alias, Direction.Up, situation.relation, dataPool, situation.v_0)
  for situation in sphere.situations:
    var dataPool: seq[DataPoint] = @[]
    dataPool.add(goingDown.dataSpeed(D, situation.x_max))
    dataPool.add(goingDown.dataKineticEnergy(D, situation.x_max))
    dataPool.add(goingDown.dataPotentialEnergy(D, situation.x_max))
    dataPool.add(goingDown.dataWork(D, situation.x_max))
    writeToCSV(sphere.Alias, Direction.Down, situation.relation, dataPool, situation.v_0)
