//
//  UIButtonExt.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/22/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//
//Extension for selected and deselected buttons


import UIKit

extension UIButton {
    
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.3043160468, green: 0.7535336921, blue: 0.6524634752, alpha: 1)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 0.6624928106)
    }
    
    
    
}
