//
//  ViewController.swift
//  RPI Calculator
//
//  Created by Arash Namvar on 5/18/15.
//  Copyright (c) 2015 Arash Namvar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let rpiorange = UIColor(red: 255/255, green: 121/255, blue: 0, alpha: 1)
    var temp: Int?
    var rh: Int?
    @IBOutlet weak var tempinput: UITextField!
    @IBOutlet weak var rhinput: UITextField!
    @IBOutlet weak var GPP: UILabel!
    @IBOutlet weak var degswitch: UISegmentedControl!
    @IBOutlet weak var calcButton: UIButton!
    var celcius = 0.00
    var faren = 0.00
    var currentdisplay = "faren";
    var celcius_temp = "text";
    var faren_temp = "text"
    
    
    @IBAction func changed(sender: UISegmentedControl) {
        switch degswitch.selectedSegmentIndex {
        case 0:
            if currentdisplay == "celcius" && count(tempinput.text) > 1{
                
                celcius_temp = tempinput.text
//                celcius = celcius_temp.toInt()!
                celcius = (celcius_temp as NSString).doubleValue
                celciusToFaren();
                faren_temp = String(stringInterpolationSegment: faren)
                tempinput.text = faren_temp
                currentdisplay = "faren"
                
            }
            else{
                currentdisplay = "faren"
            }
        case 1:
            if currentdisplay == "faren" && count(tempinput.text) > 1{
                faren_temp = tempinput.text
                faren = (faren_temp as NSString).doubleValue
                farenToCelcius()
                celcius_temp = String(stringInterpolationSegment: celcius)
//                celcius_temp = NSString(stringInterpolationSegment: celcius)
                tempinput.text = celcius_temp
                currentdisplay = "celcius"
            }
            else{
                currentdisplay = "celcius"
            }
            
        default:
            println("LOL")
            var currentdisplay = "faren"
        }
        }
        //---
        
//    var test = [123, 123]
//        var test1 = test[degswitch.selectedSegmentedIndex]
//        
//    }

//    func celciusToFaren() {
//        faren = Double(round((1000.0*(((celcius * 9.0) / 5.0) + 32.0))/1000.0))
//    }
//    func farenToCelcius() {
//        celcius = Double(round((1000.0*(((faren - 32.0) * (5.0))/9.0))/1000.0))
//    }
    
    func celciusToFaren() {
        faren = (round(1000*(((celcius * 9.0) / 5.0) + 32.0)))/1000
    }
    func farenToCelcius() {
        celcius = (round(1000*(((faren - 32.0) * (5.0))/9.0)))/1000
    }
    // -----
    

//    func keyWasShown(notification: NSNotification){
//        var info = notification.userInfo!
//        var keyboardFrame:CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
//        
//        UIView.animateWithDuration(0.1, animations: { () -> Void in
//            self.bottomConstraint.constant = keyboardFrame.size.height + 20
//        })
//    }
    
    
    
    
    var transitionManager = MenuTransitionManager()
    
