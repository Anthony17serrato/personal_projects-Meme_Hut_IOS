//
//  SignInViewController.swift
//  Meme Hut
//
//  Created by Anthony Serrato on 6/22/18.
//  Copyright © 2018 What U Want. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignInViewController: UIViewController {
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SignUpButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: "blarg@gmail.com", password: "dummyPass") { (authResult, error) in
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
