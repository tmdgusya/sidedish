import UIKit
import RealmSwift
    
class MainViewController: UIViewController {
    
    private var dataManager = DishDataManager()

    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private var headerOfCollectionView: CollectionViewHeader = {
        let header = CollectionViewHeader(frame: .zero)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainCollectionView()
        NetworkManager.fetchSideDishData()
        addNotificationCenter()
    }
}

//MARK: Notification
extension MainViewController {
    private func addNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(getNetworkData(_:)), name: .fetchData, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveToDetailViewController(_:)), name: .nextVC, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getDatabaseCacheData), name: .networkError, object: nil)
    }
}

//MARK: @Action
extension MainViewController {
    
    @objc private func getNetworkData(_ notification: Notification) {
        guard let data = notification.userInfo?[KeyValue.sideDishes] as? SideDishes else { return }
        let realm = try! Realm()
        let dish = SideDishes()
        dish.categoryID = data.categoryID
        dish.name = data.name
        dish.items.append(objectsIn: data.items)
        dataManager.addData(from: dish)
        try! realm.write {
            realm.add(dish, update: .all)
        }
    }
    
    @objc private func moveToDetailViewController(_ notification: Notification) {
        let location = notification.userInfo?["location"] as! CGPoint
        guard let indexPath = self.mainCollectionView.indexPathForItem(at: location) else { return }
        let data = dataManager.eachData(indexPath.section, indexPath.row)
        let hash = data.detailHash
        let detailVC = DetailViewController()
        detailVC.modalPresentationStyle = .overCurrentContext
        detailVC.deliveryHashData(hash)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc private func getDatabaseCacheData() {
        let realm = try! Realm()
        let data = realm.objects(SideDishes.self)
        data.forEach { sideDishes in
            dataManager.addData(from: sideDishes)
        }
    }
}

//MARK: -Setup && Cofiguration
private extension MainViewController {
    
    private func setupMainCollectionView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.white
        view.addSubview(mainCollectionView)
        configureMainCollectionView()
        mainCollectionView.addSubview(headerOfCollectionView)
    }
    
    private func configureMainCollectionView() {
        mainCollectionView.backgroundColor = UIColor.clear
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

//MARK: -CollectionView DataSource && Delegate
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager.sectionCount(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.foodCell, for: indexPath) as? FoodCell else {
            return UICollectionViewCell()
        }
        let sideDish = dataManager.eachData(indexPath.section, indexPath.row)

        guard let url = URL(string: sideDish.image) else {
            return UICollectionViewCell()
        }
        
        var dishImage: UIImage?
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    dishImage = image
                }
            }
        }.resume()

        DispatchQueue.main.async {
            if let image = dishImage{
                cell.setupCellImage(image)
            } else {
                cell.setupCellImage(UIImage(named: "side") ?? UIImage())
            }
            cell.setupCellTitle(sideDish.title)
            cell.setupCellDescription(sideDish.detail)
            cell.setupCellNormalPrice(sideDish.sPrice)
            if let nPrice = sideDish.nPrice {
                cell.setupCellEventPrice(nPrice)
            }
//            if let badge = sideDish.badge {
//                print(badge.count)
//                Array(badge).forEach { item in
//                    if item == "이벤트특가" {
//                        cell.foodInfoStackView.eventStackView.eventPriceLabel?.text = item
//                    } else {
//                        cell.foodInfoStackView.eventStackView.launchingPriceLabel?.text = item
//                    }
//                }
//            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 343, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 30, right: 15)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellIdentifier.foodHeader, for: indexPath) as? CollectionViewHeader else {
            return UICollectionReusableView()
        }
        
        if kind == UICollectionView.elementKindSectionHeader
        {
            header.headerLabel.text = HeaderInfoList.infoList[indexPath.section]
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 343, height: 50)
    }
}
