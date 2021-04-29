import Foundation
import Alamofire

class NetworkManager {
    
    static func getSideDishesInfo(_ url: String) {
        AF.request(url)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: ) { response in
                
            }
    }
}
