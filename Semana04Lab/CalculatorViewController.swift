//
//  CalculatorViewController.swift
//  Semana04Lab
//
//  Created by mbtec22 on 4/1/21.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var uiView: UIView!
    
    var firstNumber = 0
    var resultNuumber = 0
    var currentOperation: Operation?
    
    enum Operation {
        case add, subtract, multiply, divide
    }
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name:"Helvetica",size:100)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupNumberPad()
    }
    //Teclado numerico
    private func setupNumberPad(){
        let buttonSize: CGFloat = view.frame.size.width / 4
        
        let zeroButton = UIButton(frame: CGRect(x:0,y:uiView.frame.size.height-buttonSize,width: buttonSize*3, height: buttonSize))
        zeroButton.setTitleColor(.white, for: .normal)
        zeroButton.backgroundColor = .darkGray
        zeroButton.setTitle("0", for: .normal)
        zeroButton.setTitleShadowColor(.black, for: .normal)
        zeroButton.layer.cornerRadius = 40
        zeroButton.layer.borderWidth = 4
        zeroButton.tag = 1
        zeroButton.addTarget(self, action: #selector(zeroTapped), for: .touchUpInside)
        uiView.addSubview(zeroButton)
        
        for x in 0..<3 {
            let button1 = UIButton(frame: CGRect(x:buttonSize * CGFloat(x),y:uiView.frame.size.height-(buttonSize * 2), width: buttonSize, height: buttonSize))
            button1.setTitleColor(.white, for: .normal)
            button1.backgroundColor = .darkGray
            button1.setTitle("\(x+1)", for: .normal)
            button1.tag = x+2
            button1.addTarget(self, action: #selector(numberPreessed(_:)), for: .touchUpInside)
            button1.layer.cornerRadius = 40
            button1.layer.borderWidth = 4
            uiView.addSubview(button1)
        }
        for x in 0..<3 {
            let button2 = UIButton(frame: CGRect(x:buttonSize * CGFloat(x),y:uiView.frame.size.height-(buttonSize * 3), width: buttonSize, height: buttonSize))
            button2.setTitleColor(.white, for: .normal)
            button2.backgroundColor = .darkGray
            button2.setTitle("\(x+4)", for: .normal)
            button2.tag = x+5
            button2.addTarget(self, action: #selector(numberPreessed(_:)), for: .touchUpInside)
            button2.layer.cornerRadius = 40
            button2.layer.borderWidth = 4
            uiView.addSubview(button2)
        }
        for x in 0..<3 {
            let button3 = UIButton(frame: CGRect(x:buttonSize * CGFloat(x),y:uiView.frame.size.height-(buttonSize * 4), width: buttonSize, height: buttonSize))
            button3.setTitleColor(.white, for: .normal)
            button3.backgroundColor = .darkGray
            button3.setTitle("\(x+7)", for: .normal)
            button3.tag = x+8
            button3.addTarget(self, action: #selector(numberPreessed(_:)), for: .touchUpInside)
            button3.layer.cornerRadius = 40
            button3.layer.borderWidth = 4
            uiView.addSubview(button3)
        }
        let clearButton = UIButton(frame: CGRect(x:0,y:uiView.frame.size.height-(buttonSize*5),width: view.frame.size.width - buttonSize, height: buttonSize))
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = .lightGray
        clearButton.setTitle("CA", for: .normal)
        clearButton.layer.cornerRadius = 40
        clearButton.layer.borderWidth = 4
        uiView.addSubview(clearButton)

        
        let operations = ["=","+","-","X","/"]
        
        for x in 0..<5 {
            let button4 = UIButton(frame: CGRect(x:buttonSize * 3,y:uiView.frame.size.height-(buttonSize * CGFloat(x+1)), width: buttonSize, height: buttonSize))
        button4.setTitleColor(.white, for: .normal)
        button4.backgroundColor = .orange
        button4.setTitle(operations[x], for: .normal)
        button4.tag = x+1
        button4.addTarget(self, action:#selector(operationPreessed(_:)), for: .touchUpInside)
        button4.layer.cornerRadius = 40
        button4.layer.borderWidth = 4
        uiView.addSubview(button4)
        }
        resultLabel.frame = CGRect(x:20 , y:clearButton.frame.origin.y - 110.0, width: view.frame.size.width - 40, height:100)
        uiView.addSubview(resultLabel)
        
        //Acciones de los botones
        
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
        }
    //Limpiar resultado
    @objc func clearResult(){
        resultLabel.text = "0"
        currentOperation = nil
        firstNumber = 0
    }
    //Presionar cero
    @objc func zeroTapped(){
        if resultLabel.text != "0"{
            if let text = resultLabel.text{
                resultLabel.text = "\(text)\(0)"
            }
        }
        
    }
    //Presionar numero
    @objc func numberPreessed(_ sender: UIButton){
        let tag =  sender.tag - 1
        
        if	resultLabel.text == "0"{
            resultLabel.text = "\(tag)"
        }
        else if let text = resultLabel.text{
            resultLabel.text = "\(text)\(tag)"
        }
        
    }
    //Presionar operación
    @objc func operationPreessed(_ sender: UIButton){
        let tag =  sender.tag
        if let text = resultLabel.text, let value = Int(text), firstNumber == 0{
            firstNumber = value
            resultLabel.text = "0"
        }
        
        if tag ==  1{
            if let operation = currentOperation{
                var secondNumber  = 0
                if let text = resultLabel.text, let value = Int(text){
                    secondNumber = value
                }
                switch operation {
                case .add:
                    let result = firstNumber + secondNumber
                    resultLabel.text = "\(result)"
                    break
                    
                case .subtract:
                    let result = firstNumber - secondNumber
                    resultLabel.text = "\(result)"
                    break
                    
                case .multiply:
                    let result = firstNumber * secondNumber
                    resultLabel.text = "\(result)"
                    break
                    
                case .divide:
                    let result = firstNumber / secondNumber
                    resultLabel.text = "\(result)"
                    break
                }
            }
        }
        else if tag == 2 {
            currentOperation = .add
        }
        else if tag == 3 {
            currentOperation = .subtract
        }
        else if tag == 4 {
            currentOperation = .multiply
        }
        else if tag == 5 {
            currentOperation = .divide
        }
        
        
    }
}
