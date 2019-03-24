//
//  GoalsViewController.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/20/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit
import CoreData


//Auxiliary Variables
let appDelegate = UIApplication.shared.delegate as? AppDelegate //Runninga  delegation of the AppDelegate



class GoalsViewController: UIViewController {
    
    //MARK:- Properties
    
    
    
    
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
        
    }

    
    //MARK:- Buttons
    @IBAction func goalButtonPressed(_ sender: UIButton) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)




    }
    
    
    
    

} //EOC



extension GoalsViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    //Contento of rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalsCell else {return   UITableViewCell()}
        cell.configureCell(description: "Code every day", type: .shortTerm, goalProgressAmount: 5)
        
        return cell
    }
    
    
    
    
    
    
}
