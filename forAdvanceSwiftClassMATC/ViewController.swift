//
//  ViewController.swift
//  forAdvanceSwiftClassMATC
//
//  Created by Otto Wichmann on 2/12/17.
//  Copyright © 2017 ottodevelops. All rights reserved.
//


//TODO: add a special effect to the generated nick name
//TODO: Build the app in its longest way and then refactor

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //properties
    var storedNames:[String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        //
        view.addSubview(nickNameLabel)
        view.addSubview(textField)
        view.addSubview(generateButton)
        //
        setUpTextField()
        setUpNickNameLabel()
        setUpGenerateButton()
    }
    
    //Class functions
    func captureName() {
        textField.endEditing(true)
        let text = textField.text!
        processName(name: text)
    }
    var namesSource = ["Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly","Otto","Molly",]
    
    func processName(name stringName: String){
        //
        var names = namesSource
        var subTotal = 0.0
        var total = 0.0
        var chosenAlies = ""
        //
        _  = stringName.capitalized.utf8.map{
             subTotal = $0 > 65 ? subTotal + Double($0)  : subTotal - Double($0)
        }
        
        total = ceil(subTotal / Double(names.count)) * Double(names.count) - subTotal
        
        if total > 0 {
            while total >= 0 {
                chosenAlies = names.popLast()!
                total -= 1
            }
            nickNameLabel.text? = chosenAlies
        }else{
            print("redacted")
        }
    }
    
    //All elements and set up
    
    //1-UI elements
    lazy var textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        return view
    }()
    lazy var nickNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.text = "Time: "
        view.textColor = UIColor.black
        view.font = UIFont(name: "System", size: 25)
        return view
    }()
    var generateButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 40, g: 101, b: 161)
        view.setTitleColor(UIColor.white, for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        view.layer.borderWidth = 1
        view.tag = 0
        view.layer.borderColor = UIColor.gray.cgColor
        view.addTarget(self, action: #selector(captureName), for: .touchUpInside)
        return view
    }()
    //2-HELPER: layout set up functions
    func setUpNickNameLabel(){
        //Need x, y, width, and height:
        nickNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nickNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -45).isActive = true
        nickNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nickNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func setUpTextField(){
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    func setUpGenerateButton(){
        generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        generateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75).isActive = true
        generateButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        generateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}

//Extensions
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

