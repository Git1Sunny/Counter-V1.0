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
    
    func RemoveZero(testNumber:Double)->String{
        var str = "\(testNumber)"
        let str2 = str.components(separatedBy: ".")
        if(Int(str2[1]) == 0)
        {
            str = str2[0]
        }
        return str
    }
    
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
        if((CounterScream.text != "") && (CounterScream2.text != ""))
        {
        switch CounterScream1.text{
            case "+":
                CounterScream.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! + Double(CounterScream.text!)!))
                CounterScream1.text = "="
                CounterScream2.text = ""
                screamtext = "0"
                break
            case "-":
                CounterScream.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! - Double(CounterScream.text!)!))
                CounterScream1.text = "="
                CounterScream2.text = ""
                screamtext = "0"
                break
            case "x":
                CounterScream.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! * Double(CounterScream.text!)!))
                CounterScream1.text = "="
                CounterScream2.text = ""
                screamtext = "0"
                break
            case "÷":
                if(Int(CounterScream.text!) != 0)
                {
                    CounterScream.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! / Double(CounterScream.text!)!))
                    CounterScream1.text = "="
                    CounterScream2.text = ""
                    screamtext = "0"
                }
                break
            default:
                CounterScream.text = "ERROR"
                break
        }
        }
    }
    
    @IBAction func CountComb(_ sender: Any) {
        if((CounterScream.text != "") && (CounterScream2.text != ""))
        {
            switch CounterScream1.text{
            case "+":
                CounterScream2.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! + Double(CounterScream.text!)!))
                CounterScream.text = "0"
                screamtext = ""
                break
            case "-":
                CounterScream2.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! - Double(CounterScream.text!)!))
                CounterScream.text = "0"
                screamtext = ""
                break
            case "x":
                CounterScream2.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! * Double(CounterScream.text!)!))
                CounterScream.text = "0"
                screamtext = ""
                break
            case "÷":
                if(Int(CounterScream.text!) != 0)
                {
                    CounterScream2.text = RemoveZero(testNumber:( Double(CounterScream2.text!)! / Double(CounterScream.text!)!))
                    CounterScream.text = "0"
                    screamtext = ""
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

