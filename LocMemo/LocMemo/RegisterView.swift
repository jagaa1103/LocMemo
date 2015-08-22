//
//  RegisterView.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class RegisterView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var repassTextfield: UITextField!
    
    @IBAction func registerClicked(sender: AnyObject) {
        if(emailTextfield.text.isEmpty){
//           show insert email alert
        }else{
            if(passTextfield.text == repassTextfield.text){
                LoginService.sharedInstance.registerUser(emailTextfield.text, pass: passTextfield.text){
                    res in
                    if(res == true){
                        let loginView:LoginView = self.storyboard!.instantiateViewControllerWithIdentifier("LoginView") as! LoginView
                        self.presentViewController(loginView, animated: true, completion: nil)
                    }else{
//                        show alert error msg
                    }
                }
            }
        }
        
    }
    
}