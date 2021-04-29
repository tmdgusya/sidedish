import Foundation

enum CellIdentifier {
    static let foodCell = "foodCell"
    static let foodHeader = "foodHeader"
}

enum HeaderInfo {
    static let main = "모두가 좋아하는 든든한 메인요리"
    static let soup = "정성이 담긴 뜨근뜨근 국물요리"
    static let side = "식탁을 풍성하게 하는 정갈한 밑반찬"
}

enum SideDishInfo {
    static let main = "http://ec2-13-125-149-111.ap-northeast-2.compute.amazonaws.com:8080/main"
    static let soup = "http://ec2-13-125-149-111.ap-northeast-2.compute.amazonaws.com:8080/soup"
    static let side = "http://ec2-13-125-149-111.ap-northeast-2.compute.amazonaws.com:8080/side"
    static let test = "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/main"
}

enum NotiInfo {
    static let cellInfo = "cellInfo"
}

extension Notification.Name {
    static let cellTapped = Notification.Name("cellTapped")
}
