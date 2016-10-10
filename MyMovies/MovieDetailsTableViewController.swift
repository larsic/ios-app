//
//  MovieDetailsTableViewController.swift
//  MyMovies
//
//  Created by Brandon Stark on 06/10/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit
import CoreData

class MovieDetailsTableViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    
    
    
    @IBOutlet weak var linkPlot: UILabel!
    @IBOutlet weak var linkYear: UILabel!
    @IBOutlet weak var linkMovietitle: UILabel!
    @IBOutlet weak var linkPoster: UIImageView!
    
    
    
    
    var selectedMovie:Movie!
    let plotUrl = "http://www.omdbapi.com/?i="
    var plotUrlPlusTitle:String!
    var plotUrlPlusTitleShort:String!
    var titleToAppend:String!
    let appendFull = "&plot=full"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: selectedMovie.poster)
        let data = try? Data(contentsOf: url!)
        linkPoster.image = UIImage(data: data!)
        
        linkYear.text = selectedMovie.year
        linkMovietitle.text = selectedMovie.title
        
        
        returnPlot()
        
        let del = UIApplication.shared.delegate as! AppDelegate
        context = del.persistentContainer.viewContext
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func save(_ sender: Any) {
        let aMovie = NSEntityDescription.insertNewObject(forEntityName: "ListOfMovies", into: context) as! ListOfMovies
        
        aMovie.title = selectedMovie.title
        aMovie.imdbID = selectedMovie.imdbID
        aMovie.year = selectedMovie.year
        aMovie.plot = selectedMovie.plot
        aMovie.poster = selectedMovie.poster
        
        
        do{
            try context.save()
            dismiss(animated: true, completion: nil)
        } catch let error {
            print(error)
        }
        
    }

    private func returnPlot() {
        
        
        titleToAppend = selectedMovie.imdbID
        plotUrlPlusTitleShort = plotUrl.appending(titleToAppend)
        plotUrlPlusTitle = plotUrlPlusTitleShort.appending(appendFull)
        
        let url = URL(string: plotUrlPlusTitleShort)
        
        let theTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                let todosJson = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                
                
                // let results = todosJson["object"] as! Array<Dictionary<String, Any>>
                
                
                    
                    let plot = todosJson["Plot"] as! String
                    

                    self.selectedMovie.plot = plot
                    
                
                    
                
                
                DispatchQueue.main.async{
                    self.linkPlot.text = self.selectedMovie.plot
                }

            } catch let error {
                print(error)
            }
           
            
        }
       theTask.resume()
           
    }
   


}
