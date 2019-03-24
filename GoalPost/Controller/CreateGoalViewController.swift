//
//  CreateGoalViewController.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/21/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController {
    
    
    //MARK:- Outlets
    @IBOutlet weak var goalTextField: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    //MARK:- Properties
    var goalType : GoalType = .shortTerm
    
    
    
    
    //MARK:- Load Up Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Starting values for these elements:
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        
    }
    
    
    //MARK:- Buttons
    @IBAction func nextWhenPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func shortTermWhenPressed(_ sender: UIButton) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    

    @IBAction func longTermWhenPressed(_ sender: UIButton) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func backWhenPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    
    
    
}
