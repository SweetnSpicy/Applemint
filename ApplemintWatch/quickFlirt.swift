//
//  quickFlirt.swift
//  Applemint
//
//  Created by Apple on 1/31/16.
//  Copyright © 2016 Applemint. All rights reserved.
//

import Foundation
import WatchKit
import UIKit

class quickFlirt: WKInterfaceController {
    
    let phrase = Phrase()
    var past = "default"
    var new = "default"
    var file = "potato"
    
    @IBAction func refresh(sender: AnyObject) {
        //print("did this button test work?")
        past = new
        new = phrase.test(file)
        
        var set = false
        while past == new {
            new = phrase.test(file)
            set = true
            print("past == new")
        }
        if set == true{
            //past = new
        }
        //print("current text: " + past)
        let message = new
        UIView.animateWithDuration(1.5, animations: {
            
            self.contentTxtView.alpha = 0
            self.contentTxtView.text = message
        })
        UIView.animateWithDuration(1.0, animations: {
            self.contentTxtView.alpha = 1
        })
        
        print("New: " + new)
        print("Past: " + past)
        
        
    }
    
    // MARK: - Variables
    var itemIndex: Int = 0
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = contentImgView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    var pageText: String = "test" {
        
        didSet {
            
            if let textView = contentTxtView {
                textView.text = pageText
            }
            
        }
    }
    
    //var imageName: String = ""
    //var pageText = "potato"
    
    
    
    @IBOutlet var contentWKLabel: WKInterfaceLabel!
    @IBOutlet weak var contentImgView: UIImageView!
    @IBOutlet weak var contentTxtView: UITextView!
    
//    @IBOutlet var contentImageView: WKInterfaceImage!
//    @IBOutlet var contentTextView: WKInterfaceLabel!
    
    
    // MARK: - View Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        contentImgView!.image = UIImage(named: imageName)
//        contentTxtView!.text = pageText
//    }
    
    override func awakeWithContext(context: AnyObject?) {
        print("eat pizza with a slice of cow")
        super.awakeWithContext(contentTxtView)
    }
    
}