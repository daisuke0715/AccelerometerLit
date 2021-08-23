//
//  GameViewController.swift
//  Accelerometer
//
//  Created by 河村大介 on 2021/08/23.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // 加速度計が使用できるかどうかの確認
        if motionManager.isAccelerometerAvailable {
            // 加速度の取得間隔の設定
            motionManager.accelerometerUpdateInterval = 0.01
            // 加速度計が更新された時に呼ばれる関数
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
                
                // 現在の加速度を取得しその値に基づき、x座標を変更
                self.accelerationX = (data?.acceleration.x) as! Double
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                
                
                // X座標の限界値の設定
                if self.awaImageView.frame.origin.x < 40 {
                    self.awaImageView.frame.origin.x = 40
                }
                
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        resultVC.accelerationX = self.accelerationX
    }
    


}
