//
//  UserVC.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 18.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit


class UserVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var loginButt: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let parameters = ["name": self.nameField.text!, "password": self.passField.text! ] as [String : Any]
        
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
            }
            
            guard let data = data else { return }
            do {
                let json: Any?
                json = try JSONSerialization.jsonObject(with: data, options: [])
                                print(json)
                DispatchQueue.main.async {
                    self.messageLabel.text = "User or password not valid"
                }
            } catch {
                print(error)
                //                self.titleLbl.text! = request.value(forHTTPHeaderField: "message")!
                //                titleLbl.text = httpBody.value(forKey: "message"))
            }
            
            
            
            }.resume()
    
    }
    
    


}
