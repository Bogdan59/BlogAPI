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
    
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var massegeLabel: UILabel!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let logParameters: Parameters=[
            "name":nameTextField.text!,
            "password":passTextField.text!
        ]
        
        Alamofire.request(URLUser, method: .post, parameters: logParameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "id") as! Int
                        let userName = user.value(forKey: "username") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userPhone = user.value(forKey: "phone") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userName, forKey: "username")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        self.defaultValues.set(userPhone, forKey: "userphone")
                        
                        //switching the screen
                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewcontroller") as! ProfileViewController
                        self.navigationController?.pushViewController(profileViewController, animated: true)
                        
                        self.dismiss(animated: false, completion: nil)
                    }else{
                        //error message in case of invalid credential
                        self.massegeLabel.text = "Invalid username or password"
                    }
                }
        }
        
    }

    
    @IBAction func registerButton(_ sender: UIButton) {
       
        let regParameters: Parameters=[
            "name":nameTextField.text!,
            "password":passTextField.text!
        ]
        Alamofire.request(URLUser, method: .post, parameters: regParameters).responseJSON {
            
            response in
            //printing response
            print(response)
            
            if let result = response.result.value {
                
                //converting it as NSDictionary
                let jsonData = result as! NSDictionary
                
                //displaying the message in label
                self.massegeLabel.text = jsonData.value(forKey: "name") as! String?
            }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //if user is already logged in switching to profile screen
        if defaultValues.string(forKey: "name") != nil{
            let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewcontroller") as! ProfileViewController
            self.navigationController?.pushViewController(profileViewController, animated: true)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
