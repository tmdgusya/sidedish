import UIKit

class CollectionViewHeader: UICollectionReusableView {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeaderLabel()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHeaderLabel()
        setupTapGesture()
    }
    
    func setupHeaderLabel(_ text: String) {
        headerLabel.text = text
    }
}

//MARK: -Configuration & Setup
private extension CollectionViewHeader {
    
    private func configureHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.widthAnchor.constraint(equalToConstant: 343).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }

}

//MARK: -Add TapGesture
private extension CollectionViewHeader {
    
    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSectionHeader(_:)))
        addGestureRecognizer(gesture)
    }
    
    @objc private func didTapSectionHeader(_ gesture: UITapGestureRecognizer) {
        //add Notification Method or Delegate
    }
}
