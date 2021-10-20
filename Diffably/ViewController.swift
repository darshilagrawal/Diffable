//
//  ViewController.swift
//  Diffably
//
//  Created by Darshil Agrawal on 31/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addData))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .plain, target: self, action: #selector(navigateNext))
    }
    
    @objc func addData() {
        
    }
    
    @objc func navigateNext() {
        let vc = DataViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

