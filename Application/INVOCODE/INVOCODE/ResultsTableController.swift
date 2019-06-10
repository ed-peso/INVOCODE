//
//  ResultsTableController1.swift
//  INVOCODE
//
//  Created by Edward Bonsu on 09/05/2019.
//  Copyright © 2019 Edward Bonsu. All rights reserved.
//


/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The table view controller responsible for displaying the filtered products as the user types in the search field.
 */

import UIKit

class ResultsTableController: BaseTableViewController {
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewController.tableViewCellIdentifier, for: indexPath)
        let product = filteredProducts[indexPath.row]
        configureCell(cell, forProduct: product)
        
        return cell
    }
}

