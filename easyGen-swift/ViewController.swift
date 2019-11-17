//
//  ViewController.swift
//  easyGen-swift
//
//  Created by Sean Whitley on 11/16/19.
//  Copyright © 2019 Developed by Dubya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func doItButtonPressed(_ sender: Any) {
        let pass = PasswordService()
        let myPassword = pass.generatePassword()
        
        self.passwordTextField.text = myPassword
    }
    


}

