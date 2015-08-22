//
//  ViewController.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutClicked(sender: AnyObject) {
        LoginService.sharedInstance.logoutUser(){
            res in
            if(res == true){
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }

}

