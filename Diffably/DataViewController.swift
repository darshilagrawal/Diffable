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
    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section,DataToDisplay>(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = itemIdentifier.name
            return cell
        })
    }
    
}
