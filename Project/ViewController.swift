//
//  ViewController.swift
//  Project
//
//  Created by Oscar Stenqvist on 2018-10-29.
//  Copyright © 2018 Oscar Stenqvist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startpageImage: UIImageView!
    
    @IBOutlet weak var startQuizBtn: UIButton!
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [
            UIImage(named: "owl1"),
            UIImage(named: "owl2"),
            UIImage(named: "owl3"),
            UIImage(named: "owl4"),
            UIImage(named: "owl5"),
            UIImage(named: "owl6"),
            UIImage(named: "owl7"),
            UIImage(named: "owl8"),
            UIImage(named: "owl9"),
            UIImage(named: "owl10"),
            UIImage(named: "owl11"),
            UIImage(named: "owl12"),
            UIImage(named: "owl13"),
            UIImage(named: "owl14"),
            UIImage(named: "owl16"),
            UIImage(named: "owl17"),
            UIImage(named: "owl18"),
            UIImage(named: "owl19"),
            UIImage(named: "owl20"),
            UIImage(named: "owl21"),
            UIImage(named: "owl22"),
            UIImage(named: "owl23")
            ] as! [UIImage]
        startpageImage.clipsToBounds = true
        startpageImage.animationImages = images
        startpageImage.animationDuration = 2.0
        startpageImage.startAnimating()
        startQuizBtn.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startQuizBtn.layer.cornerRadius = self.startQuizBtn.frame.width * 0.1

    }


}

