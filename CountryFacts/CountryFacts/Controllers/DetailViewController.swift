//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Павел Кай on 16.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var countryItem: Country!
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = view.bounds.size
        return scrollView
    }()
    
    lazy var countryFlag: UILabel = {
        let countryFlag = UILabel()
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.font = UIFont.systemFont(ofSize: 100)
        countryFlag.textAlignment = .center
        countryFlag.text = countryItem.flag
        return countryFlag
    }()
    
    lazy var countryName: UILabel = {
        let countryName = UILabel()
        countryName.translatesAutoresizingMaskIntoConstraints = false
        countryName.textColor = .white
        countryName.font = UIFont.systemFont(ofSize: 40)
        countryName.textAlignment = .center
        countryName.numberOfLines = 0
        countryName.text = countryItem.name.official
        return countryName
    }()
    
    lazy var countryDetails: UIView = {
        let countryDetails = UIView()
        countryDetails.translatesAutoresizingMaskIntoConstraints = false
        countryDetails.backgroundColor = .darkGray
        countryDetails.layer.cornerRadius = 20
        return countryDetails
    }()
    
    lazy var countryCapital: UILabel = {
        let countryCapital = UILabel()
        countryCapital.translatesAutoresizingMaskIntoConstraints = false
        countryCapital.textColor = .white
        countryCapital.text = "Capital: \(countryItem.capital?.joined(separator: ", ") ?? "")"
        return countryCapital
    }()
    
    lazy var countryRegion: UILabel = {
        let countryRegion = UILabel()
        countryRegion.translatesAutoresizingMaskIntoConstraints = false
        countryRegion.textColor = .white
        countryRegion.text = "Region: \(countryItem.region)"
        return countryRegion
    }()
    
    lazy var countryCurrencies: UILabel = {
        let countryCurrencies = UILabel()
        countryCurrencies.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencies.textColor = .white
        countryCurrencies.text = "Currency: \(countryItem.currencies?.keys.first ?? "")"
        return countryCurrencies
    }()
    
    lazy var countryStatus: UILabel = {
        let countryStatus = UILabel()
        countryStatus.translatesAutoresizingMaskIntoConstraints = false
        countryStatus.textColor = .white
        countryStatus.text = "Status: \(countryItem.status)"
        return countryStatus
    }()
    
    lazy var countryLandlocked: UILabel = {
        let countryLandlocked = UILabel()
        countryLandlocked.translatesAutoresizingMaskIntoConstraints = false
        countryLandlocked.textColor = .white
        countryLandlocked.text = "Landlocked: \(countryItem.landlocked ? "Yes" : "No")"
        return countryLandlocked
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        

        
        view.addSubview(scrollView)
        
        scrollView.addSubview(countryFlag)
        scrollView.addSubview(countryName)
        
        scrollView.addSubview(countryDetails)
        countryDetails.addSubview(countryCapital)
        countryDetails.addSubview(countryRegion)
        countryDetails.addSubview(countryCurrencies)
        countryDetails.addSubview(countryStatus)
        countryDetails.addSubview(countryLandlocked)
        
        
        
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        
        let rect = scrollView.subviews.reduce (CGRect.zero) {
            $0.union($1.frame)
        }
        
        scrollView.contentSize = rect.size
    }
}

extension DetailViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            countryFlag.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryFlag.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 30),
            
            countryName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryName.topAnchor.constraint(equalTo: countryFlag.bottomAnchor, constant: 20),
            countryName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),

            
            
            countryDetails.topAnchor.constraint(equalTo: countryName.bottomAnchor, constant: 20),
            countryDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryDetails.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            countryDetails.heightAnchor.constraint(equalToConstant: 240),

            countryCapital.topAnchor.constraint(equalTo: countryDetails.layoutMarginsGuide.topAnchor),
            countryCapital.leadingAnchor.constraint(equalTo: countryDetails.layoutMarginsGuide.leadingAnchor),

            countryRegion.topAnchor.constraint(equalTo: countryCapital.topAnchor, constant: 50),
            countryRegion.leadingAnchor.constraint(equalTo: countryDetails.layoutMarginsGuide.leadingAnchor),

            countryCurrencies.topAnchor.constraint(equalTo: countryRegion.topAnchor, constant: 50),
            countryCurrencies.leadingAnchor.constraint(equalTo: countryDetails.layoutMarginsGuide.leadingAnchor),

            countryStatus.topAnchor.constraint(equalTo: countryCurrencies.topAnchor, constant: 50),
            countryStatus.leadingAnchor.constraint(equalTo: countryDetails.layoutMarginsGuide.leadingAnchor),

            countryLandlocked.topAnchor.constraint(equalTo: countryStatus.topAnchor, constant: 50),
            countryLandlocked.leadingAnchor.constraint(equalTo: countryDetails.layoutMarginsGuide.leadingAnchor),
            
        ])
    }
}
