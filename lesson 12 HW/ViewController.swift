//
//  ViewController.swift
//  lesson 12 HW
//
//  Created by Сергей Золотухин on 01.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "HOME"
        
        configNavigationBar()
        
        super.viewDidLoad()
        let color1 = UIColor(red: 139 / 255, green: 253 / 255, blue: 61 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 94 / 255, green: 40 / 255, blue: 49 / 255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func configNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .orange
    }
    
    @IBAction func NonStopCircle(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "NonStopCircleViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func PicturesGallery(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "PicturesGalleryViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func RoadDriver(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "RoadDriverViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func secretButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "SecretViewControllerID")
        navigationController?.pushViewController(controller, animated: true)
    }
    

}

