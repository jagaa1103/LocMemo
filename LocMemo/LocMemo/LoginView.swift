//
//  LoginView.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class LoginView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginClicked(sender: AnyObject) {
        LoginService.sharedInstance.loginUser(emailTextfield.text, pass: passwordTextfield.text){
            res in
            if(res == true){
//                go to MainView
                let mainView:MainView = self.storyboard!.instantiateViewControllerWithIdentifier("MainView") as! MainView
                self.presentViewController(mainView, animated: true, completion: nil)
                
            }else{
//                show failed alert
            }
        }
    }
    
    @IBAction func registerClicked(sender: AnyObject) {
        let registerView:RegisterView = self.storyboard!.instantiateViewControllerWithIdentifier("RegisterView") as! RegisterView
        self.presentViewController(registerView, animated: true, completion: nil)
    }
    
    @IBAction func forgotpassClicked(sender: AnyObject) {
        let forgotView:ForgotPassView = self.storyboard!.instantiateViewControllerWithIdentifier("ForgotPassView") as! ForgotPassView
        self.presentViewController(forgotView, animated: true, completion: nil)
    }
}