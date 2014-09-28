//
//  TableViewController.swift
//  FDT
//
//  Created by Cathy Cheung on 9/27/14.
//  Copyright (c) 2014 unet. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var allFoodTrucks = [FoodTruck]()
    
    var filteredFoodTrucks = [FoodTruck]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample data for foodTruckArr
        self.allFoodTrucks = [FoodTruck(name:"Los Compadres Taco Truck", category:"Mexican"),
        FoodTruck(name:"Senor Sisig", category:"Filipino"),
        FoodTruck(name:"Off the Grid", category:"Food Fest"),
        FoodTruck(name:"Bacon Bacon", category:"American"),
        FoodTruck(name:"Curry Up Now", category:"Indian")]
        
        // Reload the table
        self.tableView.reloadData()
    }

    
    // Number of rows needed
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == (self.searchDisplayController!.searchResultsTableView) {
//            return self.filteredFoodTrucks.count
//        } else {
//            return self.allFoodTrucks.count
//        }
        return self.allFoodTrucks.count
    }
    
    // What to put in each row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var truck : FoodTruck
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
//        if tableView == (self.searchDisplayController!.searchResultsTableView) {
//            truck = filteredFoodTrucks[indexPath.row]
//        } else {
//            truck = allFoodTrucks[indexPath.row]
//        }
        truck = allFoodTrucks[indexPath.row]
        
        // Configure the cell
        cell.textLabel!.text = truck.name + "   (" +  truck.category + ")"
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredFoodTrucks = self.allFoodTrucks.filter({( trucks: FoodTruck) -> Bool in
            let nameMatch = trucks.name.rangeOfString(searchText)
            let catMatch = trucks.category.rangeOfString(searchText)
            return (nameMatch != nil) || (catMatch != nil)
        })
    }

    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }

    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    

    
}
