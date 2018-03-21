//
//  DetailVC.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 17.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailIdLabel: UILabel!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailTitLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentView: UITableView!
    
    
    var detail: PostModel?
    var comm: BlogComment?
    var comment = [BlogComment]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        loadPostId()
        commentCell()
        detailTitleLabel.text = detail?.text
        detailDateLabel.text = detail?.datePublic
        detailTitLabel.text = detail?.title
        detailIdLabel.text = String(describing: detail!.id)

        
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
        
//        cell.nameCommentLabel.text = String(describing: comm?.id)
        cell.dateCommentLabel.text = comm?.datePublic
        cell.textCommentLabel.text = comm?.text
        cell.nameCommentLabel.text = value(forKey: "author") as! String
        
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
    
    
    func commentCell() {
        let idComment = (detail?.id)!
        guard let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/comments/posts/\(idComment)") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
                print(response)
                DispatchQueue.main.async {
                    
                }
            }
            
            guard let data = data else { return}
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    

    func loadComment(){
        
        let idComment = (detail?.id)!
        let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/comments/posts/\(idComment)")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.comment = try JSONDecoder().decode([BlogComment].self, from: data!)
                } catch {
                    print("Error")
                }
                DispatchQueue.main.async {
                    self.commentView.reloadData()
                }
            }
            }.resume()
    }

    
}

