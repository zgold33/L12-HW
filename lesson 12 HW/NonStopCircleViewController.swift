//
//  NonStopCircleViewController.swift
//  lesson 12 HW
//
//  Created by Сергей Золотухин on 01.10.2021.
//

import UIKit

class NonStopCircleViewController: UIViewController {
    
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var circle: UIView!
    
    
    var timer: Timer?
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NON STOP Circle"
        
        circle.layer.cornerRadius = circle.frame.height / 2
        circleView.layer.cornerRadius = 25
        
    }
    
    @objc func triggerTimer() {
        
        counter += 1
        
        UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseOut) {
            
            [self] in
            
            if circle.frame.maxX < circleView.frame.width && self.circle.frame.minY == 0  {
                circle.frame = CGRect(x: circle.frame.minX + 2, y: circle.frame.minY, width: circle.frame.width, height: circle.frame.height)
                
            } else if circle.frame.maxY < circleView.frame.height && circle.frame.maxX == circleView.frame.width {
                circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY + 2, width: circle.frame.width, height: circle.frame.height)
                
            } else if circle.frame.minX > 0 {
                circle.frame = CGRect(x: circle.frame.minX - 2, y: circle.frame.minY, width: circle.frame.width, height: circle.frame.height)
                
            } else if circle.frame.minX == 0 && circle.frame.minY >= 0 {
                
                circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY - 2, width: circle.frame.width, height: circle.frame.height)
            }
            
        }
    }
    
    func startTimer() {
        
        guard self.timer == nil else {  // функция не должна работать, если верхнее условие не выполнится, смотрит функцию, в которой находится.
            
            return
            
        }
        
        
        let timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(triggerTimer),
                                         userInfo: nil,
                                         repeats: true)
        self.timer = timer
    }
    
    
    
    @IBAction func actionStart(_ sender: Any) {
        
        startTimer()
    }
    
    @IBAction func actionStop(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
    
}
