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
    

        
        
        
        let parameters = ["title": self.titleAddTextField.text!, "text": self.textAddTextField.text! ] as [String : Any]

        guard let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/security/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
                
//                DispatchQueue.main.async {
//                    self.messageLabel.text = "Welcome back"
//                }
                
            }
            
            guard let data = data else { return }
            do {
                let json: Any?
                json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
//                DispatchQueue.main.async {
//                    self.messageLabel.text = "User or password not valid"
//                }
            } catch {
                print(error)
            }
            
            }.resume()
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
