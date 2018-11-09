//
//  ViewController.swift
//  counter v1.0
//
//  Created by S20171102171 on 2018/10/12.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var screamtext : String = ""
    @IBOutlet weak var CounterScream1: UILabel!//符号屏幕
    @IBOutlet weak var CounterScream: UILabel!//主屏幕
    @IBOutlet weak var CounterScream2: UILabel!//待处理屏幕
    
    @IBAction func Numer(_ sender: UIButton) { //主屏幕输入
        if(CounterScream.text!.count <= 10)
        {
            if(screamtext == "0")
            {
                screamtext = ""
            }
            if(CounterScream1.text == "=")
            {
                CounterScream1.text = ""
            }
            screamtext = screamtext + sender.currentTitle!
            CounterScream.text = screamtext;
        }
    }
    
    @IBAction func CounterNumber(_ sender: UIButton) { //计算符号输入输入
        if(CounterScream2.text == "")
        {
            CounterScream2.text = CounterScream.text
            CounterScream.text = "0"
        }
            CounterScream1.text = sender.currentTitle!
            screamtext = ""
    }
    
    @IBAction func ClsScream(_ sender: Any) {
        screamtext = ""
        CounterScream.text = "0"
        CounterScream1.text = ""
        CounterScream2.text = ""
    }
    
    @IBAction func Change(_ sender: Any) {
        if(CounterScream.text != "0"&&CounterScream.text != "ERROR")
        {
            CounterScream.text = "\(Double(CounterScream.text!)! * -1)"
        }

    }
    
    @IBAction func Point(_ sender: Any) {
        if(!CounterScream.text!.contains("."))
        {
            if(screamtext == "")
            {
                screamtext = "0"
            }
            screamtext = screamtext + "."
            CounterScream.text = screamtext
        }
    }
    
    
    @IBAction func FinishCounter(_ sender: Any) {
        if(CounterScream.text == "ERROR")
        {
            CounterScream.text = "0"
        }
        if(CounterScream2.text == "ERROR")
        {
            CounterScream2.text = "0"
        }
        if((CounterScream.text != "") && (CounterScream2.text != ""))
        {
        switch CounterScream1.text{
            case "+":
                CounterScream.text = String(format: "%f", Double(CounterScream2.text!)! + Double(CounterScream.text!)!)
                CounterScream1.text = "="
                break
            case "-":
                CounterScream.text = String(format: "%f", Double(CounterScream2.text!)! - Double(CounterScream.text!)!)
                CounterScream1.text = "="
                break
            case "x":
                CounterScream.text = String(format: "%f", Double(CounterScream2.text!)! * Double(CounterScream.text!)!)
                CounterScream1.text = "="
                break
            case "÷":
                if(CounterScream.text != "0" && CounterScream2.text != "")
                {
                    CounterScream.text = String(format: "%f", Double(CounterScream2.text!)! / Double(CounterScream.text!)!)
                    CounterScream1.text = "="
                }
                else
                {
                    CounterScream2.text = "0"
                    CounterScream.text  = "ERROR"
                    CounterScream1.text = ""
                }
                break
            default:
                CounterScream.text = "ERROR"
                break
        }
        CounterScream2.text = ""
        screamtext = "0"
        }
    }
    
    @IBAction func CountComb(_ sender: Any) {
        if(CounterScream2.text == "ERROR")
        {
            CounterScream2.text = "0"
        }
        if(CounterScream.text == "ERROR")
        {
            CounterScream.text = "0"
        }
        if((CounterScream.text != "") && (CounterScream2.text != ""))
        {
            switch CounterScream1.text{
            case "+":
                CounterScream2.text = String(format: "%f", Double(CounterScream2.text!)! + Double(CounterScream.text!)!)
                CounterScream.text = "0"
                screamtext = ""
                break
            case "-":
                CounterScream2.text = String(format: "%f", Double(CounterScream2.text!)! - Double(CounterScream.text!)!)
                CounterScream.text = "0"
                screamtext = ""
                break
            case "x":
                CounterScream2.text = String(format: "%f", Double(CounterScream2.text!)! * Double(CounterScream.text!)!)
                CounterScream.text = "0"
                screamtext = ""
                break
            case "÷":
                if(CounterScream.text != "0" && CounterScream2.text != " ")
                {
                    CounterScream2.text = String(format: "%f", Double(CounterScream2.text!)! / Double(CounterScream.text!)!)
                    CounterScream.text = "0"
                    screamtext = ""
                }
                else
                {
                    CounterScream.text = CounterScream2.text
                    CounterScream2.text = "ERROR"
                    CounterScream1.text = ""
                }
            default:
                CounterScream.text = "ERROR"
                break
            }
        }
    }
    
    @IBAction func DeleteNumber(_ sender: Any) {
        if(CounterScream.text!.count == 1)
        {
            CounterScream.text = "0"
        }
        if((CounterScream.text != "0") && (CounterScream.text != "")){
            CounterScream.text!.remove(at: CounterScream.text!.index(before: CounterScream.text!.endIndex))
            screamtext = CounterScream.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

