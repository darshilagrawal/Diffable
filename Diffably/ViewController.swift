//
//  ViewController.swift
//  Diffably
//
//  Created by Darshil Agrawal on 31/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section,DataToDisplay>!
    enum Section {
        case main
    }
    var dataEntries = [DataToDisplay]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diffable Table View"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addData))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(navigateNext))
        configureDataSource()
    }
    
    @objc func addData() {
        let alert = UIAlertController(title: "Create User", message: nil, preferredStyle: .alert)
        alert.addTextField{$0.placeholder = "Enter the Data"}
        let action = UIAlertAction(title: "Save", style: .default) { _ in
            let userName = alert.textFields?.first?.text ?? ""
            let newData = DataToDisplay(name: userName)
            self.dataEntries.append(newData)
        }
        alert.addAction(action)
    }
    
    @objc func navigateNext() {
        let vc = DataViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section,DataToDisplay>(tableView: tableview, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = itemIdentifier.name
            return cell
        })
    }


}

