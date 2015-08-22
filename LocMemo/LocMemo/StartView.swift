//
//  StartView.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class StartView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginService.sharedInstance.checkLogin(){
            res in
            if(res == true){
//            go MainView
                let mainView:MainView = self.storyboard!.instantiateViewControllerWithIdentifier("MainView") as! MainView
                self.presentViewController(mainView, animated: true, completion: nil)

            }else{
//            go LoginView
                let loginView:LoginView = self.storyboard!.instantiateViewControllerWithIdentifier("LoginView") as! LoginView
                self.presentViewController(loginView, animated: true, completion: nil)
            }
        }
    }
    
}