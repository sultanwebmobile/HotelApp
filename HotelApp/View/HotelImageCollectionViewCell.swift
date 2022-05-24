//
//  HotelImageCollectionView.swift
//  HotelApp
//
//  

//

import UIKit

class HotelImageCollectionViewCell: UICollectionViewCell {
    
    var hotelImageView: UIImageView = {
        let hiv = UIImageView()
        hiv.translatesAutoresizingMaskIntoConstraints = false
        hiv.contentMode = .scaleAspectFill
        hiv.clipsToBounds = true
        hiv.backgroundColor = UIColor.red
        return hiv
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
        addSubview(hotelImageView)
        backgroundColor = UIColor.yellow
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":hotelImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":hotelImageView]))
    }
    
    
}
