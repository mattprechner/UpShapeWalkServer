import Foundation
import Vapor

let drop = Droplet()

drop.get("/") { request in

	return try JSON(node: [
        "name": "Scarfell Pike"
    ])
}

drop.run()
