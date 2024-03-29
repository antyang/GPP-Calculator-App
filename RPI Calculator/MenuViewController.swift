//
//  ViewController.swift
//  Menu
//
//  Created by Mathew Sanders on 9/7/14.
//  Copyright (c) 2014 Mat. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // create instance of our custom transition manager
    let transitionManager = MenuTransitionManager()
    
    // create references to the items on the storyboard 
    // so that we can animate their properties
    
    @IBOutlet weak var logoIcon: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.transitioningDelegate = self.transitionManager
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

