import Foundation

class DishDataManager {
<<<<<<< HEAD
    
    private var dishData: DataBody
    
    init() {
        self.dishData = DataBody()
=======
    private var dishData: DataBody
    
    init() {
        dishData = DataBody()
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
    }
    
    func addData(from data: SideDishes) {
        dishData.append(data)
    }
    
    func dataCount() -> Int {
        return dishData.count()
    }
    
    func sectionCount(_ section: Int) -> Int {
        return dishData.sectionCount(section)
    }
    
    func eachData(_ section: Int, _ row: Int) -> SideDish {
        return dishData.eachData(section, row)
    }
}
