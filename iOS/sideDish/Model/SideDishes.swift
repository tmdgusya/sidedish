import Foundation

struct SideDishes: Decodable {
    let body: [SideDish]
    
    func count() -> Int {
        return body.count
    }
}
