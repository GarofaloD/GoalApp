//
//  GoalsCell.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/21/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

import UIKit

class GoalsCell: UITableViewCell {

    //MARK:- Poperties
    
    
    
    
    //MARK:- Outlets
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    
    
    
    
    
    //MARK:- Load Up Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK:- Custom Funtions
    func configureCell(description: String, type: String, goalProgressAmount: Int ){
        self.goalDescriptionLbl.text = description
        self.goalType.text = type
        self.goalProgress.text = String(goalProgressAmount)
        
    }
    
    
    
    
    
    
    
}
