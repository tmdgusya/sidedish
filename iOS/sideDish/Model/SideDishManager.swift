import Foundation

class SideDishManager {
    private var dishManager: [SideDishes]
    
    init() {
        dishManager = [SideDishes]()
    }
    
    func append(dish: SideDishes) {
        dishManager.append(dish)
    }
    
    func getCount() -> Int {
        return dishManager.count
    }
}
