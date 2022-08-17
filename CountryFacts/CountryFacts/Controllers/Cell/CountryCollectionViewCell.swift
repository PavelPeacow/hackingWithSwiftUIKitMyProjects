//
//  CountryCollectionViewCell.swift
//  CountryFacts
//
//  Created by Павел Кай on 16.08.2022.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CountryCell"
    
    
    lazy var countryFlag: UILabel = {
        let countryFlag = UILabel()
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.font = UIFont.systemFont(ofSize: 38)
        return countryFlag
    }()
        
    lazy var countryName: UILabel = {
        let countryName = UILabel()
        countryName.translatesAutoresizingMaskIntoConstraints = false
        countryName.textColor = .black
        countryName.adjustsFontSizeToFitWidth = true
        countryName.textAlignment = .center
        countryName.numberOfLines = 2
        return countryName
    }()
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.backgroundColor = .orange
        contentView.layer.cornerRadius = 30
        
        contentView.addSubview(countryFlag)
        contentView.addSubview(countryName)

        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CountryCollectionViewCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            countryFlag.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countryFlag.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            
            countryName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countryName.topAnchor.constraint(equalTo: countryFlag.bottomAnchor),
            countryName.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
