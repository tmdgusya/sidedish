import Foundation

class DishDataManager {
    
    private var dishData: DataBody
    
    init() {
        self.dishData = DataBody()
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
