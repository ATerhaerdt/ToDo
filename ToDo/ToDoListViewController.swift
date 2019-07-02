//
//  ViewController.swift
//  ToDo
//
//  Created by Adam Terhaerdt on 7/1/19.
//  Copyright © 2019 Adam Terhaerdt. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{

    var itemArray = [item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        let newItem = item()
        newItem.title = "Buy Apples"
        itemArray.append(newItem)
        
        let newItem2 = item()
        newItem2.title = "Buy Pears"
        itemArray.append(newItem2)
        
        let newItem3 = item()
        newItem3.title = "Get Milk"
        itemArray.append(newItem3)
       
        
            if let items = defaults.array(forKey: "TodoListArray") as? [item]{
            itemArray = items

        }
    }

    
    //MARK - Tableview DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
       
        
        //Ternary Operator --> value = condition ? valueIsTrue : valueIsFalse
        cell.accessoryType = item.Done ? .checkmark : .none
        
        return cell
    }
    
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].Done = !itemArray[indexPath.row].Done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New To-Do Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen when the user clicks the Add Item on our UIAlert
            
            let newItem = item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

}
