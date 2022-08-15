//
//  ViewController.swift
//  PhotoChallenge
//
//  Created by Павел Кай on 14.08.2022.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var images = [imageItem]()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.separatorColor = .black
        table.rowHeight = 60
        table.backgroundColor = .orange
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .orange
        
        view.backgroundColor = .orange
        view.addSubview(table)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(showAddSheet))
        
        setConstraints()
    }
    
    
}

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let imageItem = images[indexPath.item]
        cell.textLabel?.text = imageItem.captionString
        cell.backgroundColor = .orange
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let imageItem = images[indexPath.item]
        
        let path = getDocumentsDirectory().appendingPathComponent(imageItem.imageName)
        vc.image.image = UIImage(contentsOfFile: path.path)
        
        vc.selectedImageTitle = imageItem.captionString
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @objc func showAddSheet() {
        let vc = AddImageViewController()
        vc.images = images
        vc.completionHandler = { [weak self] image in
            self?.images = image
            self?.table.reloadData()
        }
        present(vc, animated: true)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
}
