import Foundation
import Vapor
import VaporPostgreSQL

let drop = Droplet()

drop.preparations.append(Peak.self)

do {
    try drop.addProvider(VaporPostgreSQL.Provider.self)
} catch {
    assertionFailure("Error adding provider: \(error)")
}

drop.get("/") { request in

	let peaks = [Peak(name: "Scarfell Pike")]
    let peaksNode = try peaks.makeNode()
    return try JSON(node: peaksNode)

}

drop.post("peak") { req in
    var peak = try Peak(node: req.json)
    try peak.save()
    return try peak.makeJSON()
}

drop.get("peaks") { req in
    let peaks = try Peak.all().makeNode()
    return try JSON(node: peaks)
}

drop.run()
