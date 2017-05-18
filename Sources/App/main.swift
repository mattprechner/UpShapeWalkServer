import Foundation
import Vapor

let drop = Droplet()

drop.get("/") { request in

	let testData = [["name": "Scarfell Pike"]]
	 
    let jsonData = try JSONSerialization.data(withJSONObject: testData, options: JSONSerialization.WritingOptions.prettyPrinted)

    if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
       return JSONString
    }

	return "[]"
}

drop.run()
