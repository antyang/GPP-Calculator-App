//
//  ViewController.swift
//  RPI Calculator
//
//  Created by Arash Namvar on 5/18/15.
//  Copyright (c) 2015 Arash Namvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rpiorange = UIColor(red: 255/255, green: 121/255, blue: 0, alpha: 1)
    var temp: Int?
    var rh: Int?
    @IBOutlet weak var errorslabel: UILabel!
    @IBOutlet weak var tempinput: UITextField!
    @IBOutlet weak var rhinput: UITextField!
    @IBOutlet weak var GPP: UILabel!
    @IBOutlet weak var degswitch: UISegmentedControl!
    
    @IBAction func clear(sender: UIBarButtonItem) {
        errorslabel.text = ""
        rhinput.text = ""
        tempinput.text = ""
        GPP.text = ""
        
    }
    @IBAction func calculate(sender: UIButton) {
        
        
        var rhinputtext = rhinput.text
        var convertedrh = rhinputtext.toInt()
        var tempinputtext = tempinput.text
        var convertedtemp = tempinputtext.toInt()
        
        if convertedrh != nil && convertedtemp != nil {
            var answer = convertedrh! + convertedtemp!
            GPP.text = String(answer)
        } else {
            errorslabel.text = "Please enter in valid values"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorslabel.text = ""
        degswitch.tintColor = rpiorange
    }

    override func viewDidAppear(animated: Bool) {

        var nav = self.navigationController?.navigationBar
        
//        degswitch.thumbTintColor = rpiorange
        if UIScreen.mainScreen().bounds.size.height == 480 {
            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 22)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
            

        } else if UIScreen.mainScreen().bounds.size.height == 568 {
            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 28)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
            

        } else if UIScreen.mainScreen().bounds.size.width == 375 {
            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 32)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
            
        } else if UIScreen.mainScreen().bounds.size.width == 414 {
           
            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 34)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
            
        } else if UIScreen.mainScreen().bounds.size.width >= 768 {
            nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 36)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        }

//        nav?.titleTextAttributes =  [ NSFontAttributeName: UIFont(name: "Arial", size: 34)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        nav?.barTintColor = rpiorange
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .ScaleAspectFit
//        let image = UIImage(named: "logo")
//        imageView.image = image
//        navigationItem.titleView = imageView
    }


}

