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
    
    @IBOutlet weak var aboutText: UITextView!
    
    override func viewDidLoad() {
        aboutText.text = phrase.getTxt("about")
    }
    
    @IBOutlet weak var returnPressed: UIBarButtonItem!
    
    @IBAction func returnButtonPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
}