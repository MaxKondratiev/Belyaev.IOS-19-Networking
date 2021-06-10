//
//  ViewController.swift
//  Belyaev.IOS-19-Networking
//
//  Created by максим  кондратьев  on 09.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
   
    
    var networkManager = NetworkManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func downloadPost(_ sender: UIButton) {
        
        networkManager.getAllPosts { (posts) in
            DispatchQueue.main.async {
                self.titleLabel.text = "postsss done!"
            }
        }
    }
}

 
