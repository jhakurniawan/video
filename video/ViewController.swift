//
//  ViewController.swift
//  video
//
//  Created by rizky on 02/11/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getMovie()
    }
    
    func moviesFetched(_ movies: [Movie]) {
        self.movies = movies
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.VIDEOCELL_ID, for: indexPath)
        
        let title = self.movies[indexPath.row].title
        
        cell.textLabel?.text=title
        
        return cell
    }

}

