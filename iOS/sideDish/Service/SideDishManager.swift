import Foundation
import RxSwift

class SideDishManager: SideDishManagerType {
    
    private var dishManager = [SideDishes]()
    
    private lazy var store = PublishSubject<[SideDishes]>()
    
    func append(dish: SideDishes) {
        dishManager.append(dish)
    }
    
    func getDataCount() -> [Int] {
        var count = [Int]()
        dishManager.forEach {
            count.append($0.count())
        }
        return count
    }
    
    @discardableResult
    func createSideDish(_ dish: SideDishes) -> Observable<SideDishes> {
        dishManager.append(dish)
        store.onNext(dishManager)
        return Observable.just(dish)
    }
    
    @discardableResult
    func sideDishList() -> Observable<[SideDishes]> {
        return store
    }
}
