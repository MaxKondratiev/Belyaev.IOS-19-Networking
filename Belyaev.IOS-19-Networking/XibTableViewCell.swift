//
//  XibTableViewCell.swift
//  Belyaev.IOS-19-Networking
//
//  Created by максим  кондратьев  on 10.06.2021.
//

import UIKit

class XibTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userIdLabel: UILabel!
    
    @IBOutlet weak var titleLAbel: UILabel!
    @IBOutlet weak var bodyLAbel: UILabel!
    
    func configure(_ post: Post)  {
        userIdLabel.text = String(post.id)
        titleLAbel.text = post.title
        bodyLAbel.text = post.body
        
        
    }
}
