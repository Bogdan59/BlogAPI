//
//  AddPostVC.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 18.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {
    
    var addPost: PostModel?

    @IBOutlet weak var titleAddTextField: UITextField!
    @IBOutlet weak var textAddTextField: UITextField!
    
    @IBAction func addPostButton(_ sender: UIButton) {
//        let object = addPost(object)
        
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
//                    self.titleAddTextField.text =
//                    self.textAddTextField.text =
//                }
//            }catch {
//                print("error after load")
//            }
//            }.resume()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
