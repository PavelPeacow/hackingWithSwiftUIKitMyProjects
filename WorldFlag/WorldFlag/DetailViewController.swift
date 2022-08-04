//
//  DetailViewController.swift
//  WorldFlag
//
//  Created by Павел Кай on 04.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var flagImage: UIImageView!
    
    var selectedFlag: String?
    var selectedCountryName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedFlag = selectedFlag {
            flagImage.image = UIImage(named: selectedFlag)
            flagImage.layer.borderWidth = 5
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        
    }
    
    @objc func share() {
        guard let selectedFlag = selectedFlag else {
            return
        }
        
        guard let flagImage = flagImage else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [selectedFlag, flagImage], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }



}
