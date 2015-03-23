//
//  ViewController.swift
//  GoogleMap-swift
//
//  Created by 加藤 周 on 2015/03/23.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldDidBeginEditing(textField: UITextField!) {
        println("textFieldDidBeginEditing: \(textField.text)")
    }
    
    /*
    テキストが編集された際に呼ばれる.
    */
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        
        // 文字数最大を決める.
        let maxLength: Int = 6
        
        // 入力済みの文字と入力された文字を合わせて取得.
        var str = textField.text + string
        
        // 文字数がmaxLength以下ならtrueを返す.
        if countElements("\(str)") < maxLength {
            return true
        }
        label.text = "６文字を超えています。"
        label1.text = "残念。６文字超えました。"
        textField.hidden = true
        return false
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれる.
    */
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        println("textFieldShouldEndEditing: \(textField.text)")
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれる.
    */
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        println("textFieldShouldReturn: \(textField.text)")
        return true
    }


}

