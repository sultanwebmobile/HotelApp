//
//  RecommandedHotelView.swift
//  HotelApp
//


//

import UIKit

class RecommandedHotelView: UIView {
    
    let recommendedCellId = "recommendedCellId"
    let recommendedHotelLabel: UILabel = {
       let rhv = UILabel()
        rhv.text = "Ұсынылған қоңақ үйлер"
        rhv.textColor = UIColor.darkGray
        rhv.translatesAutoresizingMaskIntoConstraints = false
        rhv.font = UIFont.boldSystemFont(ofSize: 16)
        return rhv
    }()
    
    var homeViewController: HomeViewController?
    
    lazy var ViewMoreLabel: UILabel = {
        let vml = UILabel()
        vml.text = "Қарау"
        vml.textColor = UIColor.darkGray
        vml.translatesAutoresizingMaskIntoConstraints = false
        vml.font = UIFont.systemFont(ofSize: 13)
        vml.textAlignment = .right
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(ViewMoreTapped))
        vml.isUserInteractionEnabled = true
        vml.addGestureRecognizer(labelTapped)
        return vml
    }()
    
    lazy var recommendedHotelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       let rhcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        rhcv.translatesAutoresizingMaskIntoConstraints = false
        rhcv.delegate = self
        rhcv.dataSource = self
        rhcv.backgroundColor = UIColor.white
        return rhcv
    }()
    
    let recommendedHotels = [Hotel(name: "Almaty Health Resort Club",imageName: "DZH_Health_Resort_Club",price:40000,number_of_stars: 3,hotel_description: "Мейрамханасы бар Almaty Health Resort Club қонақ үйі Genting Highlands-тен 6,2 шақырым қашықтықта орналасқан негізгі нөмірлерді ұсынады. Тегін WiFi қонақ үйдің барлық аумағында қолжетімді және тегін тұрақ беріледі. Әр нөмірде жазық экранды теледидар бар. Ванна бөлмесінде тегін дәретхана керек-жарақтары мен фен бар. Қонақтар балық тоғанының үстінде орналасқан қытайлық мейрамханада кешкі асты тамашалай алады. Сондай-ақ, қонақтар Ае емдеу орталығында қытайлық дәстүрлі шипа емін  алады. "),Hotel(name: "Best Western Atakent Hotel",imageName: "Best_Western_Bowery_Hanbee_Hotel",price:22000,number_of_stars: 5, hotel_description: "Алматыдағы метро мен Шымбұлақ, Шарың және Медеу сияқты негізгі жергілікті көрікті орындардың жанында орналасқан осы темекі шекпейтін қонақ үйді таңдаңыз. Клиенттерге ерекше қызмет көрсетуді және қолжетімді бағамен орналастыруды ұсынатын Best Western Bowery Hanbee Hotel-ге қош келдіңіздер. Нью-Йорктегі бұл қонақ үйде жақсы жабдықталған нөмірлер мен HBO® кабельді спутниктік теледидары және тегін сымсыз жоғары жылдамдықты интернет бар апартаменттер бар."),Hotel(name: "Hotel Astana Opera",imageName: "Hotel_Paris_Louvre_Opera",price:17000,number_of_stars: 5, hotel_description: "Astana Opera  қонақ үйі 21 ғасырдың әсем ғимаратында орналасқан. Барлық нөмірлер ауа баптағышпен және дыбыс оқшаулағышпен жабдықталған. Қонақтарға тегін Wi-Fi және тегін сусындар мен тамақтары бар шағын-бар беріледі.")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(recommendedHotelLabel)
        addSubview(ViewMoreLabel)
        addSubview(recommendedHotelCollectionView)
        recommendedHotelCollectionView.register(RecommandedHotelCollectionViewCell.self, forCellWithReuseIdentifier: recommendedCellId)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":recommendedHotelLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]-20-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":recommendedHotelLabel,"v1":recommendedHotelCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(100)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":ViewMoreLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":ViewMoreLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":recommendedHotelCollectionView]))
    }
    
    
    
}

extension RecommandedHotelView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendedCellId, for: indexPath) as! RecommandedHotelCollectionViewCell
        cell.hotel = recommendedHotels[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewController?.passedHotel = recommendedHotels[indexPath.item]
        homeViewController?.displayDetailHotel()
    }
    
    @objc func ViewMoreTapped() {
        homeViewController?.recommendedHotels = recommendedHotels
        homeViewController?.showMoreRecommendedHotels()
    }
    
}
