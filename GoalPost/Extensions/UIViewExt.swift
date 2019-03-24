//
//  UIViewExt.swift
//  GoalPost
//
//  Created by Daniel Garofalo on 3/22/19.
//  Copyright © 2019 Daniel Garofalo. All rights reserved.
//
//Extension to animate the action of the button when tapping into the view that holds te description of the goal. UIButton inherits from UIView.


import UIKit

extension UIView {
    
    //Based on the notification center, so every time the view is tapped, the button will respond with an action. keyboardWillChangeFrameNotification is the main responder
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    //Base function
    @objc func keyboardWillChange(_ notification: NSNotification){
        //keyboardWillChangeFrameNotification is the base class that will provide these actions
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
        //Both starting frame and ending frame need to be casted as a raw value and then to a cgrect value so they can be handled
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = (endingFrame.origin.y) - (startingFrame.origin.y) // This is the result value that will give us the actual size of the keyboard =
        
        //Actual animation
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve!), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
        
    }
    
    
    
    
    
}

