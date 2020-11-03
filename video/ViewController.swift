//
//  ViewController.swift
//  video
//
//  Created by rizky on 02/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        model.getMovie()
    }


}

