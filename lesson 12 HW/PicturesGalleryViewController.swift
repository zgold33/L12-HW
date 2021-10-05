//
//  PicturesGalleryViewController.swift
//  lesson 12 HW
//
//  Created by Сергей Золотухин on 01.10.2021.
//

import UIKit

class PicturesGalleryViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    var number:Int = 0
    var picturesArray = [UIImage(named: "squirrel.png"), UIImage(named: "mario.png"), UIImage(named: "phone.png"), UIImage(named:"whiteCat.png"), UIImage(named:"kupidon.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture Gallery"
    }
    
    @IBAction func actionStart(_ sender: Any) {
        
        imageView.image = picturesArray[number]
        
        imageView.frame = CGRect(x: CGFloat(0 - imageView.frame.width), y: CGFloat(containerView.frame.height / 2 - imageView.frame.height / 2), width: imageView.frame.width, height: imageView.frame.height)
        
        if number == (picturesArray.count - 1) {
            number = 0
        }
        
        number += 1
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut) { [self] in
            
            imageView.frame = CGRect(x: CGFloat(containerView.frame.width / 2 - imageView.frame.height), y: CGFloat(containerView.frame.height / 2 - imageView.frame.height / 2), width: imageView.frame.width, height: imageView.frame.height)
        }
        completion: { [self] isFinished in
            
            UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut) {
                
                imageView.frame = CGRect(x: CGFloat(containerView.frame.width / 2 + containerView.frame.width), y: CGFloat(containerView.frame.height / 2 - imageView.frame.height / 2), width: imageView.frame.width, height: imageView.frame.height)
            }
        }
        
    }
    
}
