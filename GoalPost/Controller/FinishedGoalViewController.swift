//
//  FinishedGoalViewController.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/24/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

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
        //Pass data into CoreData model
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    //MARK:- Custom Functions
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
        
    }


}