//    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
//        // bug? exit segue doesn't dismiss so we do it manually...
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menu = segue.destinationViewController as! MenuViewController
        menu.transitioningDelegate = self.transitionManager
    }
    
    // -----
    
    // ----- C and F stuff
    //gpp * 9/5 +32
    
    //degswitch outlet made
    //textLabel made, use GPP
    
    
    
    
    
    
    // -----
    
    
    @IBAction func clear(sender: UIBarButtonItem) {
        rhinput.text = ""
        tempinput.text = ""
        GPP.text = ""
        
    }
    @IBAction func calculate(sender: UIButton) {
        
        GPP.hidden = false
        view.endEditing(true)

        if tempinput.text == "" || rhinput.text == "" {
            GPP.hidden = false
        }
        
        var rhinputtext = rhinput.text
        var convertedrh = rhinputtext.toInt()
        var tempinputtext = tempinput.text
        var convertedtemp = (tempinputtext as NSString).doubleValue
        
        if currentdisplay == "celcius" {
            celcius_temp = tempinput.text
            celcius = (celcius_temp as NSString).doubleValue
            celciusToFaren();
            faren_temp = String(stringInterpolationSegment: faren)
            convertedtemp = faren;
            
        }
        else{
            convertedtemp = (tempinputtext as NSString).doubleValue
            
        }
        
        

        
        
        if count(tempinput.text) > 1 && count(rhinput.text) > 1{

            if convertedrh! <= 10 && convertedtemp <= 30 {

            }
            else if convertedrh! <= 10 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "4 grains per lb"
            }
            else if convertedrh! <= 10 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "6 grains per lb"
            }
            else if convertedrh! <= 10 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "8 grains per lb"
            }
            else if convertedrh! <= 10 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "11 grains per lb"
            }
            else if convertedrh! <= 10 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "16 grains per lb"
            }
            else if convertedrh! <= 10 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "21 grains per lb"
            }
            else if convertedrh! <= 10 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "29 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh <= 20 && convertedtemp <= 30 {
                GPP.text = "5 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh <= 20 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "7 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "10 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "16 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "21 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "30 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "42 grains per lb"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "58 grains per lb"
            }
            
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp <= 30 {
                GPP.text = "7 grains per lb"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "11 grains per lb"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "14 grains per lb"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "22 grains per lb"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "34 grains per lb"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "46 grains per lb"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "65 grains per lb"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "87 grains per lb"
            }
            
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp <= 30 {
                GPP.text = "9 grains per lb"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "14 grains per lb"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "20 grains per lb"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "30 grains per lb"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "44 grains per lb"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "62 grains per lb"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "85 grains per lb"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "116 grains per lb"
            }
            
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp <= 30 {
                GPP.text = "12 grains per lb"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "18 grains per lb"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "26 grains per lb"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "39 grains per lb"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "55 grains per lb"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "78 grains per lb"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "108 grains per lb"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "147 grains per lb"
            }
            
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp <= 30 {
                GPP.text = "14 grains per lb"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "22 grains per lb"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "32 grains per lb"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "48 grains per lb"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "66 grains per lb"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "92 grains per lb"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "128 grains per lb"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "176 grains per lb"
            }
            
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp <= 30 {
                GPP.text = "17 grains per lb"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "26 grains per lb"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "38 grains per lb"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "54 grains per lb"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "78 grains per lb"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "108 grains per lb"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "152 grains per lb"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "208 grains per lb"
            }
            
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp <= 30 {
                GPP.text = "19 grains per lb"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "29 grains per lb"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "42 grains per lb"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "62 grains per lb"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "88 grains per lb"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "125 grains per lb"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "173 grains per lb"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "-"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp <= 30 {
                GPP.text = "21 grains per lb"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "33 grains per lb"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "48 grains per lb"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "70 grains per lb"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "100 grains per lb"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "140 grains per lb"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "190 grains per lb"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "-"
            }
            
            if UIScreen.mainScreen().bounds.size.height == 480 {
                let alert = UIAlertView()
                alert.title = "GPP is"
                alert.message = "\(GPP.text!)"
                alert.addButtonWithTitle("Okay")
                alert.show()
            }

        } else {
            
            if UIScreen.mainScreen().bounds.size.height == 480 {
                let alert = UIAlertView()
                alert.title = "error"
                alert.message = "Please enter valid values"
                alert.addButtonWithTitle("Okay")
                alert.show()
            }
            GPP.hidden = false
            GPP.text = "Please enter valid values"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        GPP.hidden = true
        degswitch.tintColor = rpiorange
        calcButton.backgroundColor = rpiorange
        calcButton.tintColor = rpiorange
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }

    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= (UIScreen.mainScreen().bounds.size.height / 3.5)
    }

    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += (UIScreen.mainScreen().bounds.size.height / 3.5)
    }

    
    class MyNavigationController: UINavigationController {
        override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
            return UIStoryboardSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {

        var nav = self.navigationController?.navigationBar
        
//        degswitch.thumbTintColor = rpiorange
//        if UIScreen.mainScreen().bounds.size.height == 480 {
//            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 22)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
//            
//
//        } else if UIScreen.mainScreen().bounds.size.height == 568 {
//            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 28)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
//            
//
//        } else if UIScreen.mainScreen().bounds.size.width == 375 {
//            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 32)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
//            
//        } else if UIScreen.mainScreen().bounds.size.width == 414 {
//           
//            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 34)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
//            
//        } else if UIScreen.mainScreen().bounds.size.width >= 768 {
//            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 36)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
//        }
//        let navi
        nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 22)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
    
//        nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 34)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        nav?.barTintColor = rpiorange
        nav?.tintColor = UIColor.whiteColor()
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .ScaleAspectFit
//        let image = UIImage(named: "logo")
//        imageView.image = image
//        navigationItem.titleView = imageView
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    


}

