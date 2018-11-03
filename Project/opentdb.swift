//
//  opentdb.swift
//  Project
//
//  Created by Oscar Stenqvist on 2018-11-03.
//  Copyright © 2018 Oscar Stenqvist. All rights reserved.
//

import Foundation
import UIKit


struct question {
    let difficulty : String
    let category : String
    let question : String
    let correct_answer : String
    let incorrect_answers : [String]
    
}

class opentdb {

    var questions = [question]()
    func getQuestions() -> Void {
        print("Opentdb: GetQuestions()")
        let jsonURLAsString = "https://opentdb.com/api.php?amount=10&type=multiple"
        guard let url = URL(string: jsonURLAsString) else {
            print("Opentdb: No URL")
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Opentdb: No data")
                return
                
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {
                    print("Opentdb: Något gick snett med avkodningen av json")
                    return
                }
                
                let results = json["results"]
                for object in (results as! NSArray) {
                    if let x : NSDictionary = object as? NSDictionary{
                        let category = (x["category"] as! String)
                        let quest = (x["question"] as! String)
                        let correct_answer = (x["correct_answer"] as! String)
                        let difficulty = (x["difficulty"] as! String)
                        var incorrect_answers = [String]()
                        for i in (x["incorrect_answers"] as? NSArray)!{
                            incorrect_answers.append(i as! String)
                        }
                        let structQuestion = question(difficulty: difficulty, category: category, question: quest, correct_answer: correct_answer, incorrect_answers: incorrect_answers)
                        self.questions.append(structQuestion)
                    }
                    
                }

            } catch{
                print("Opentdb: Något gick snett i datahanteringen")
                return
            }
            print("Opentdb: Klar med datahanteringen")
            }.resume()
        
    }
}
