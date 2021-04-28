import UIKit

class DetailViewController: UIViewController {
    
    private var detailhash: String!
    
    private lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(backBarButtonTouched))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.fetchDetailInfo(detailhash!)
        addNotificationObserver()
        setupMainView()
    }
    
    func deliveryHashData(_ hashInfo: String) {
        detailhash = hashInfo
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(getDetailFoodInfo(_:)), name: .detailInfo, object: nil)
    }
}

extension DetailViewController {
    
    @objc private func getDetailFoodInfo(_ notification: Notification) {
        guard let foodInfo = notification.userInfo?["detailInfo"] as? DetailFoodInfo else { return }
        print(foodInfo)
    }
    
    @objc private func backBarButtonTouched() {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController {
    
    private func setupMainView() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = leftButton
        view.backgroundColor = UIColor.white
    
    }
}
