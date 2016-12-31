//
//  MMAgentsViewController.swift
//  MMPorjSwift
//
//  Created by admin on 17/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
import UIKit

class MMAgentsViewController: UIViewController {
    

@IBAction func revealSideBar() -> Void {
    let revealController = self.revealViewController() as! MMRevealViewController
    
    revealController.reveal(revealController);
    
    
}

}