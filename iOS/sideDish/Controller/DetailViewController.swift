import UIKit

class DetailViewController: UIViewController {
    
    private var hashData: String!
    
    private lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(backBarButtonTouched))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    func deliveryHash(_ detailHash: String) {
        hashData = detailHash
    }
}

//MARK: -Configuration && Setup
extension DetailViewController {
    
    private func setupMainView() {
        view.backgroundColor = UIColor.white
    }
}

//MARK: -Action
extension DetailViewController {
    @objc private func backBarButtonTouched() {
        navigationController?.popViewController(animated: true)
    }
}
