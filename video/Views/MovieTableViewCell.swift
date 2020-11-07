//
//  MovieTableViewCell.swift
//  video
//
//  Created by rizky on 03/11/20.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var movie:Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ m:Movie){
        
        self.movie = m
        guard self.movie != nil else {
            return
        }
        
        self.titleLabel.text = movie?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: movie!.published)
        
        guard self.movie!.thumbnail != "" else {
            return
        }
        
        if let cacheData = CacheManager.getMovieCache(self.movie!.thumbnail){
            
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
        
        let url = URL(string: self.movie!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                CacheManager.setMovieCache(url!.absoluteString, data: data)
                
                if url!.absoluteString != self.movie?.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        dataTask.resume()
    }
    
}
