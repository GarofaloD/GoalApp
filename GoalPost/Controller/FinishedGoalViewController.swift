//
//  FinishedGoalViewController.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/24/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit
import CoreData

class FinishedGoalViewController: UIViewController, UITextFieldDelegate {

    //MARK:- Outlets
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTxtField: UITextField!
    
    
    //MARK:- Properties
    var goalDescription: String!
    var goalType: GoalType!
    
    
    
    //MARK:- Load Up Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //Starting values for these elements:
        createGoalButton.bindToKeyboard()
        pointsTxtField.delegate = self

        
    }
    
    //MARK:- Buttons
    @IBAction func createGoalWhenPressed(_ sender: UIButton) {
        //Checking for the existance of values on all necessary fields
        if pointsTxtField.text != "" {
            //Pass data into CoreData model
            self.save { (success) in
                if success {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func backWhenPressed(_ sender: UIButton) {
        dismissDetail()
    }
    

    //MARK:- Custom Functions
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    //Saving the data on the CoreData Model
    func save(completion: (_ finished: Bool) ->()){ //In-function completion handler
        //We need to create an access to teh context that we wll be using for saving...
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext) //...and tell wehere are we going ot be saving the data
        
        //Assignmento all the values that we will be saving
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTxtField.text!)!
        goal.goalProgress = Int32(0)
        
        //Reunning the saving needs to be done with a do / catch
        do {
            try managedContext.save()
            print("Data saved successfully")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    


}
