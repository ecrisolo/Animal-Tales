//
//  ViewController.swift
//  Animal Tales
//
//  Created by Elizabeth Crisologo on 2/3/18.
//  Copyright © 2018 Elizabeth Crisologo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "login", let userName = userNameTextfield.text {
            let destVC = segue.destination as? SearchViewController
            
            destVC?.userName = userName
        }
    }

}

