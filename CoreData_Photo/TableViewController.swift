//
//  TableViewController.swift
//  CoreData_Photo
//
//  Created by Just Kidding on 4/9/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var imageData: [UIImage] = []
//    var imageData:  UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchObject()
    }

    func fetchObject() {
        if let data = try? AppDelegate.context.fetch(Entity.fetchRequest()) as [Entity] {
            self.imageData = data.map{$0.image} as!  [UIImage]
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchObject()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imageData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.imageView?.image = imageData[indexPath.row]
        return cell
    }
    

   

}
