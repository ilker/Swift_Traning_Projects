//
//  ViewController.swift
//  CatchTheCreeper
//
//  Created by ILKER on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playButton(_ sender: Any) {
        
        performSegue(withIdentifier: "GameVC", sender: nil)
        
    }
    
}

