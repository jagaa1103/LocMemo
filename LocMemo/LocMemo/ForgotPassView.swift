//
//  ForgotPassView.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class ForgotPassView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBAction func sendClicked(sender: AnyObject) {
        LoginService.sharedInstance.forgotPass(emailTextfield.text){
            res in
            if(res == true){
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
//               error alert
            }
        }
    }
}