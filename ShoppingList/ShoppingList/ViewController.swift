//
//  ViewController.swift
//  ShoppingList
//
//  Created by Павел Кай on 06.08.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        let shareBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(shareLost))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearList))
        
        navigationItem.rightBarButtonItems = [addBtn, shareBtn]
        
        navigationItem.title = "Shopping List"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    

    @objc func addItem() {
        let ac = UIAlertController(title: "Add item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak self] _ in
            let answer = ac.textFields?.first?.text
            let indexPath = IndexPath(row: 0, section: 0)
            self?.shoppingList.append(answer!)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }))
        
        present(ac, animated: true)
    }
    
    @objc func clearList() {
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
    @objc func shareLost() {
        let list = shoppingList.joined(separator: ",")
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}

