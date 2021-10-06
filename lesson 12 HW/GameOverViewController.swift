//
//  GameOverViewController.swift
//  lesson 12 HW
//
//  Created by Сергей Золотухин on 06.10.2021.
//

import UIKit

class GameOverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startAgainButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
