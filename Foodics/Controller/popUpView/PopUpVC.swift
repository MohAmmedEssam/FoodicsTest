//
//  PopUpVC.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/24/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismiss(_ sender: Any) {
        self.remove()
    }
    
    

}
