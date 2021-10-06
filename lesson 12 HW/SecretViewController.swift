//
//  SecretViewController.swift
//  lesson 12 HW
//
//  Created by Сергей Золотухин on 05.10.2021.
//

import UIKit

enum Direction3 {
    case left
    case right
}

class SecretViewController: UIViewController {
    
    
    @IBOutlet weak var crashLabel: UILabel!
    
    
    
    let car = UIImageView()
    let roadPart1 = UIImageView()
    let roadPart2 = UIImageView()
    
    let roadPicture = UIImage(named: "Road.png")
    let carPicture = UIImage(named: "RacingCar.png")
    let blockPicture = UIImage(named: "Stop.png")
    
    let backgroundPart1 = UIView()
    let backgroundPart2 = UIView()
    
    let block1 = UIImageView()
    let block2 = UIImageView()
    let block3 = UIImageView()
    let block4 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configRecognizer()
        configRecognizer2()
        backgroundsPlace()
        createRoad()
        createCar()
        roadMoving()
        placeBlocks()
        isCrash()
    }
    
    func backgroundsPlace() {
        backgroundPart1.frame = CGRect(x: 0, y: 0 + 1, width: view.frame.width, height: view.frame.height)
        view.addSubview(backgroundPart1)
        
        backgroundPart2.frame = CGRect(x: 0, y: -view.frame.height, width: view.frame.width, height: view.frame.height)
        view.addSubview(backgroundPart2)
    }
    
    func createRoad() {
        roadPart1.image = roadPicture
        roadPart1.frame.origin = CGPoint(x: 0, y: 1 - view.frame.height)
        roadPart1.frame.size = CGSize(width: backgroundPart1.frame.width, height: backgroundPart1.frame.height)
        backgroundPart1.addSubview(roadPart1)
        
        roadPart2.image = roadPicture
        roadPart2.frame.origin = CGPoint(x: 0, y: 0)
        roadPart2.frame.size = CGSize(width: backgroundPart1.frame.width, height: backgroundPart1.frame.height)
        backgroundPart1.addSubview(roadPart2)
    }
    
    func createCar() {
        car.image = carPicture
        car.frame.size = CGSize(width: 65, height: 130)
        car.frame.origin = CGPoint(x: view.frame.width / 2 - car.frame.width / 2 - 40, y: view.frame.height - car.frame.height - 120)
        view.addSubview(car)
    }
    
    func placeBlocks() {
        block1.image = blockPicture
        block1.frame.size = CGSize(width: 70, height: 70)
        block1.frame.origin = CGPoint(x: view.frame.width / 2 - 158, y: -80)
        view.addSubview(block1)
        UIView.animate(withDuration: 4, delay: 0, options: [.repeat, .curveLinear]) {
            self.block1.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        
        block2.image = blockPicture
        block2.frame.size = CGSize(width: 70, height: 70)
        block2.frame.origin = CGPoint(x: view.frame.width / 2 - 75, y: -80)
        view.addSubview(block2)
        UIView.animate(withDuration: 4, delay: 4, options: [.repeat, .curveLinear]) {
            self.block2.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        
        block3.image = blockPicture
        block3.frame.size = CGSize(width: 70, height: 70)
        block3.frame.origin = CGPoint(x: view.frame.width / 2 + 86, y: -80)
        view.addSubview(block3)
        UIView.animate(withDuration: 4, delay: 9, options: [.repeat, .curveLinear]) {
            self.block3.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }

        block4.image = blockPicture
        block4.frame.size = CGSize(width: 70, height: 70)
        block4.frame.origin = CGPoint(x: view.frame.width / 2 + 6, y: -80)
        view.addSubview(block4)
        UIView.animate(withDuration: 4, delay: 13, options: [.repeat, .curveLinear]) {
            self.block4.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
    }
    
    func move(direction: Direction3) {
        switch direction {
        
        case .left:  car.frame = CGRect(x: car.frame.origin.x - 80,
                                        y: car.frame.origin.y,
                                        width: car.frame.width,
                                        height: car.frame.height)
        case .right: car.frame = CGRect(x: car.frame.origin.x + 80,
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
    
    func roadMoving() {
        UIView.animate(withDuration: 4, delay: 0, options: [.repeat, .curveLinear]) {
            self.backgroundPart1.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
        UIView.animate(withDuration: 4, delay: 4, options: [.repeat, .curveLinear]) {
            self.backgroundPart1.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
        }
    }
    
    func isCrash() {
        if car.frame.intersects(block1.frame) || car.frame.intersects(block2.frame) || car.frame.intersects(block3.frame) || car.frame.intersects(block4.frame) {
            crashLabel.isHidden = false
            crashLabel.text = "OMG OMG"
    }
    
    }
    
}
