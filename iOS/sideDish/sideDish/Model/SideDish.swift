import Foundation
<<<<<<< HEAD
import RealmSwift

class SideDish: Object, Decodable {
    @objc dynamic var detailHash: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var alt: String = ""
    var deliveryType: List<String> = List<String>()
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
    @objc dynamic var nPrice: String? = ""
    @objc dynamic var sPrice: String = ""
    var badge: List<String>? = List<String>()
=======

struct SideDish: Decodable {
    let detailHash: String
    let image: String
    let alt: String
    let deliveryType: [String]
    let title: String
    let description: String
    let nPrice: String?
    let sPrice: String
    let badge: [String]?
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
    
    enum CodingKeys: String, CodingKey {
        case detailHash = "detail_hash"
        case image
        case alt
        case deliveryType = "delivery_type"
        case title
<<<<<<< HEAD
        case detail = "description"
=======
        case description
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
        case nPrice = "n_price"
        case sPrice = "s_price"
        case badge
    }
<<<<<<< HEAD
    override static func primaryKey() -> String? {
        return "detailHash"
    }
=======
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
}
