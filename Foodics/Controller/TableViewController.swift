//
//  TableViewController.swift
//  Foodics
//
//  Created by Mohammed Essam on 10/26/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let pageSize = 20
    private var allCategories = [Int](){
        didSet{
            categories = allCategories.chunked(into: pageSize).first!
        }
    }
    private var categories = [Int](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        allCategories = Array(0...4000)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = "\(categories[indexPath.row])"

        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
                self.paginate(indexPath.row)

    }
    func paginate(_ index:Int){
        guard index >= categories.count - 1  else {
            return
        }
        let pagesCount = allCategories.chunked(into: pageSize).count
        if index % pageSize == 0{
            if (index/pageSize) < pagesCount{
                categories += allCategories.chunked(into: pageSize)[(index/pageSize)]
            }
        }else{
            if (Int(index/pageSize) + 1) < pagesCount{
                categories += allCategories.chunked(into: pageSize)[(Int(index/pageSize) + 1)]
            }
        }
    }

}
