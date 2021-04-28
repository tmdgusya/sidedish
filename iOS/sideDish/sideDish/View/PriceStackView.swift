import UIKit

class PriceStackView: UIStackView {
    
    private var normalPriceLabel: UILabel!
    private var eventPriceLabel: UILabel?
    private var peddingView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupMainView()
    }
    

}

extension PriceStackView {
    
    private func setupMainView() {
        configureMainStackView()
        configureNormalPriceLabel()
        configureEventPriceLabel()
    }
    
    private func configureMainStackView() {
        axis = .horizontal
        spacing = 4
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureNormalPriceLabel() {
        normalPriceLabel = UILabel(frame: .zero)
        normalPriceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        addArrangedSubview(normalPriceLabel)
        normalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        normalPriceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        peddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        addArrangedSubview(peddingView!)
    }
    
    private func configureEventPriceLabel() {
        eventPriceLabel = UILabel(frame: .zero)
        eventPriceLabel?.font = eventPriceLabel?.font.withSize(14)
        eventPriceLabel?.textColor = UIColor.systemGray2
        guard let eventPriceLabel = eventPriceLabel else { return }
        addArrangedSubview(eventPriceLabel)
        eventPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        eventPriceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        peddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        addArrangedSubview(peddingView!)
    }
    
    private func convertToNSAttributedString(from string: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: string)
        attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributedText.length))
        return attributedText
    }
}

extension PriceStackView {
    
    func setupNormalPriceLabel(_ text:String) {
        normalPriceLabel.text = text
    }
    
    func setupEventPriceLabel(_ text:String) {
        eventPriceLabel?.attributedText = convertToNSAttributedString(from: text)
    }
}
