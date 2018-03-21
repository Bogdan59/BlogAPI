//
//  DetailVC.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 17.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit

//class PostTableView: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
//
//
//    @IBOutlet weak var nameTableLabel: UILabel!
//    @IBOutlet weak var dateTableLable: UILabel!
//    @IBOutlet weak var commentTableLable: UILabel!
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return (DetailVC.detail?.text.count)!
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellCell")! as PostTableView
//
//        let name = nameTableLabel
//        var date = dateTableLable
//        var comment = commentTableLable
//
//
////        cell.textLabel?.text = self.detail?.text
////        cell.detailTextLabel?.text = String(describing: detail!.id)
//
//
//        return cell
//    }
//
//
//
//}

class DetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailIdLabel: UILabel!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailTitLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    //    @IBOutlet weak var nameCommentLabel: UILabel!
    //    @IBOutlet weak var dateCommentLabel: UILabel!
    //    @IBOutlet weak var textCommentLabel: UILabel!
    
    
    
    
    var detail: PostModel?
    var comment: BlogComment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPostId()
        detailTitleLabel.text = detail?.text
        detailDateLabel.text = detail?.datePublic
        detailTitLabel.text = detail?.title
        detailIdLabel.text = String(describing: detail!.id)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    public func loadPostId() {
        
        let  id = (detail?.id)!
        let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/posts/\(id)")
        guard let downloadURL = url else {return}
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let data = data, error == nil ,  urlResponse != nil else {
                print("error")
                
                return
            }
            do {
                let decoder = JSONDecoder()
                let loadIdText = try decoder.decode( PostModel.self , from: data)
                
                DispatchQueue.main.async {
                    self.detailTitleLabel.text = loadIdText.title
                    self.detailTitleLabel.text = loadIdText.text
                }
            }catch {
                print("error after load")
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (detail?.text.count)!
        
        //        (self.detail?.text.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCell", for: indexPath) as! PostTableViewCell
        
        cell.nameCommentLabel.text = String(describing: detail!.id)
        cell.dateCommentLabel.text = detail?.datePublic
        cell.textCommentLabel.text = detail?.text
        
        //        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cellCell")! as UITableViewCell
        //
        //        cell.textLabel?.text = self.detail?.text
        //        cell.detailTextLabel?.text = String(describing: detail!.id)
        ////        cell.?.text
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 170
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    //    http://fed-blog.herokuapp.com/api/v1/comments/posts/21
    
    //    func downloadComment() {
    //
    //        let  id = (detail?.id)!
    //
    //        let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/comments/posts/\(id)")
    //        guard let downloadURL = url else {return}
    //
    //        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
    //            guard let data = data, error == nil ,  urlResponse != nil else {
    //                print("something is wrong")
    //                return
    //            }
    //            do
    //            {
    //                let decoder = JSONDecoder()
    //                let downloadTextfromID = try decoder.decode( BlogTegs.self , from: data)
    //
    //                DispatchQueue.main.async {
    //                    self.blogLable.text = downloadTextfromID.title
    //                    self.blogText.text = downloadTextfromID.text
    //                }
    //            }catch {
    //                print("something is wrong, after downloading")
    //            }
    //            }.resume()
    //    }
    
}

