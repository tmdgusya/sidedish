import UIKit

class MainViewController: UIViewController {
    
    private var collectionViewDelegate: CollectionViewDelegate = {
       let delegate = CollectionViewDelegate()
        return delegate
    }()
    
    private var collectionViewDataSource: CollectionViewDataSource = {
       let dataSource = CollectionViewDataSource()
        return dataSource
    }()
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = collectionViewDataSource
        view.delegate = collectionViewDelegate
        return view
    }()
    
    private lazy var headerOfCollectionView: CollectionViewHeader = {
        let header = CollectionViewHeader(frame: .zero)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainCollectionView()
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
