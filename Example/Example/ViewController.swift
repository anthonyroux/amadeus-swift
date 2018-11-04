//
//  ViewController.swift
//  Example
//
//  Created by Charly Maxter on 04/11/2018.
//  Copyright © 2018 amadeus4dev. All rights reserved.
//

import UIKit
import Amadeus

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let amadeus = Amadeus(client_id: "id", client_secret: "secret")
        
        amadeus.auth.testAuth()
        
        
    }


}

