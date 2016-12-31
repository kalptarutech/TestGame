import Foundation
import UIKit


class ViewController:UIViewController {
    @IBOutlet weak var  revealButtonItem : UIButton!;
    @IBOutlet weak var  pLabel : KAProgressLabel!;
    @IBOutlet weak var  imageView : NZCircularImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView.image = UIImage(named: "300x300.jpg")!
        var rndValue: Float =  Float(arc4random_uniform(30) % 360)
        var rndValue2: Float = Float(arc4random_uniform(33) % 360)
        self.pLabel.setStartDegree(CGFloat(rndValue), timing: TPPropertyAnimationTimingEaseInEaseOut, duration: 1, delay: 0)
        self.pLabel.setEndDegree(CGFloat(rndValue2), timing: TPPropertyAnimationTimingEaseInEaseOut, duration: 1, delay: 0)
        var weakSelf = self
    
        /*
        self.pLabel.labelVCBlock = {(label: KAProgressLabel) -> Void in
            var delta: CGFloat = label.endDegree - label.startDegree
            label.text = String(format: "%.0f%%", (delta / 3.6))
            var endDegree: CGFloat = label.endDegree
            if label.endDegree < 0.0 {
                endDegree += 360.0
            }
            weakSelf.pLabel.startLabel.text! = String(format: "%.f", weakSelf.pLabel.startDegree)
            weakSelf.pLabel.endLabel.text = String(format: "%.f", endDegree)
        }
       */
        
        self.pLabel!.startDegree = 0;
        self.pLabel!.endDegree = 60;
    //    self.pLabel!.startDegree = CGFloat((self.pLabel!.startLabel!.text! as NSString).floatValue);
       // self.pLabel!.endDegree = CGFloat((self.pLabel!.endLabel!.text! as NSString).floatValue);
        
        
      //  self.pLabel.labelAnimCompleteBlock = {(label: KAProgressLabel) -> Void in
       //     print("Animation complete !")
       // }
        self.pLabel.trackWidth = 2.0;
        self.pLabel.progressWidth = 4.0;
        // self.pLabel.fillColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.3];
        self.pLabel.progressColor = UIColor.redColor()
        self.pLabel.isStartDegreeUserInteractive = false
        self.pLabel.isEndDegreeUserInteractive = false
        self.pLabel.fillColor = UIColor.clearColor()
        self.pLabel.layer.borderColor = UIColor.clearColor().CGColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}