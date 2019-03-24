//
//  CreateGoalViewController.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/21/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController, UITextViewDelegate {
    
    
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
        goalTextField.delegate = self
        
    }
    
    
    //MARK:- Buttons
    @IBAction func nextWhenPressed(_ sender: UIButton) {
        //Checking for the goal field not to be ampty
        if goalTextField.text != "" && goalTextField.text != "What is your goal?" {
            //Assoc with the storyboard that will take us to the finished goal vc and initializing the data. Once completed, this shoul dtake us to the next VC
            guard let finishedGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishedGoalVC") as? FinishedGoalViewController else { return }
            finishedGoalVC.initData(description: goalTextField.text, type: goalType)
            presentDetail(finishedGoalVC)
        }
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextField.text = ""
        goalTextField.textColor = UIColor.black
    }
    
    
}
