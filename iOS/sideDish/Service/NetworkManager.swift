import Foundation
import Alamofire

class NetworkManager {
    
    static func getSideDishesInfo(_ url: String) {
        AF.request(url)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: SideDish.self) { response in
                switch response.result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
