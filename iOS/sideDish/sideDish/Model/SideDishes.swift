import Foundation
<<<<<<< HEAD
import RealmSwift

class SideDishes: Object, Decodable {
    @objc dynamic var categoryID: String = ""
    @objc dynamic var name: String = ""
    var items: List<SideDish> = List<SideDish>()
=======

struct SideDishes: Decodable {
    let categoryID: String
    let name: String
    let items: [SideDish]
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case items
    }
    
    func count() -> Int {
        return items.count
    }
    
    func eachDish(_ row:Int) -> SideDish {
        return items[row]
    }
<<<<<<< HEAD
    
    override static func primaryKey() -> String? {
        return "categoryID"
    }
=======
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
}
