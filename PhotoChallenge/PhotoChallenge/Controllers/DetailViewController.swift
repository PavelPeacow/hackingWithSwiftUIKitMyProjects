//
//  DetailViewController.swift
//  PhotoChallenge
//
//  Created by Павел Кай on 14.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedImageTitle: String?
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleImage: UILabel = {
        let titleImage = UILabel()
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.textColor = .white
        titleImage.backgroundColor = .black
        titleImage.layer.cornerRadius = 12
        
        return titleImage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        view.addSubview(image)
        view.addSubview(titleImage)
                
        if let selectedImageTitle = selectedImageTitle {
            titleImage.text = selectedImageTitle
        }
        
        setConstraints()

    }
    


}

extension DetailViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImage.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            titleImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
