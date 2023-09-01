import UIKit

class ToastView: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 10
        layer.masksToBounds = true

        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    func setMessage(_ message: String, textAlignment: NSTextAlignment = .center) {
            label.text = message
            label.textAlignment = textAlignment // Set the text alignment based on the parameter
            let maxSize = CGSize(width: frame.width - 16, height: .greatestFiniteMagnitude)
            let messageHeight = message.boundingRect(with: maxSize,
                                                     options: .usesLineFragmentOrigin,
                                                     attributes: [.font: label.font],
                                                     context: nil).height

           
            let newFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: messageHeight + 16)
            frame = newFrame
        }
}
