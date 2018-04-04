//
//  AboutViewController.swift
//  Applemint
//
//  Created by Apple on 1/30/16.
//  Copyright © 2016 Applemint. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    let phrase = Phrase()
//    @IBOutlet weak var wv: UIWebView!
    
    @IBOutlet weak var aboutText: UILabel!

    @IBAction func webby(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://people.rit.edu/~cxm1544/special/complimentary.html")!)    
    }
    
    override func viewDidLoad() {
        aboutText.text = phrase.getTxt("about")
//        let url = NSURL (string: "http://google.com")
//        let requestObj = NSURLRequest(URL: url!)
//        wv.loadRequest(requestObj)
//        print(wv)
    
    }
    
    @IBOutlet weak var returnPressed: UIBarButtonItem!
   
    @IBAction func returnButtonPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
}