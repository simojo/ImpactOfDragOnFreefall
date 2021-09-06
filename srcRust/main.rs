mod csv;
mod goingDownDrag;
mod goingDownNoDrag;
mod goingUpDrag;
mod goingUpNoDrag;
mod structs;
mod initialVelocityAndMaxHeigh;

fn main() {
    for sphere in initialVelocityAndMaxHeigh::getSituations() {
        let D = sphere.D
        for situation in sphere.situations {
            // Going Up - Drag
            var dataPoolUpDrag: Vec[structs::DataPoint] = @[]
            let domainUp = goingUpDrag.getDomain(situation.x_max)
            dataPoolUpDrag.add(goingUpDrag.dataSpeed(domainUp, D, situation.v_0))
            dataPoolUpDrag.add(goingUpDrag.dataKineticEnergy(domainUp, D, situation.v_0))
            dataPoolUpDrag.add(goingUpDrag.dataPotentialEnergy(domainUp, D, situation.v_0))
            dataPoolUpDrag.add(goingUpDrag.dataWork(domainUp, D, situation.v_0))
            csv::write_to_csv(sphere.Alias, DirectionDrag.UpDrag, situation.relation, dataPoolUpDrag, situation.v_0)

            // Going Up - No Drag
            var dataPoolUpNoDrag: Vec[structs::DataPoint] = @[]
            dataPoolUpNoDrag.add(goingUpNoDrag.dataSpeed(domainUp, situation.v_0))
            dataPoolUpNoDrag.add(goingUpNoDrag.dataKineticEnergy(domainUp, situation.v_0))
            dataPoolUpNoDrag.add(goingUpNoDrag.dataPotentialEnergy(domainUp, situation.v_0))
            csv::write_to_csv(sphere.Alias, DirectionDrag.UpNoDrag, situation.relation, dataPoolUpNoDrag, situation.v_0)

            // Going Down - Drag
            var dataPoolDownDrag: Vec[structs::DataPoint] = @[]
            let domainDown = goingDownDrag.getDomain(situation.x_max)
            dataPoolDownDrag.add(goingDownDrag.dataSpeed(domainDown, D, situation.x_max))
            dataPoolDownDrag.add(goingDownDrag.dataKineticEnergy(domainDown, D, situation.x_max))
            dataPoolDownDrag.add(goingDownDrag.dataPotentialEnergy(domainDown, D, situation.x_max))
            dataPoolDownDrag.add(goingDownDrag.dataWork(domainDown, D, situation.x_max))
            csv::write_to_csv(sphere.Alias, DirectionDrag.DownDrag, situation.relation, dataPoolDownDrag, situation.v_0)

            // Going Down - No Drag
            var dataPoolDownNoDrag: Vec[structs::DataPoint] = @[]
            dataPoolDownNoDrag.add(goingDownNoDrag.dataSpeed(domainDown, situation.x_max))
            dataPoolDownNoDrag.add(goingDownNoDrag.dataKineticEnergy(domainDown, situation.x_max))
            dataPoolDownNoDrag.add(goingDownNoDrag.dataPotentialEnergy(domainDown, situation.x_max))
            csv::write_to_csv(sphere.Alias, DirectionDrag.DownNoDrag, situation.relation, dataPoolDownNoDrag, situation.v_0)
        }
    }

    let points = turn_into_data_points(
        vec![5.0, 6.0, 10.0],
        vec![10.0, 20.0, 100.0],
        &structs::Metric::Speed
    );
    println!("{:?}", points)
}
