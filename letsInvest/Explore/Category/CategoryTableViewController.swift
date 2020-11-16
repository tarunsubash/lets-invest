//
//  CategoryTableViewController.swift
//  letsInvest
//
//  Created by Subash on 15/11/20.
//  Copyright © 2020 Subash. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    let categoryViewModel: CategoryViewable
    
    init(categoryViewModel: CategoryViewable) {
        self.categoryViewModel = categoryViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init(categoryViewModel: CategoryViewModel())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryViewModel.numberOfCategories()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CategoryTableViewCell

        cell.configureCell(categoryModel: categoryViewModel.categories()[indexPath.item])
        cell.selectionStyle = .none

        return cell
    }

}
