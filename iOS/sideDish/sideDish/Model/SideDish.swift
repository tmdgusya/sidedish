import Foundation
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
    
    enum CodingKeys: String, CodingKey {
        case detailHash = "detail_hash"
        case image
        case alt
        case deliveryType = "delivery_type"
        case title
        case detail = "description"
        case nPrice = "n_price"
        case sPrice = "s_price"
        case badge
    }
    override static func primaryKey() -> String? {
        return "detailHash"
    }
}
