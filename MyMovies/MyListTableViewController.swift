//
//  MyListTableViewController.swift
//  MyMovies
//
//  Created by Brandon Stark on 06/10/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit

class MyListTableViewController: UITableViewController {
    
    var item:String!
    let baseUrl = "http://www.omdbapi.com/?s="
    var baseUrlPlusItem:String!

    var todos = [Todo]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getListByName()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }
    
    private func getListByName() {
        
        baseUrlPlusItem = baseUrl.appending(item)
        
        let url = URL(string: baseUrlPlusItem)
        
        
        let theTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                let todosJson = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                
                
                let results = todosJson["Search"] as! Array<Dictionary<String, Any>>
                
                for item in results {
                    
                    
                    
                    let title = item["Title"] as! String
                    
                    
                    let todo = Todo()
                    todo.title = title
                    
                    
                    self.todos.append(todo)
                    
                    
                }
                
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
                
                print(todosJson)
            } catch let error {
                print(error)
            }
            
        }
        theTask.resume()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        
        
        
        // Configure the cell...
        
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toList" {
            let controller = segue.destination as! MyListTableViewController
            
            controller.apiUrl = apiUrl
            controller.session = session
            
            let selectedCell = tableView.indexPathForSelectedRow
            let user = users[selectedCell!.row]
            
            controller.user = user    }
    */

}