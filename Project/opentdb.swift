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
/* Contains functions for cummunication with the opentdb database
 - getQuestions() -> Void gets 10 new questions and puts them in the class variable questions
 
 TODO:
 - getNQuestions(nrOfQuestions) //get anny number of questions
 - getDifficulty(nrOfQuestions, difficulty) //get anny number of questions and specific difficulty
 
 */
class opentdb {

    private var IsDataReady : Bool = false
    
    private var questions = [question]()
    
    private let opentdbURL = "https://opentdb.com/api.php?"
    
    // Returns true if data is ready else false
    public func isQuestionsReady() -> Bool {
        return self.IsDataReady
    }
    
    // getQuestions() returns list of questions if data is ready else returns empty list
    //Parameters: NONE
    //Return: [question]
    func getQestions() -> [question] {
        if IsDataReady{
            return questions
        }
        else {
            return [question]()
        }
    }
    // getQuestionsFromDB() -> Void gets 10 new questions and puts them in the class variable questions
    //Parameters: NONE
    //Return: VOID
    public func getQuestionsFromDB() -> Void {
        print("Opentdb: GetQuestions()")
        
        let nrOfQuestions = 10
        let typeOfQuestion = "multiple"
        let jsonURLAsString = opentdbURL + "amount=" + String(nrOfQuestions) + "&type=" + typeOfQuestion
        
        //Checking the url is ok:
        guard let url = URL(string: jsonURLAsString) else {
            print("Opentdb: No URL")
            return
        }
        
        //Retrivieng data ascync:
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.IsDataReady = false
            //If no data recieved:
            guard let data = data else {
                print("Opentdb: No data")
                return
            }
            //Decoding JSON:
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {
                    print("Opentdb: Något gick snett med avkodningen av json")
                    return
                }
                let results = json["results"]
                //Looping through all questions recieved:
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
                        //Adding all info in the object to the question struct
                        let structQuestion = question(difficulty: difficulty, category: category, question: quest, correct_answer: correct_answer, incorrect_answers: incorrect_answers)
                        //Append question strukt to list of questions:
                        self.questions.append(structQuestion)
                    }
                    
                }

            } catch{
                print("Opentdb: Något gick snett i datahanteringen")
                return
            }
            //DONE!
            print("Opentdb: Klar med datahanteringen")
            self.IsDataReady = true
            }.resume()
        
    }

}
