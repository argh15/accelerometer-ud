//
//  ViewController.swift
//  Accelerometer-UD
//
//  Created by Arghadeep  on 08/02/21.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data  else {
            print(error.debugDescription)
            return
        }
        
        xLabel.text = "X: \(getNumberFormatter().string(for: accelerometerData.acceleration.x)!)"
        yLabel.text = "Y: \(getNumberFormatter().string(for: accelerometerData.acceleration.y)!)"
        zLabel.text = "Z: \(getNumberFormatter().string(for: accelerometerData.acceleration.z)!)"
    }
    
    func getNumberFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter
    }


}

