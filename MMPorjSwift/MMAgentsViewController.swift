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
      
//        for i in 0...99
//        {
//            items.append(i)
//        }
 
    }
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
       // carouselTest = iCarousel.init(frame: carouselTestInXib.frame);
        //carouselTest.delegate = self;
       // carouselTest.dataSource = self;
       // self.view.bringSubviewToFront(carouselTest);
        self.view!.setNeedsLayout()
        self.view!.layoutIfNeeded()
        self.carouselTest!.setNeedsLayout()
        self.carouselTest!.layoutIfNeeded()

        carouselTest.type = .CoverFlow2
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        for i in 0...99
        {
            items.append(i)
        }
        
        self.carouselTest.reloadData();
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int
    {
        return items.count
    }
    
    func carouselItemWidth(carousel: iCarousel) -> CGFloat {
       return 320 - 20;
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView
    {
        var agentViewInCarouel: MMAgentViewInCarousel!;

        //create new view if no view is available for recycling
        if (view == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            
            agentViewInCarouel = self.storyboard?.instantiateViewControllerWithIdentifier("MMAgentViewInCarousel") as! MMAgentViewInCarousel;
            agentViewInCarouel.view.frame = CGRectMake(0, 0, carousel.frame.size.width, carousel.frame.size.height);
        
        }
        else
        {
            
            return view!;
        }
        
       
//        itemView.frame = frame;
        carousel.backgroundColor = UIColor.brownColor()
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
       // label.text = "\(items[index])"
        
        return agentViewInCarouel.view;
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