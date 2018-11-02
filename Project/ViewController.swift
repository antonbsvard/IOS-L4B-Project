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
        self.getQuestions()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startQuizBtn.layer.cornerRadius = self.startQuizBtn.frame.width * 0.1
    }

    func getQuestions() -> Void {
        print("GetQuestions()")
        let jsonURLAsString = "https://opentdb.com/api.php?amount=10&type=multiple"
        guard let url = URL(string: jsonURLAsString) else {
            print("No URL")
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("No data")
                return
                
            }
            do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {fatalError("OPPS")}
                
//                print(json["results"]!)
                let results = json["results"]
                for object in (results as! NSArray) {
                    for item in object as! NSDictionary{
                        print("Key: " + (item.key as! String))
                        print("Value: " + (item.value as! String))
                        break
                    }
                    break
                }
            } catch{
                print("Inte BRa!")
            }
            
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
        }.resume()
    }

}

