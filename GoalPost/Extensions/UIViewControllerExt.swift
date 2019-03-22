//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/21/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//

//This extension is being built so we can animate the transitio from the second view controller to the main one


import UIKit

extension UIViewController {
    
    //Function that will pass the view controller that we wil need to animate
    func presentDetail(_ viewControllerToPresent: UIViewController ) {
        //Creation of the transition, with duration, type, direction. It also needs to be added
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey:kCATransition)

        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail(){
        //Creation of the transition, with duration, type, direction. It also needs to be added
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey:kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    
    
    
    
}
