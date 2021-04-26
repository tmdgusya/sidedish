import Foundation

struct SideDishes: Decodable {
    let categoryID: String
    let name: String
    let items: [SideDish]
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case items
    }
}
