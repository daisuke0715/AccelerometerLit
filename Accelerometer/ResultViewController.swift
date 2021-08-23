//
//  ResultViewController.swift
//  Accelerometer
//
//  Created by 河村大介 on 2021/08/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var accelerationX: Double!
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let result: Double = fabs(accelerationX*100)
        label.text = String(format: "%.1f°", result)
    }
    

}
