import Foundation

struct DataBody: Decodable {
    var body = [SideDishes]()
    
    mutating func append(_ data: SideDishes) {
        body.append(data)
    }
}
