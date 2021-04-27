import Foundation
import Alamofire

class NetworkManager {
    
    static func fetchSideDishData() {
        AF.request("https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/best")
            .validate()
            .responseDecodable(of: DataBody.self) { response in
                
                if let error = response.error {
                    print(error)
                    return
                }
                
                guard let data = response.value else { return }
                
                DispatchQueue.main.async {
                    let dataBody = data.body
                    dataBody.forEach { eachData in
                        let decodedData = SideDishes()
                        decodedData.categoryID = eachData.categoryID
                        decodedData.name = eachData.name
                        decodedData.items = eachData.items
                        NotificationCenter.default.post(name: .fetchData, object: self, userInfo: [KeyValue.sideDishes:decodedData])
                    }
                }
            }
    }
}

