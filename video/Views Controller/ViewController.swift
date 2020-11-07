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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedMovie = movies[tableView.indexPathForSelectedRow!.row]
        
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.movie = selectedMovie
    }
    
    func moviesFetched(_ movies: [Movie]) {
        self.movies = movies
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.VIDEOCELL_ID, for: indexPath) as! MovieTableViewCell
        
        let movie = self.movies[indexPath.row]
        
        cell.setCell(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

