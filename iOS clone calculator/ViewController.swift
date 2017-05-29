//
//  ViewController.swift
//  iOS clone calculator
//
//  Created by Nick on 29.05.17.
//  Copyright © 2017 LagoikoNick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var numberOnScreen:Double = 0
    var previosNumber:Double = 0
    var perfomingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if perfomingMath == true {
            
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            perfomingMath = false
            
        } else {
           
            label.text = label.text! + String(sender.tag-1)
            
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton){
        if label.text != "" && sender.tag != 11 /*reset*/ && sender.tag != 16 /*equal*/  {
            
           previosNumber = Double(label.text!)!
            
            if sender.tag == 12 /*devide*/ {
                label.text = "/"
            } else if sender.tag == 13 /*multiply*/ {
                label.text = "X"
            } else if sender.tag == 14 /*substract*/ {
                label.text = "-"
            } else if sender.tag == 15 /*add*/ {
                label.text = "+"
            }
            
            operation = sender.tag
            perfomingMath = true
            
        } else if sender.tag == 16 /*equal*/ {
            
            if operation == 12 /*devide*/ {
                label.text = String(previosNumber / numberOnScreen)
            } else if operation == 13 /*multiply*/ {
                label.text = String(previosNumber * numberOnScreen)
            } else if operation == 14 /*substract*/ {
                label.text = String(previosNumber - numberOnScreen)
            } else if operation == 15 /*add*/ {
                label.text = String(previosNumber + numberOnScreen)
            }
        } else if sender.tag == 11 /*reset*/ {
            label.text = ""
            previosNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

