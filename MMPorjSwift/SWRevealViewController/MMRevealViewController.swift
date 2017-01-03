//
//  RevealViewController.swift
//  MapSample
//
//  Created by Patrick BODET on 14/04/2016.
//  Copyright © 2016 iDevelopper. All rights reserved.
//

import UIKit

class MMRevealViewController: SWRevealViewController, SWRevealViewControllerDelegate {
    
    
    var width = UIScreen.mainScreen().bounds.size.width
    let rightWidth: CGFloat = 70 // Right width hen menu is open
    
    var tapRecognizer: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.toggleAnimationType = .EaseOut
        
        self.rightViewRevealWidth = width
        self.rightViewRevealOverdraw = 0
        self.rightViewRevealDisplacement = 0
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var controller: UIViewController = (storyboard.instantiateViewControllerWithIdentifier("ViewController") as? ViewController)!
        let revealController = self;
        revealController.rightViewController = controller
        revealController.rightViewRevealOverdraw = 0
        revealController.rightViewRevealWidth = revealController.width
        revealController.setFrontViewPosition(.LeftSideMost, animated: true)
        revealController.panGestureRecognizer().enabled = true
        
        
        self.rightViewController!.view!.addGestureRecognizer(self.panGestureRecognizer()!);
        
        self.frontViewPosition = .LeftSideMost
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapRecognizer?.numberOfTouchesRequired = 1
        tapRecognizer?.cancelsTouchesInView = false
       self.rightViewController.view.addGestureRecognizer(tapRecognizer!)
    }
    func addRightViewController(rightVC: UIViewController) -> Void {
      
        let revealController = self;
       // revealController.rightViewController = rightVC;
        revealController .setRightViewController(rightVC, animated: true);
        revealController.rightViewRevealOverdraw = 0
        revealController.rightViewRevealWidth = revealController.width
        revealController.setFrontViewPosition(.LeftSideMost, animated: true)
        
 
     // if(rightVC.isKindOfClass(NSClassFromString("MMAgentsViewController"))) {

        
    //  } else {
        revealController.panGestureRecognizer().enabled = true
        
        
        self.rightViewController!.view!.addGestureRecognizer(self.panGestureRecognizer()!);
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapRecognizer?.numberOfTouchesRequired = 1
        tapRecognizer?.cancelsTouchesInView = false
        self.rightViewController.view.addGestureRecognizer(tapRecognizer!)
        
        

    
       
        
        self.frontViewPosition = .LeftSideMost
        
       

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        width = size.width
        self.rightViewRevealWidth = rightWidth
        self.rightViewRevealOverdraw = width - rightWidth;
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        if self.frontViewPosition == .LeftSide {
            reveal(self)
            self.panGestureRecognizer().enabled = true
        }
    }
    
    func reveal(sender: AnyObject?) {
        if self.frontViewPosition == .LeftSide {
            // Close menu
            self.rightViewRevealWidth = width
            self.rightViewRevealOverdraw = 0;
            self.setFrontViewPosition(.LeftSideMost, animated: true)
        }
        else {
            // Open menu
            self.rightViewRevealWidth = rightWidth
            self.rightViewRevealOverdraw = width - rightWidth;
            self.setFrontViewPosition(.LeftSide, animated: true)
        }
    }
    
    func stopPanGesture(animated: Bool) {
        self.rightViewRevealWidth = rightWidth
        self.rightViewRevealOverdraw = width - rightWidth;
        self.setFrontViewPosition(.LeftSide, animated: animated)
        self.panGestureRecognizer().enabled = false
    }
    
    //MARK: - SWRevealViewControllerDelegate
    
    func revealController(revealController: SWRevealViewController!, willMoveToPosition position: FrontViewPosition) {
        if position == .LeftSide {
            self.rightViewController.view.addGestureRecognizer(tapRecognizer!)
        }
        if position == .Left {
            stopPanGesture(false)
        }
    }
    
    func revealController(revealController: SWRevealViewController!, panGestureMovedToLocation location: CGFloat, progress: CGFloat, overProgress: CGFloat) {
        if location >= -rightWidth {
            stopPanGesture(false)
        }
    }
    
    func revealController(revealController: SWRevealViewController!, panGestureEndedToLocation location: CGFloat, progress: CGFloat, overProgress: CGFloat) {
        if location <= -rightWidth {
            stopPanGesture(true)
        }
    }
}
