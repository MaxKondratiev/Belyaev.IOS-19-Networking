//
//  ViewController.swift
//  Belyaev.IOS-19-Networking
//
//  Created by максим  кондратьев  on 09.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
  
    @IBOutlet weak var myTableView: UITableView!
    
    
    var posts: [Post] = [] {
        didSet {
            myTableView.reloadData()
        }
    }
  
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myTableView.delegate = self
        myTableView.dataSource = self
        
      
        let nib = UINib(nibName: "XibTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "xibCell")

    }

    @IBAction func downloadPost(_ sender: UIButton) {
        
        networkManager.getAllPosts {[weak self](posts) in
            DispatchQueue.main.async {
                self?.posts = posts
            }
        }
    }
}

 
extension ViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xibCell", for: indexPath) as! XibTableViewCell
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = cell.frame.width / 6
        
        cell.configure(posts[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}
