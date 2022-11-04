
import UIKit

class TableSectionHeaderView: UITableViewHeaderFooterView {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    static var heightConstant: CGFloat = 48
    
    // MARK: - subviews
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(named: "Heart")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    var titulo: String? {
        didSet {
            label.text = titulo
        }
    }
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            iconImageView, label
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return stack
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(containerStackView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Self.heightConstant)
        ])
        
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
