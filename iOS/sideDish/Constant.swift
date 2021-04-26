import Foundation

enum CellIdentifier {
    static let foodCell = "foodCell"
    static let foodHeader = "foodHeader"
}

enum HeaderInfo {
    static let setDish = "할인특가 세트상품"
    static let meatDish = "풍성한 고기반찬"
    static let seaDish = "바다향가득 반찬"
    static let convinientDish = "편리한 반찬세트"
    static let simpleDish = "간편한 덮밥요리"
    static let childDish = "우리아이 영양반찬"
}

enum HeaderInfoList {
    static let infoList = [HeaderInfo.setDish, HeaderInfo.meatDish, HeaderInfo.seaDish, HeaderInfo.convinientDish, HeaderInfo.simpleDish, HeaderInfo.childDish]
}

enum KeyValue {
    static let sideDishes = "sideDishes"
}

extension Notification.Name {
    static let fetchData = Notification.Name("fetchData")
}
