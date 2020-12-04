import csv,
       goingDownDrag,
       goingDownNoDrag,
       goingUpDrag,
       goingUpNoDrag,
       structs,
       initialVelocityAndMaxHeight

for sphere in getSituations():
  let D = sphere.D
  for situation in sphere.situations:
    ## Going Up - Drag
    var dataPoolUpDrag: seq[DataPoint] = @[]
    let domainUp = goingUpDrag.getDomain(situation.x_max)
    dataPoolUpDrag.add(goingUpDrag.dataSpeed(domainUp, D, situation.v_0))
    dataPoolUpDrag.add(goingUpDrag.dataKineticEnergy(domainUp, D, situation.v_0))
    dataPoolUpDrag.add(goingUpDrag.dataPotentialEnergy(domainUp, D, situation.v_0))
    dataPoolUpDrag.add(goingUpDrag.dataWork(domainUp, D, situation.v_0))
    writeToCSV(sphere.Alias, DirectionDrag.UpDrag, situation.relation, dataPoolUpDrag, situation.v_0)

    ## Going Up - No Drag
    var dataPoolUpNoDrag: seq[DataPoint] = @[]
    dataPoolUpNoDrag.add(goingUpNoDrag.dataSpeed(domainUp, situation.v_0))
    dataPoolUpNoDrag.add(goingUpNoDrag.dataKineticEnergy(domainUp, situation.v_0))
    dataPoolUpNoDrag.add(goingUpNoDrag.dataPotentialEnergy(domainUp, situation.v_0))
    writeToCSV(sphere.Alias, DirectionDrag.UpNoDrag, situation.relation, dataPoolUpDrag, situation.v_0)

    ## Going Down - Drag
    var dataPoolDownDrag: seq[DataPoint] = @[]
    let domainDown = goingDownDrag.getDomain(situation.x_max)
    dataPoolDownDrag.add(goingDownDrag.dataSpeed(domainDown, D, situation.x_max))
    dataPoolDownDrag.add(goingDownDrag.dataKineticEnergy(domainDown, D, situation.x_max))
    dataPoolDownDrag.add(goingDownDrag.dataPotentialEnergy(domainDown, D, situation.x_max))
    dataPoolDownDrag.add(goingDownDrag.dataWork(domainDown, D, situation.x_max))
    writeToCSV(sphere.Alias, DirectionDrag.DownDrag, situation.relation, dataPoolDownDrag, situation.v_0)

    ## Going Down - No Drag
    var dataPoolDownNoDrag: seq[DataPoint] = @[]
    dataPoolDownNoDrag.add(goingDownNoDrag.dataSpeed(domainDown, situation.x_max))
    dataPoolDownNoDrag.add(goingDownNoDrag.dataKineticEnergy(domainDown, situation.x_max))
    dataPoolDownNoDrag.add(goingDownNoDrag.dataPotentialEnergy(domainDown, situation.x_max))
    writeToCSV(sphere.Alias, DirectionDrag.DownNoDrag, situation.relation, dataPoolUpDrag, situation.v_0)
