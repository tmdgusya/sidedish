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
                
                //test code
                print(data.body[0].categoryID)
                print(type(of: data.body[0]))
                
            }

    }
}

