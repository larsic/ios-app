//
//  SearchViewController.swift
//  MyMovies
//
//  Created by Brandon Stark on 05/10/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchIt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toList" {
            let controller = segue.destination as! MyListTableViewController
            
            let search = searchIt.text
            
            let toArray = search?.replacingOccurrences(of: " ", with: "+")
            
            
            controller.item = toArray
        }
    }
    

}
