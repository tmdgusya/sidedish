import Foundation

struct DataBody: Decodable {
    var body = [SideDishes]()
    
    mutating func append(_ data: SideDishes) {
        body.append(data)
    }
    
    func count() -> Int {
        return body.count
    }
    
    func sectionCount(_ section:Int) -> Int {
        return body.isEmpty ? 0:body[section].count()
    }
    
    func eachData(_ section: Int, _ row: Int) -> SideDish {
        return body[section].eachDish(row)
    }
}
