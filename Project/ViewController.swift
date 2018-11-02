//
//  ViewController.swift
//  Project
//
//  Created by Oscar Stenqvist on 2018-10-29.
//  Copyright © 2018 Oscar Stenqvist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startQuizBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startQuizBtn.clipsToBounds = true
        startQuizBtn.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startQuizBtn.layer.cornerRadius = self.startQuizBtn.frame.width * 0.1
    }


}

