//
//  CreateGoalViewController.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/21/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController {

    //MARK:- Properties
    
    
    
    
    //MARK:- Outlets
    @IBOutlet weak var goalTextField: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    
    
    
    //MARK:- Properties
    
    
    
    
    
    
    
    
    //MARK:- Load Up Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- Buttons
    @IBAction func nextWhenPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func shortTermWhenPressed(_ sender: UIButton) {
    }
    

    @IBAction func longTermWhenPressed(_ sender: UIButton) {
    }
    
    @IBAction func backWhenPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    
    
    
}
