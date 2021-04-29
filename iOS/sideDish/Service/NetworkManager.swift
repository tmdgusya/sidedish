import Foundation
import Alamofire

class NetworkManager {
    
    static func getSideDishesInfo(_ url: String, _ completion: @escaping (SideDishes) -> () ) {
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: SideDishes.self) { response in
                switch response.result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let data):
                    completion(data)
                }
            }
    }
}
