import Foundation
import RealmSwift

class SideDishes: Object, Decodable {
    @objc dynamic var categoryID: String = ""
    @objc dynamic var name: String = ""
    var items: List<SideDish> = List<SideDish>()
    
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
}
