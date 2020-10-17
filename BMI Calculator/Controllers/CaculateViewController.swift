//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit


class CaculateViewController: UIViewController {

    var caculatorBrain = CaculatorBrain()
    @IBOutlet weak var heightSliderLable: UILabel!
    @IBOutlet weak var weightSliderLable: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightSliderLable.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightSliderLable.text = String(format: "%.0f", sender.value) + "Kg"
    }
    
    @IBAction func caculatePressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        caculatorBrain.caculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmivalue = caculatorBrain.getBMIValue()
            destinationVC.advice = caculatorBrain.getAdvice()
            destinationVC.color = caculatorBrain.getColor()
        }
         
    }
}
