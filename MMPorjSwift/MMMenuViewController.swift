//
//  MMMenuViewController.swift
//  MMPorjSwift
//
//  Created by admin on 04/09/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class MMMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        var controller: UIViewController = (storyboard.instantiateViewControllerWithIdentifier("ViewController") as? ViewController)!
        let revealController = self.revealViewController() as! MMRevealViewController
        revealController.rightViewController = controller
        revealController.rightViewRevealOverdraw = 0
        revealController.rightViewRevealWidth = revealController.width
        revealController.setFrontViewPosition(.LeftSideMost, animated: true)
        revealController.panGestureRecognizer().enabled = true
    }


    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : MMMenuControllerTableViewCell =  tableView.dequeueReusableCellWithIdentifier("MMMenuControllerTableViewCell", forIndexPath: indexPath) as! MMMenuControllerTableViewCell;
        
        var title : String!;
        var subTitle : String!;
        var imageName : String!;

        switch indexPath.row {
        case 0:
                title = "MISSIONS";
                subTitle = "Become the strongest";
                imageName = "missions_button";
                break;
        case 1:
            title = "AGENTS";
            subTitle = "Manage your agents";
            imageName = "agents_button";
            break;
        case 2:
            title = "TRAINING";
            subTitle = "Make your crew strong";
            imageName = "training_button";
            break;
        case 3:
            title = "SETTINGS";
            subTitle = "Change your prefernces";
            imageName = "setting_button";
            break;
        case 4:
            title = "ACHEVEMENTS";
            subTitle = "Lookout for new ones";
            imageName = "achievement_button";
            break;
        
           
        default :
            break;
        }
        cell.lblTitle.text = title;
        cell.lblSubTitle.text = subTitle
        cell.imgView.image = UIImage.init(imageLiteral: imageName);
        return cell
    }
    
    // MARK: - Table view delegate
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var vcIdentifier: String!;
        switch indexPath.row {
        case 0:
            vcIdentifier = "MMAgentsViewController";
            self.loadMainVC(vcIdentifier);
            break;
        case 1 :
            vcIdentifier = "MMAgentsViewController";
            self.loadMainVC(vcIdentifier);
            break;
        case 2 :
            vcIdentifier = "MMAgentsViewController";
            self.loadMainVC(vcIdentifier);
            break;
        case 6:
          //  self.logout();
            break;
        default:
            break;
        }

        
          }

    func loadMainVC(vcIdentifier: String) -> Void {
        let mainVC:UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier(vcIdentifier))!;
        
        let revealController = self.revealViewController() as! MMRevealViewController
        
        revealController.addRightViewController(mainVC);
    
    }
    
    
    //Pragma mark - Navigation buttons
    
   @IBAction func revealSideBar() -> Void {
    let revealController = self.revealViewController() as! MMRevealViewController

    revealController.reveal(revealController);
    
    
    }


}
