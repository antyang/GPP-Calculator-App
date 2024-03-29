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
    @IBOutlet weak var errorlabel: UILabel!
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
                GPP.text = "3 GPP"
            }
            else if convertedrh! <= 10 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "4 GPP"
            }
            else if convertedrh! <= 10 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "6 GPP"
            }
            else if convertedrh! <= 10 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "8 GPP"
            }
            else if convertedrh! <= 10 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "11 GPP"
            }
            else if convertedrh! <= 10 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "16 GPP"
            }
            else if convertedrh! <= 10 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "21 GPP"
            }
            else if convertedrh! <= 10 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "29 GPP"
            }
            else if convertedrh! > 10 && convertedrh <= 20 && convertedtemp <= 30 {
                GPP.text = "5 GPP"
            }
            else if convertedrh! > 10 && convertedrh <= 20 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "7 GPP"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "10 GPP"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "6 GPP"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "21 GPP"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "30 GPP"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "42 GPP"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "58 GPP"
            }
            
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp <= 30 {
                GPP.text = "7 GPP"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "11 GPP"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "14 GPP"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "22 GPP"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "34 GPP"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "46 GPP"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "65 GPP"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "87 GPP"
            }
            
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp <= 30 {
                GPP.text = "9 GPP"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "14 GPP"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "20 GPP"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "30 GPP"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "44 GPP"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "62 GPP"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "85 GPP"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "116 GPP"
            }
            
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp <= 30 {
                GPP.text = "12 GPP"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "18 GPP"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "26 GPP"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "39 GPP"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "55 GPP"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "78 GPP"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "108 GPP"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "147 GPP"
            }
            
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp <= 30 {
                GPP.text = "14 GPP"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "22 GPP"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "32 GPP"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "48 GPP"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "66 GPP"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "92 GPP"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "128 GPP"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "176 GPP"
            }
            
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp <= 30 {
                GPP.text = "17 GPP"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "26 GPP"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "38 GPP"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "54 GPP"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "78 GPP"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "108 GPP"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "152 GPP"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "208 GPP"
            }
            
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp <= 30 {
                GPP.text = "19 GPP"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "29 GPP"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "42 GPP"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "62 GPP"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "88 GPP"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "125 GPP"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "173 GPP"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "-"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp <= 30 {
                GPP.text = "21 GPP"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 30 && convertedtemp <= 40 {
                GPP.text = "33 GPP"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 40 && convertedtemp <= 50 {
                GPP.text = "48 GPP"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 50 && convertedtemp <= 60 {
                GPP.text = "70 GPP"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 60 && convertedtemp <= 70 {
                GPP.text = "100 GPP"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 70 && convertedtemp <= 80 {
                GPP.text = "140 GPP"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 80 && convertedtemp <= 90 {
                GPP.text = "190 GPP"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp > 90 && convertedtemp <= 100 {
                GPP.text = "-"
            }
            
            else if convertedrh! > 90 {
                GPP.text = "Humidity too high"
            }
            else if convertedrh! < 0 {
                GPP.text = "Humidity too low"
            }
            else if convertedtemp > 100 {
                GPP.text = "Temperature too high"
            }
            else if convertedtemp < 20 {
                GPP.text = "Temperature too low"
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
        errorlabel.hidden = true
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

