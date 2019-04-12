//
//  ChatViewController.swift
//  DevelopersChat
//
//  Created by stag on 11/04/19.
//  Copyright © 2019 Gabriel Silva. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ChatViewController: UIViewController {

    @IBOutlet weak var textTextField: UITextField?
    @IBOutlet weak var tableViewChat: UITableView?
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
    }
    
    
    func loadChannelss() {
        
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
    }
}
