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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        loadPostId()
//        detailTitleLabel.text = detail?.text
//        detailDateLabel.text = detail?.datePublic
//        detailTitLabel.text = detail?.title
//        detailIdLabel.text = String(describing: detail!.id)
//
//    }
    
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

    
    
//    public func loadPostId() {
//
//        let  id = (detail?.id)!
//        let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/posts/\(id)")
//        guard let downloadURL = url else {return}
//
//        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
//            guard let data = data, error == nil ,  urlResponse != nil else {
//                print("error")
//
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let loadIdText = try decoder.decode( PostModel.self , from: data)
//
//                DispatchQueue.main.async {
//                    self.detailTitleLabel.text = loadIdText.title
//                    self.detailTitleLabel.text = loadIdText.text
//                }
//            }catch {
//                print("error after load")
//            }
//            }.resume()
//    }
    
  
    


