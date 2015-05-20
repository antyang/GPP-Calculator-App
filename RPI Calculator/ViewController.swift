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
        
        if convertedtemp != nil && convertedrh != nil {
            
            if convertedrh! <= 10 && convertedtemp! <= 30 {
                GPP.text = "3"
            }
            else if convertedrh! <= 10 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "4"
            }
            else if convertedrh! <= 10 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "6"
            }
            else if convertedrh! <= 10 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "8"
            }
            else if convertedrh! <= 10 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "11"
            }
            else if convertedrh! <= 10 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "16"
            }
            else if convertedrh! <= 10 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "21"
            }
            else if convertedrh! <= 10 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "29"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! <= 30 {
                GPP.text = "5"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "7"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "10"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "16"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "21"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "30"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "42"
            }
            else if convertedrh! > 10 && convertedrh! <= 20 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "58"
            }
            
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! <= 30 {
                GPP.text = "7"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "11"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "14"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "22"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "34"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "46"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "65"
            }
            else if convertedrh! > 20 && convertedrh! <= 30 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "87"
            }
            
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! <= 30 {
                GPP.text = "9"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "14"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "20"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "30"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "44"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "62"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "85"
            }
            else if convertedrh! > 30 && convertedrh! <= 40 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "116"
            }
            
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! <= 30 {
                GPP.text = "12"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "18"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "26"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "39"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "55"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "78"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "108"
            }
            else if convertedrh! > 40 && convertedrh! <= 50 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "147"
            }
            
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! <= 30 {
                GPP.text = "14"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "22"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "32"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "48"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "66"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "92"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "128"
            }
            else if convertedrh! > 50 && convertedrh! <= 60 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "176"
            }
            
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! <= 30 {
                GPP.text = "17"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "26"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "38"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "54"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "78"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "108"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "152"
            }
            else if convertedrh! > 60 && convertedrh! <= 70 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "208"
            }
            
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! <= 30 {
                GPP.text = "19"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "29"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "42"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "62"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "88"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "125"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "173"
            }
            else if convertedrh! > 70 && convertedrh! <= 80 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "-"
            }
            
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! <= 30 {
                GPP.text = "21"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! > 30 && convertedtemp! <= 40 {
                GPP.text = "33"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! > 40 && convertedtemp! <= 50 {
                GPP.text = "48"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! > 50 && convertedtemp! <= 60 {
                GPP.text = "70"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! > 60 && convertedtemp! <= 70 {
                GPP.text = "100"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! > 70 && convertedtemp! <= 80 {
                GPP.text = "140"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! > 80 && convertedtemp! <= 90 {
                GPP.text = "190"
            }
            else if convertedrh! > 80 && convertedrh! <= 90 && convertedtemp! > 90 && convertedtemp! <= 100 {
                GPP.text = "-"
            }

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

