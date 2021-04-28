import UIKit

class FoodCell: UICollectionViewCell {
    
<<<<<<< HEAD
    private var foodImageView: UIImageView!
    private var foodInfoStackView: FoodInfoStackView!
=======
    var foodImageView: UIImageView!
    var foodInfoStackView: FoodInfoStackView!
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFoodCell()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFoodCell()
        setupTapGesture()
    }
    
    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSectionHeader(_:)))
        addGestureRecognizer(gesture)
    }
    @objc private func didTapSectionHeader(_ gesture: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: .nextVC, object: self, userInfo: ["location": gesture.location(in: self)])
    }
}

//MARK: -Setup && Cofiguration
extension FoodCell {
    
    private func setupFoodCell() {
        configureFoodCell()
        configureFoodImageView()
        configureFoodStackView()
    }
    
    private func configureFoodCell() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureFoodImageView() {
        foodImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
        foodImageView.layer.masksToBounds = true
        foodImageView.layer.cornerRadius = 5
        addSubview(foodImageView)
    }
    
    private func configureFoodStackView() {
        foodInfoStackView = FoodInfoStackView(frame: .zero)
        addSubview(foodInfoStackView)
        foodInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130).isActive = true
        foodInfoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    }
}
<<<<<<< HEAD

//MARK: -CellInfo

extension FoodCell {
    
    func setupCellTitle(_ text: String) {
        foodInfoStackView.setupFoodNameLabel(text)
    }
    
    func setupCellDescription(_ text: String) {
        foodInfoStackView.setupFoodDescriptionLabel(text)
    }
    
    func setupCellNormalPrice(_ text: String) {
        foodInfoStackView.setupFoodNormalPrice(text)
    }
    
    func setupCellEventPrice(_ text: String) {
        foodInfoStackView.setupFoodEventPrice(text)
    }
    
    func setupCellImage(_ image: UIImage) {
        foodImageView.image = image
    }
}
=======
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
