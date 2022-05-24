//
//  LogoutView.swift
//  HotelApp
//


//

import UIKit

class LogoutView: UIView {
    
    var homeViewController: HomeViewController?
    var accountViewControler: AccountViewController?
    var bookingViewController: BookingViewController?
    
    let headerView: UIView = {
       let hv = UIView()
        hv.backgroundColor = UIColor.orange
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
    
    let logoutLabel :UILabel = {
       let ll = UILabel()
        ll.text = "Шығу"
        ll.textColor = UIColor.white
        ll.textAlignment = .center
        ll.font = UIFont.boldSystemFont(ofSize: 15)
        ll.translatesAutoresizingMaskIntoConstraints = false
        return ll
    }()
    
    let descriptionLabel: UILabel = {
       let dl = UILabel()
        dl.text = "Шығуға сенімдісіз бе?"
        dl.textColor = UIColor.black
        dl.textAlignment = .center
        dl.font = UIFont.systemFont(ofSize: 15)
        dl.translatesAutoresizingMaskIntoConstraints = false
        return dl
    }()
    
    let okButton: UIButton = {
       let button = UIButton()
        button.setTitle("Иә", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(okButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Болдырмау", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        return button
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
        backgroundColor = UIColor.white
        addSubview(headerView)
        headerView.addSubview(logoutLabel)
        addSubview(descriptionLabel)
        addSubview(okButton)
        addSubview(cancelButton)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":headerView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":headerView]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoutLabel]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":logoutLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":descriptionLabel]))
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":okButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":cancelButton]))
        let widthBtn = (UIScreen.main.bounds.width - 120) / 2
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0(\(widthBtn))]-30-[v1(\(widthBtn))]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":okButton,"v1":cancelButton]))
    }
    
    @objc func okButtonClicked() {
        if homeViewController != nil {
        homeViewController?.Logout()
        } else if accountViewControler != nil {
            accountViewControler?.Logout()
        } else if bookingViewController != nil {
            bookingViewController?.Logout()
        }
    }
    
    @objc func cancelButtonClicked() {
        if homeViewController != nil {
            homeViewController?.cancelLogout()
        } else if accountViewControler != nil {
            accountViewControler?.cancelLogout()
        } else if bookingViewController != nil {
            bookingViewController?.cancelLogout()
        }
    }
    
}
