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
    
    func RemoveZero(testNumber:Double)->String{ //去小数点后零函数
        var str = "\(testNumber)"//数字转字符串
        var str2 = str.components(separatedBy: ".")//字符串拆解成数组
        if(str2[1]=="")
        {
            str2[1] = "0"
        }
        if(Int(str2[1]) == 0)
        {
            str = str2[0] //如果小数点后全部为0则只返回整数部分
        }
        return str//正常返回
    }
    
    @IBAction func Numer(_ sender: UIButton) { //主屏幕输入
        if(CounterScream.text!.count <= 9)  //限制屏幕最多能输入9个字符
        {
            if(screamtext == "0" )  //如果一开始为零时 输入取掉开头的零
            {
                screamtext = ""
            }
            if(CounterScream1.text == "=")  //如果按过等号重新输入时 清空屏幕
            {
                CounterScream1.text = ""
            }
            screamtext = screamtext + sender.currentTitle!  //主屏幕输入
            if(screamtext == "00")  //若直接输入00让其仍为0
            {
                screamtext = "0"
            }
            CounterScream.text = screamtext;    //主屏幕输入
            print(CounterScream.text!.contains("1"))
        }
    }
    
    @IBAction func CounterNumber(_ sender: UIButton) { //计算符号输入输入
        if(CounterScream2.text == "")   //当屏幕上没计算符号时
        {
            CounterScream2.text = RemoveZero(testNumber: Double(CounterScream.text!)!)   //将主屏幕数据移动到上方屏幕
            CounterScream.text = "0"    //让主屏幕数据w清0
        }
            CounterScream1.text = sender.currentTitle! //给计算符号屏幕输入
            screamtext = "" //清空输入
    }
    
    @IBAction func ClsScream(_ sender: Any) {   //清空屏幕 全初始化
        screamtext = ""
        CounterScream.text = "0"
        CounterScream1.text = ""
        CounterScream2.text = ""
    }
    
    @IBAction func Change(_ sender: Any) {//让主屏幕符号改变
        if(CounterScream.text != "0")
        {
            CounterScream.text = RemoveZero(testNumber : Double(CounterScream.text!)! * -1)
        }

    }
    
    @IBAction func Point(_ sender: Any) {   //小数点运算
        if(!CounterScream.text!.contains(".")) //检测屏幕中是否已经有小数点
        {
            if(screamtext == "")
            {
                screamtext = "0"
            }
            screamtext = screamtext + "."
            CounterScream.text = screamtext
        }
    }
    
    
    @IBAction func FinishCounter(_ sender: Any) { //等号操作
        if((CounterScream.text != "") && (CounterScream2.text != ""))//确保只有输入数据齐全时才进行运算
        {
        switch CounterScream1.text{ //根据符号屏幕的内容 进行计算
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
    
    @IBAction func DeleteNumber(_ sender: Any) { //回格操作
        if(CounterScream.text!.count == 1) //如果回格最后一个数字 重置为0
        {
            CounterScream.text = "0"
            screamtext = ""
        }
        if(CounterScream.text != "0"){ //若值为0 无法回格
            CounterScream.text!.remove(at: CounterScream.text!.index(before: CounterScream.text!.endIndex)) //删除最后一位
            screamtext = CounterScream.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

