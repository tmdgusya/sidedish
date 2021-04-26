import UIKit

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
    }
}

//MARK: @Action
extension MainViewController {
    @objc private func getNetworkData(_ notification: Notification) {
        guard let data = notification.userInfo?[KeyValue.sideDishes] as? SideDishes else { return }
        dataManager.addData(from: data)
        mainCollectionView.reloadData()
    }
}

//MARK: -Setup && Cofiguration
private extension MainViewController {
    
    private func setupMainCollectionView() {
        
        view.addSubview(mainCollectionView)
        configureMainCollectionView()
        mainCollectionView.register(FoodCell.self, forCellWithReuseIdentifier: CellIdentifier.foodCell)
        mainCollectionView.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifier.foodHeader)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.foodCell, for: indexPath) as? FoodCell else { return UICollectionViewCell() }
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
                cell.foodImageView.image = image
            } else {
                cell.foodImageView.image = UIImage(named: "side")
            }
            cell.foodInfoStackView.foodNameLabel.text = sideDish.title
            cell.foodInfoStackView.foodDescriptionLabel.text = sideDish.description
            cell.foodInfoStackView.priceStackView.normalPriceLabel.text = sideDish.sPrice
            if let nPrice = sideDish.nPrice {
                cell.foodInfoStackView.priceStackView.eventPriceLabel?.attributedText = PriceStackView.convertToNSAttributedString(from: nPrice)
            }
            if let eventPrice = sideDish.badge {
                eventPrice.forEach { badge in
                    if badge == "이벤트특가" {
                        cell.foodInfoStackView.eventStackView.eventPriceLabel?.text = badge
                    } else {
                        cell.foodInfoStackView.eventStackView.launchingPriceLabel?.text = badge
                    }
                }
            }
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
