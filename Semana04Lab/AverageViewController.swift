//
//  AverageViewController.swift
//  Semana04Lab
//
//  Created by mbtec22 on 4/1/21.
//

import UIKit

class AverageViewController: UIViewController {

    //Notas de Laboratorio
    @IBOutlet weak var inputNota1Lab: UITextField!
    @IBOutlet weak var inputNota2Lab: UITextField!
    @IBOutlet weak var inputNota3Lab: UITextField!
    @IBOutlet weak var inputNota4Lab: UITextField!
    @IBOutlet weak var inputNota5Lab: UITextField!
    @IBOutlet weak var inputNota6Lab: UITextField!
    //Notas de Teoria
    @IBOutlet weak var inputNotaTeo1: UITextField!
    @IBOutlet weak var inputNotaTeo2: UITextField!
    @IBOutlet weak var inputNotaTeo3: UITextField!
    @IBOutlet weak var inputNotaTeo4: UITextField!
    //Average label
    @IBOutlet weak var lblAverage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        
        let totalLab = AverageLab(n1l: inputNota1Lab, n2l: inputNota2Lab, n3l: inputNota3Lab, n4l: inputNota4Lab, n5l: inputNota5Lab, n6l: inputNota6Lab)
        
        print("Promedio Lab: \(totalLab)")
        
        let totalTheo = AverageTheo(n1t: inputNotaTeo1, n2t: inputNotaTeo2, n3t: inputNotaTeo3, n4t: inputNotaTeo4)
        
        print("Promedio Teo: \(totalTheo)")
        //Total Average
        let total = average(aveLab: totalLab, aveTheo: totalTheo)
        lblAverage.text = "Average: \(total)"
        print("Average: \(total)")
        
    }
    //Average Laboratory
    func AverageLab(n1l:UITextField,n2l:UITextField,n3l:UITextField,n4l:UITextField,n5l:UITextField,n6l:UITextField) -> Float {
        let aveLab:Float!
        let n1l = Float(inputNota1Lab.text!)!
        let n2l = Float(inputNota2Lab.text!)!
        let n3l = Float(inputNota3Lab.text!)!
        let n4l = Float(inputNota4Lab.text!)!
        let n5l = Float(inputNota5Lab.text!)!
        let n6l = Float(inputNota6Lab.text!)!
        
        let suma:Float = n1l + n2l + n3l + n4l + n5l + n6l
        aveLab = suma / 6
        
        return aveLab
    }
    //Average Theory
    func AverageTheo(n1t:UITextField,n2t:UITextField,n3t:UITextField,n4t:UITextField) ->Float{
        let aveTheo:Float!
        let n1t = Float(inputNotaTeo1.text!)!
        let n2t = Float(inputNotaTeo2.text!)!
        let n3t = Float(inputNotaTeo3.text!)!
        let n4t = Float(inputNotaTeo4.text!)!
        
        let suma:Float = n1t + n2t + n3t + n4t
        aveTheo = suma / 4
        
        return aveTheo
    }
    //Total Average
    func average(aveLab:Float,aveTheo:Float) ->Float {
        let total:Float = (aveLab*0.6)+(aveTheo*0.4)
        return total
    }
    
    @IBAction func btnClean(_ sender: UIButton) {
        inputNota1Lab.text = ""
        inputNota2Lab.text = ""
        inputNota3Lab.text = ""
        inputNota4Lab.text = ""
        inputNota5Lab.text = ""
        inputNota6Lab.text = ""
        
        inputNotaTeo1.text = ""
        inputNotaTeo2.text = ""
        inputNotaTeo3.text = ""
        inputNotaTeo4.text = ""
        
    }
    

}
