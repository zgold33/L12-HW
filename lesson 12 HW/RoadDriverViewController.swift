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
    
    
    @IBOutlet weak var deathLabel: UILabel!
    
    @IBOutlet weak var containerView1: UIImageView!
    
    @IBOutlet weak var containerView2: UIImageView!
    
    
    let car = UIImageView()
    let block1 = UIImageView()
    let block2 = UIImageView()
    let block3 = UIImageView()
    let block4 = UIImageView()
    
    let carPicture = UIImage(named: "RacingCar.png")
    let blockPicture = UIImage(named: "Stop.png")
    
    var counter: Int = 0
    var crTimer: Timer?
    var plTimer: Timer?
    
    var lifeCounter = 0
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        
        title = "Road driver"
        
        configRecognizer()
        configRecognizer2()
//        startPosition()
        createCar()
        placeBlocks()
        crashTimer()
        
    }
    
    func createCar() {
        car.image = carPicture
        car.frame.size = CGSize(width: 65, height: 130)
        car.frame.origin = CGPoint(x: view.frame.width / 2 - car.frame.width / 2 - 40, y: view.frame.height - car.frame.height - 120)
        view.addSubview(car)
    }
    
    func placeBlocks() {
        block1.image = blockPicture
        view.addSubview(block1)
        block1.frame.size = CGSize(width: 70, height: 70)
        block1.frame.origin = CGPoint(x: view.frame.width / 2 - 158, y: -80)
        UIView.animate(withDuration: 4, delay: 0, options: [.repeat, .curveLinear]) {
            self.block1.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        
        block2.image = blockPicture
        view.addSubview(block2)
        block2.frame.size = CGSize(width: 70, height: 70)
        block2.frame.origin = CGPoint(x: view.frame.width / 2 - 75, y: -80)
        UIView.animate(withDuration: 4, delay: 4, options: [.repeat, .curveLinear]) {
            self.block2.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        
        block3.image = blockPicture
        view.addSubview(block3)
        block3.frame.size = CGSize(width: 70, height: 70)
        block3.frame.origin = CGPoint(x: view.frame.width / 2 + 86, y: -80)
        UIView.animate(withDuration: 4, delay: 9, options: [.repeat, .curveLinear]) {
            self.block3.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        
        block4.image = blockPicture
        view.addSubview(block4)
        block4.image = blockPicture
        block4.frame.size = CGSize(width: 70, height: 70)
        block4.frame.origin = CGPoint(x: view.frame.width / 2 + 6, y: -80)
        UIView.animate(withDuration: 4, delay: 13, options: [.repeat, .curveLinear]) {
            self.block4.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
    }
    
    
    
    func move(direction: Direction2) {
        switch direction {
        
        case .left:  car.frame = CGRect(x: car.frame.origin.x - 90,
                                        y: car.frame.origin.y,
                                        width: car.frame.width,
                                        height: car.frame.height)
        case .right: car.frame = CGRect(x: car.frame.origin.x + 90,
                                        y: car.frame.origin.y,
                                        width: car.frame.width,
                                        height: car.frame.height)
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
    
//    func startPosition() {
//        containerView1.frame = CGRect(x: containerView1.frame.origin.x, y: containerView1.frame.origin.y, width: containerView1.frame.size.width, height: containerView1.frame.size.height)
//
//        containerView2.frame = CGRect(x: containerView1.frame.origin.x, y: 1 - containerView2.frame.height, width: containerView2.frame.size.width, height: containerView2.frame.size.height)
//    }
    
    func playTimer() {
        
        if plTimer == nil {
            plTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateRoad), userInfo: nil, repeats: true)
        }
    }
    
    func crashTimer() {
        if crTimer == nil {
            crTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(crashCheck), userInfo: nil, repeats: true)
        }
    }
    
    @objc func animateRoad() {
        counter += 1
        print("timerTrigger \(counter)")
        
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .curveLinear]) {
            self.containerView1.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        UIView.animate(withDuration: 3, delay: 3, options: [.repeat, .curveLinear]) {
            self.containerView2.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        
        
            
//            containerView1.frame = CGRect(x: containerView1.frame.minX, y: containerView1.frame.minY + 5, width: containerView1.frame.width, height: containerView1.frame.height)
//
//            containerView2.frame = CGRect(x: containerView1.frame.minX, y: containerView2.frame.minY + 5, width: containerView2.frame.width, height: containerView2.frame.height)
//
//            block1.frame = CGRect(x: containerView1.frame.minX + 25, y: containerView1.frame.minY + 5, width: 70, height: 70)
//
//            block2.frame = CGRect(x: containerView1.frame.minX + 25, y: containerView1.frame.minY + 200, width: 70, height: 70)
//
//            block3.frame = CGRect(x: containerView1.frame.minX + 25, y: containerView1.frame.minY - 250, width: 70, height: 70)
//
//            block4.frame = CGRect(x: containerView1.frame.minX + 25, y: containerView1.frame.minY - 400, width: 70, height: 70)
        
        
        
//        UIImageView.animate(withDuration: 1, delay: 1, options: .curveLinear, animations: { [self] in
//            containerView1.frame = CGRect(x: containerView1.frame.minX, y: containerView1.frame.minY + 5, width: containerView1.frame.width, height: containerView1.frame.height)
//
//            containerView2.frame = CGRect(x: containerView1.frame.minX, y: containerView2.frame.minY + 5, width: containerView2.frame.width, height: containerView2.frame.height)
//        }, completion: {[self] isFinish in
//
//            containerView1.frame = CGRect(x: containerView1.frame.origin.x, y: containerView1.frame.origin.y, width: containerView1.frame.size.width, height: containerView1.frame.size.height)
//
//            containerView2.frame = CGRect(x: containerView1.frame.origin.x, y: 1 - containerView2.frame.height, width: containerView2.frame.size.width, height: containerView2.frame.size.height)
//
//            containerView1.frame = CGRect(x: containerView1.frame.minX, y: containerView1.frame.minY + 5, width: containerView1.frame.width, height: containerView1.frame.height)
//
//            containerView2.frame = CGRect(x: containerView1.frame.minX, y: containerView2.frame.minY + 5, width: containerView2.frame.width, height: containerView2.frame.height)
//
//        })
            
        
    }
    
    @objc func actionSwipe(_sender: Any) {
        
        if car.frame.maxX + 10 < view.frame.width {
            move(direction: .right)
        }
    }
    
    @objc func actionSwipe2(_sender: Any) {
        
        if car.frame.minX > 10 {
            move(direction: .left)
        }
    }
    
    @objc func crashCheck() {
        if car.layer.presentation()!.frame.intersects(block1.layer.presentation()!.frame) {
            print("CRASH!")
            block1.removeFromSuperview()
            lifeCounter += 1
            deathLabel.text = "Death \(lifeCounter)"
        } else if car.layer.presentation()!.frame.intersects(block2.layer.presentation()!.frame) {
            print("CRASH!")
            block2.removeFromSuperview()
            lifeCounter += 1
            deathLabel.text = "Death \(lifeCounter)"
        } else if car.layer.presentation()!.frame.intersects(block3.layer.presentation()!.frame) {
            print("CRASH!")
            block3.removeFromSuperview()
            lifeCounter += 1
            deathLabel.text = "Death \(lifeCounter)"
        } else if car.layer.presentation()!.frame.intersects(block4.layer.presentation()!.frame) {
            print("CRASH!")
            block4.removeFromSuperview()
            lifeCounter += 1
            deathLabel.text = "Death \(lifeCounter)"
        }
        
        if lifeCounter == 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateViewController(identifier: "GameOverViewControllerID") as? GameOverViewController {
                controller.modalPresentationStyle = .overFullScreen
                present(controller, animated: true)
            }
        }
    }
    
    
    @IBAction func actionStart(_ sender: Any) {
        playTimer()
    }
    
}
