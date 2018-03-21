//
//  PostTableViewCell.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 19.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCommentLabel: UILabel!
    @IBOutlet weak var dateCommentLabel: UILabel!
    @IBOutlet weak var textCommentLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
