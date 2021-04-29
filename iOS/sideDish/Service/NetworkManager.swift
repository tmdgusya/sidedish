import Foundation
import Alamofire

class NetworkManager {
    
    static func getSideDishesInfo(_ url: String ) {
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: SideDish.self) { response in
                
                if let error = response.error {
                    print(error)
                }
                
                print(response.value)
            }
    }
}
