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
    var goals = [Goal]()
    
    
    
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchCoreDataObjects()
        
        tableView.reloadData()
    }
    
    
    
    //MARK:- Buttons
    @IBAction func goalButtonPressed(_ sender: UIButton) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)

    }
    
    
    
    func fetchCoreDataObjects(){
        self.fetch { (success) in
            if success{
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
} //EOC



extension GoalsViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count

    }
    
    //Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    //Content of rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalsCell else {return   UITableViewCell()}
        let goal = goals[indexPath.row] //Array of goals
        cell.configureCell(goal: goal) //Configuration of golas in GoalsCell
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE", handler: { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        })
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [deleteAction]
    }
    
    
    
    
}







extension GoalsViewController {
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
           goals = try managedContext.fetch(fetchRequest)
            print("Successfuly fetch data")
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("Goal successfully removed")
        } catch {
            debugPrint("Could not delete: \(error.localizedDescription)")
        }
        
    }
    
    
    
    
}
