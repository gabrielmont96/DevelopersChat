//
//  ViewController.swift
//  DevelopersChat
//
//  Created by stag on 11/04/19.
//  Copyright © 2019 Gabriel Silva. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField?.becomeFirstResponder()
    }

    func saveUsername() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(usernameTextField?.text, forKey: "username")
        userDefaults.synchronize()
    }

    @IBAction func getStartedTapped(_ sender: Any) {
        saveUsername()
        Auth.auth().signInAnonymously(completion: nil)
    }
}

