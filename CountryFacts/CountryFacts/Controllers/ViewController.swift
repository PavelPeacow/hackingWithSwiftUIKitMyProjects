//
//  ViewController.swift
//  CountryFacts
//
//  Created by Павел Кай on 16.08.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var countryList = [Country]()
    
    lazy var collectionTable: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 120, height: 100)
        
        let collectionTable = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionTable.translatesAutoresizingMaskIntoConstraints = false
        collectionTable.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: CountryCollectionViewCell.identifier)
        collectionTable.backgroundColor = .black
        collectionTable.delegate = self
        collectionTable.dataSource = self
        return collectionTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        title = "Country List"
        
        
        view.addSubview(collectionTable)
        
        let addJSONToArray = { (fetchedCountyList: [Country]) in
            self.countryList = fetchedCountyList
            DispatchQueue.main.async {
                self.collectionTable.reloadData()
            }
        }
        
        fetchJSON(onCompletion: addJSONToArray)
        
        setConstraints()
    }


}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionTable.dequeueReusableCell(withReuseIdentifier: CountryCollectionViewCell.identifier, for: indexPath) as! CountryCollectionViewCell
       
        let countryItem = countryList[indexPath.item]
        cell.countryFlag.text = countryItem.flag
        cell.countryName.text = countryItem.name.common
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        let countryItem = countryList[indexPath.item]
        
        vc.countryItem = countryItem
                
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
