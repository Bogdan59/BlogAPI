//
//  ViewController.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 17.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var post = [PostModel]()
    
    @IBOutlet weak var postView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadURL()
        postView.dataSource = self
        postView.delegate = self
        
    }
    
    func loadURL(){
        let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/posts")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.post = try JSONDecoder().decode([PostModel].self, from: data!)
                } catch {
                    print("Error")
                }
                DispatchQueue.main.async {
                    self.postView.reloadData()
                }
            }
            }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionVC
        cell.titleLabel.text = post[indexPath.row].title.capitalized
        cell.datePublicLabel.text = post[indexPath.row].datePublic.capitalized
        cell.idLabel.text = String(post[indexPath.row].id)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let desCV = MainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        desCV.detail = post[indexPath.row]
        self.navigationController?.pushViewController(desCV, animated: true)
    }
    
}
