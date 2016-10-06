//
//  MovieDetailsTableViewController.swift
//  MyMovies
//
//  Created by Brandon Stark on 06/10/16.
//  Copyright © 2016 training. All rights reserved.
//

import UIKit

class MovieDetailsTableViewController: UIViewController {
    
    @IBOutlet weak var linkPlot: UILabel!
    @IBOutlet weak var linkYear: UILabel!
    @IBOutlet weak var linkMovietitle: UILabel!
    @IBOutlet weak var linkPoster: UIImageView!
    
    var selectedMovie:Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: selectedMovie.poster)
        let data = try? Data(contentsOf: url!)
        linkPoster.image = UIImage(data: data!)
        
        linkYear.text = selectedMovie.year
        linkMovietitle.text = selectedMovie.title

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}
