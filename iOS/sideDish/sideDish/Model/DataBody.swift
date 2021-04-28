import Foundation
<<<<<<< HEAD
import RealmSwift

class DataBody: Decodable {
    
    var body: List<SideDishes> = List<SideDishes>()
    
    func append(_ data: SideDishes) {
=======

struct DataBody: Decodable {
    var body = [SideDishes]()
    
    mutating func append(_ data: SideDishes) {
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
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
