//
//  UserVC.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 18.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Alamofire

class UserVC: UIViewController {

    let URLUser = "http://fed-blog.herokuapp.com/api/v1/security/login"
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var massegeLabel: UILabel!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let parameters: Parameters=[
            "name":nameTextField.text!,
            "password":passTextField.text!
        ]
        
        Alamofire.request(URLUser, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.massegeLabel.text = jsonData.value(forKey: "message") as! String?
                }
        
    }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        let name = nameTextField.text
        let pass = passTextField.text
        
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
