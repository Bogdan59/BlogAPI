//
//  PostTable.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 19.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class PostTable: UITableViewCell, UITableViewDataSource, UITableViewDelegate{
    
    var comment: PostModel?
    
    @IBOutlet weak var nameTableLabel: UILabel!
    @IBOutlet weak var dateTableLable: UILabel!
    @IBOutlet weak var commentTableLable: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.comment?.text.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = nameTableLabel
        let date = dateTableLable
        let commentt = commentTableLable
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellCell")! as UITableViewCell
        
        cell.textLabel?.text = self.comment?.text
        cell.detailTextLabel?.text = String(describing: comment?.id)
        
        return cell
    }
    
}
