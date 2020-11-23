//
//  ViewController.swift
//  SignInWithApple
//
//  Created by Louie Jay Arreza on 11/19/20.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func LoginBtn(_ sender: Any) {
        
        if let authUI = FUIAuth.defaultAuthUI() {
            authUI.providers = [FUIOAuth.appleAuthProvider()]
            authUI.delegate = self
            let authViewController = authUI.authViewController()
            self.present(authViewController, animated: true)
        }
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let user = authDataResult?.user {
            print("User: \(user.uid), Email: \(user.email ?? "")")
        }
    }

}
