//
//  LoginService.swift
//  LocMemo
//
//  Created by Enkhjargal Gansukh on 8/22/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import Firebase

class LoginService {
    
    class var sharedInstance: LoginService {
        struct Static {
            static var instance: LoginService?
        }
        if (Static.instance == nil) {
            Static.instance = LoginService()
        }
        return Static.instance!
    }
    
    func checkLogin(completionHandler:(res:Bool)->()){
        let ref = Firebase(url: Constants.DbUrl)
        ref.observeAuthEventWithBlock({ authData in
            if authData != nil {
                // user authenticated
                println(authData)
            } else {
                // No user is signed in
            }
        })
    }
    
    func loginUser(email: String, pass: String){
        let ref = Firebase(url: Constants.DbUrl)
        ref.authUser(email, password: pass) {
            error, authData in
            if error != nil {
                // an error occured while attempting login
            } else {
                // user is logged in, check authData for data
            }
        }
    }
    
    func registerUser(email: String, pass: String){
        let ref = Firebase(url: Constants.DbUrl)
        ref.createUser(email, password: pass,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                } else {
                    let uid = result["uid"] as? String
                    println("Successfully created user account with uid: \(uid)")
                }
        })
    }
    
    func logoutUser(){
        let ref = Firebase(url: Constants.DbUrl)
        ref.unauth()
    }
}