//
//  PageItemController.swift
//  Applemint
//
//  Created by Apple on 1/30/16.
//  Copyright © 2016 Applemint. All rights reserved.
//


import UIKit

class PageItemController: UIViewController {
    
    let phrase = Phrase()
    var past = "default"
    var new = "default"
    
    var file = "happy"
    
    
    
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
    var pageText: String = "" {
        
        didSet {
            
            if let textView = contentTextView {
                textView.text = pageText
            }
            
        }
    }
        
    
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView!.image = UIImage(named: imageName)
        contentTextView!.text = pageText
    }

    
}
