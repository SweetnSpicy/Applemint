//
//  Phrase.swift
//  Applemint
//
//  Created by Apple on 1/30/16.
//  Copyright © 2016 Applemint. All rights reserved.
//

import Foundation


class Phrase {
    
    //var count = 0
    
    
    
    func test(path: String) -> String{
        
        
        let bundle = NSBundle.mainBundle()
        let location = bundle.pathForResource(path, ofType: "txt")
        //print(location)
        do {
            let contents = try NSString(contentsOfFile: location!, encoding: NSUTF8StringEncoding)
            //print(contents as String,  "\n")
            let arr = contents.componentsSeparatedByString("\n")
            //for part in arr {
            //print(part, terminator:" ")
            //}
            let random = Int(rand())
            let ind = random % arr.count
            //print("\n")
            //print(arr[ind])
            return arr[ind]
        }
        catch {
            return "None"
            
        }
    }
    
    func getTxt(path: String) -> String{
        
        
        let bundle = NSBundle.mainBundle()
        let location = bundle.pathForResource(path, ofType: "txt")
        //print(location)
        do {
            let contents = try NSString(contentsOfFile: location!, encoding: NSUTF8StringEncoding)
            //let arr = contents.componentsSeparatedByString("\n")
            //let random = Int(rand())
            //let ind = random % arr.count
            //return arr[ind]
            return contents as String
        }
        catch {
            return "None"
            
        }
    }
    
}