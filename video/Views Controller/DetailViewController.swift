//
//  DetailViewController.swift
//  video
//
//  Created by rizky on 04/11/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard movie != nil else {
            return
        }
        
        let embedUrlString = Constant.YT_EMBED_URL + movie!.videoId
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = movie!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: movie!.published)
        
        textView.text = movie!.description
        
    }

}
