import Foundation

class SideDishManager {
    
    private var dishManager = [SideDishes]()
    
    static var foodManager = SideDishManager()
    
    static func sharedInstance() -> SideDishManager {
        return foodManager
    }
    
    func append(dish: SideDishes) {
        dishManager.append(dish)
    }

    func getFoodData(_ section: Int, _ row: Int) -> SideDish {
        return dishManager[section].getData(row)
    }
    
    func getDataCount() -> Int {
        return dishManager.count
    }
}
