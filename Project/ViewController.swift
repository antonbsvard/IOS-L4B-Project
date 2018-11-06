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
    
    let db = opentdb() //Skapar databasklassen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startQuizBtn.clipsToBounds = true
        startQuizBtn.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view, typically from a nib.
        

        //***************EXEMPELKOD:************************
        //Exempel på hur man skulle kunna hämta datan
        db.getQuestionsFromDB() //Hämtar 10 nya frågor ascynk
        self.getData(db: db) //Kontrollerar om datan är hämtad
        //***************EXEMPELKOD SLUT:*******************
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startQuizBtn.layer.cornerRadius = self.startQuizBtn.frame.width * 0.1
    }
    
    //**************EXEMPELFUNKTION******************
    //Kontrollerar om datan är redo rekursivt ascynk, kontroll varje 0.5s
    func getData(db: opentdb) -> Void {
        if db.isQuestionsReady(){
            print("Data is ready")
            print(db.getQestions()[0])
        }
        else {
            print("Kolla om datan är redo om 0.5 secunder")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.getData(db: db)
            }
        }
    }
    //***************EXEMPELFUNKTION SLUT:***********


}

