import Foundation

class DishDataManager {
    private var dishData: DataBody
    
    init() {
        dishData = DataBody()
    }
    
    func addData(from data: SideDishes) {
        dishData.append(data)
    }
}
