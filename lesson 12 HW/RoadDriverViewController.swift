//
//  RoadDriverViewController.swift
//  lesson 12 HW
//
//  Created by Сергей Золотухин on 01.10.2021.
//

import UIKit

enum Direction2 {
    case left
    case right
}

class RoadDriverViewController: UIViewController {
    
    @IBOutlet weak var carView: UIImageView!
    
    @IBOutlet weak var containerView1: UIView!
    
    @IBOutlet weak var containerView2: UIView!
    
    var timer: Timer?
    var counter: Int = 0
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        
        title = "Road driver"
        
                let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(triggerTimer), userInfo: nil, repeats: true)
        
               self.timer = timer
        
 //       animateRoad()
        configRecognizer()
        configRecognizer2()
        
    }
    
    func move(direction: Direction2) {
        switch direction {
        
        case .left:  carView.frame = CGRect(x: carView.frame.origin.x - 100,
                                            y: carView.frame.origin.y,
                                            width: carView.frame.width,
                                            height: carView.frame.height)
        case .right: carView.frame = CGRect(x: carView.frame.origin.x + 100,
                                            y: carView.frame.origin.y,
                                            width: carView.frame.width,
                                            height: carView.frame.height)
        }
    }
    
    func configRecognizer() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipe))
        view.addGestureRecognizer(recognizer)
        recognizer.direction = .right
    }
    func configRecognizer2() {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(actionSwipe2))
        view.addGestureRecognizer(recognizer)
        recognizer.direction = .left
    }
    
        @objc func triggerTimer() {
            counter += 1
            
            containerView1.frame = CGRect(x: containerView1.frame.origin.x, y: containerView1.frame.origin.y, width: containerView1.frame.size.width, height: containerView1.frame.size.height)
    
            containerView2.frame = CGRect(x: containerView1.frame.origin.x, y: -1 * containerView2.frame.origin.y, width: containerView2.frame.size.width, height: containerView2.frame.size.height)
            
            UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseOut) {
    
                [self] in
                
                containerView1.frame = CGRect(x: containerView1.frame.minX, y: containerView1.frame.minY + 5, width: containerView1.frame.width, height: containerView1.frame.height)
                print("timerTrigger \(counter)")
                
                containerView2.frame = CGRect(x: containerView1.frame.minX, y: containerView2.frame.minY + 5, width: containerView2.frame.width, height: containerView2.frame.height)
                print("timerTrigger \(counter)")
    
            }
            completion: { [self] isFinished in
    
                containerView1.frame = CGRect(x: containerView1.frame.origin.x, y: containerView1.frame.origin.y, width: containerView1.frame.size.width, height: containerView1.frame.size.height)
        
                containerView2.frame = CGRect(x: containerView1.frame.origin.x, y: -1 * containerView2.frame.origin.y, width: containerView2.frame.size.width, height: containerView2.frame.size.height)
            }
    
        }
    
//    func animateRoad() {
//        let carImage = carView
//        let roadImage1 = containerView1
//        let roadImage2 = containerView2
//
//        roadImage1?.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        roadImage1?.contentMode = .scaleAspectFit
//
//        self.view.addSubview(roadImage1!)
//
//        roadImage2?.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        roadImage2?.contentMode = .scaleAspectFit
//
//        self.view.addSubview(roadImage2!)
//
//        UIView.animate(withDuration: 5.5, delay: 0.0, options: [.repeat, .curveLinear], animations: {
//
//            roadImage1?.frame = (roadImage1?.frame.offsetBy(dx: 0.0, dy: (roadImage1?.frame.size.height)!))!
//            roadImage2?.frame = (roadImage2?.frame.offsetBy(dx: 0.0, dy: (roadImage2?.frame.size.height)!))!
//        }) {(finished) in
//            roadImage1?.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
//            roadImage1?.contentMode = .scaleAspectFit
//
//            roadImage2?.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
//            roadImage2?.contentMode = .scaleAspectFit
//        }
//
//    }
    
    
    
    @objc func actionSwipe(_sender: Any) {
        
        if carView.frame.maxX + 10 < view.frame.width {
            move(direction: .right)
        }
    }
    
    @objc func actionSwipe2(_sender: Any) {
        
        if carView.frame.minX > 10 {
            move(direction: .left)
            
        }
    }
    
    
}
