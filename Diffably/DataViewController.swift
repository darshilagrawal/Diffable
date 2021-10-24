//
//  DataViewController.swift
//  Diffably
//
//  Created by Darshil Agrawal on 18/10/21.
//

import Foundation
import UIKit

class DataViewController: UICollectionViewController {
    
    enum Section {
        case main
    }
    var dataEntries = [DataToDisplay]()
//    var dataSource: UITableViewDiffableDataSource<Section,DataToDisplay>!
    var dataSource: UICollectionViewDiffableDataSource<Section,DataToDisplay>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diffable Collection View"
        configureDataSource()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addData))
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section,DataToDisplay>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            
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
