import UIKit

class FoodCell: UICollectionViewCell {
    
    private var foodImageView: UIImageView!
    private var foodInfoStackView: FoodInfoStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFoodCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFoodCell()
    }
    
    func setupFoodName(_ text:String) {
        foodInfoStackView.setupFoodNameLabel(text)
    }
    
    func setupFoodDescription(_ text:String) {
        foodInfoStackView.setupFoodDescriptionLabel(text)
    }
    
    func setupFoodImage(_ image: UIImage) {
        foodImageView.image = image
    }
    
    func setupNormalPrice(_ text: String) {
        foodInfoStackView.setupNormalPrice(text)
    }
    
    func setupEventPrice(_ text: String) {
        foodInfoStackView.setupEventPrice(text)
    }
    
    func setupEventBadge(_ text: String) {
        foodInfoStackView.setupEventBadge(text)
    }
    
    func setupLaunchingBadge(_ text: String) {
        foodInfoStackView.setupLaunchingBadge(text)
    }
}

//MARK: -Setup && Cofiguration
private extension FoodCell {
    
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
