//
//  fastBurn.swift
//  Applemint
//
//  Created by Apple on 1/31/16.
//  Copyright © 2016 Applemint. All rights reserved.
//

import Foundation
import WatchKit
import UIKit

class fastBurn: WKInterfaceController {
    
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
            
            self.contentTextView.alpha = 0
            self.contentTextView.text = message
        })
        UIView.animateWithDuration(1.0, animations: {
            self.contentTextView.alpha = 1
        })
        
        print("New: " + new)
        print("Past: " + past)
        
        
    }
    
    // MARK: - Variables
    var itemIndex: Int = 0
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    var pageText: String = "test" {
        
        didSet {
            
            if let textView = contentTextView {
                textView.text = pageText
            }
            
        }
    }
    
    //var imageName: String = ""
    //var pageText = "potato"
    
    
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    //    @IBOutlet var contentImageView: WKInterfaceImage!
    //    @IBOutlet var contentTextView: WKInterfaceLabel!
    
    
    // MARK: - View Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        contentImageView!.image = UIImage(named: imageName)
//        contentTextView!.text = pageText
//    }
    override func awakeWithContext(context: AnyObject?) {
        print("eat pizza with a slice of cow")
        super.awakeWithContext(contentTextView)
    }
    
}