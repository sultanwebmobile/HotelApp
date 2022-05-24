

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    var menu: Menu? {
        didSet {
            if let imageName = menu?.imageName {
            imageView.image = UIImage(named: imageName)
            }
            if let name = menu?.name {
                nameLabel.text = name
            }
        }
    }
    
    var imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "home")
        iv.tintColor = UIColor.black
        iv.backgroundColor = UIColor.white
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var nameLabel: UILabel = {
       let nl = UILabel()
        nl.text = "Басты бет"
        nl.textColor = UIColor.darkGray
        nl.font = UIFont.boldSystemFont(ofSize: 14)
        nl.translatesAutoresizingMaskIntoConstraints = false
        return nl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(20)]-30-[v1(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView,"v1":nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    }
    
    
    
}
