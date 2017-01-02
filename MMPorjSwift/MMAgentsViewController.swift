//
//  MMAgentsViewController.swift
//  MMPorjSwift
//
//  Created by admin on 17/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
import UIKit

class MMAgentsViewController: UIViewController,iCarouselDelegate,iCarouselDataSource {
    
    var items: [Int] = []
   @IBOutlet weak var carouselTest : iCarousel!
    @IBOutlet var carouselTestInXib : UIView!
    
     override func awakeFromNib()
    {
        super.awakeFromNib()
      
        for i in 0...99
        {
            items.append(i)
        }
 
    }
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
       // carouselTest = iCarousel.init(frame: carouselTestInXib.frame);
        //carouselTest.delegate = self;
       // carouselTest.dataSource = self;
       // self.view.bringSubviewToFront(carouselTest);
        carouselTest.type = .CoverFlow2
        
        
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int
    {
        return items.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView
    {
        var label: UILabel
        var itemView: UIImageView
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame:carousel.frame)
            itemView.image = UIImage(named: "agent_card_background")
         //   itemView.backgroundColor = UIColor.blueColor();
            itemView.contentMode = .ScaleAspectFit
           // itemView.
            
          /*  label = UILabel(frame:itemView.bounds)
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = label.font.fontWithSize(50)
            label.tag = 1
            itemView.addSubview(label)
 */
        }
        else
        {
            //get a reference to the label in the recycled view
            itemView = view as! UIImageView;
         //   label = itemView.viewWithTag(1) as! UILabel!
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
      //  label.text = "\(items[index])"
        
        return itemView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            return value * 1.1
        }
        return value
    }


@IBAction func revealSideBar() -> Void {
    let revealController = self.revealViewController() as! MMRevealViewController
    
    revealController.reveal(revealController);
    
    
}

}