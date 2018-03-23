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
        
        let parameters = ["name":  nameField.text!, "password": passField.text! ]

        guard let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/security/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")



        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)

                DispatchQueue.main.async {
                    self.messageLabel.text = "Welcome back"
                }

            }

            guard let data = data else { return }
            do {
                let json: Any?
                json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
                DispatchQueue.main.async {
                    self.messageLabel.text = "User or password not valid"
                }
            } catch {
                print(error)
            }

            }.resume()
    }
    
    
//    let myUrl = URL(string: "http://fed-blog.herokuapp.com/api/v1/security/login");
//    var request = URLRequest(url:myUrl!);
//    request.httpMethod = "POST";
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let postString = "name=name&password=password";
//    request.httpBody = postString.data(using: String.Encoding.utf8);
//
//    URLSession.shared.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) -> Void in
//    if error != nil {
//    print("fail")
//    return
//    }
//
//    do {
//    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//    print ("1")
//
//    if let parseJSON = json {
//
//    let id = parseJSON["id"] as? String
//    print ("2")
//    if( id != nil) {
//
//    } else {
//    let errorMessage = parseJSON["message"] as? String
//    print ("3")
//    }
//    }
//    } catch{
//    print(error)
//    }
//    }).resume()
//
//
//}
    
    
}
