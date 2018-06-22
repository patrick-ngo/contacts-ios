//
//  UIViewController+Keyboard.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-21.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    //MARK: - Notification Keyboard Methods -
    
    @objc func registerKeyBoardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChangeFrame), name: .UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide), name: .UIKeyboardDidHide, object: nil)
    }
    
    //Tells the observer the keyboard will show soon
    @objc func keyboardWillShow(_ notification: Notification) {
    }
    
    
    //Tells the observer the keyboard will hide soon
    @objc func keyboardWillHide(_ notification: Notification) {
    }
    
    
    //Tells the observer the keyboard did hide
    @objc func keyboardDidHide(_ notification: Notification) {
    }
    
    //Tells the observer the keyboard has been shown
    @objc func keyboardDidShow(_ notification: Notification) {
    }
    
    //Tells the observer the keyboard frame has changed
    @objc func keyboardWillChangeFrame(_ notification: Notification) {
    }
    
    
    //MARK: - Helper methods -
    
    //Dismisses the keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func heightOfKeyboard(notification: Notification) -> CGFloat{
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            return keyboardSize.height
        }
        
        return 0
    }
    
    /**
     *  @brief Animates view frame after view constraint has
     *  been updated use to changes in keyboard frame.
     *  Calls self.view layoutIfNeeded method in completion
     *  @param notification The NSNotification that sent
     *  the event
     **/
    func animateViewDueToChangeInKeyboardHeight(notification: Notification) {
        let duration:NSNumber = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        
        UIView.animate(withDuration: TimeInterval(duration.floatValue), delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
