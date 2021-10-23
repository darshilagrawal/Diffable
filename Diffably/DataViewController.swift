//
//  DataViewController.swift
//  Diffably
//
//  Created by Darshil Agrawal on 18/10/21.
//

import Foundation
import UIKit

class DataViewController: UITableViewController {
    
    enum Section {
        case main
    }
    var dataEntries = [DataToDisplay]()
    var dataSource: UITableViewDiffableDataSource<Section,DataToDisplay>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diffable Collection View"
        configureDataSource()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addData))
    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section,DataToDisplay>(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = itemIdentifier.name
            return cell
        })
    }
    
    @objc func addData() {
        let alert = UIAlertController(title: "Create User", message: nil, preferredStyle: .alert)
        alert.addTextField{$0.placeholder = "Enter the Data"}
        let action = UIAlertAction(title: "Save", style: .default) { _ in
            let userName = alert.textFields?.first?.text ?? ""
            let newData = DataToDisplay(name: userName)
            self.dataEntries.append(newData)
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .destructive, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}
