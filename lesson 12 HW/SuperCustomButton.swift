//
//  SuperCustomButton.swift
//  lesson 12 HW
//
//  Created by Сергей Золотухин on 01.10.2021.
//

import UIKit

class SuperCustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 10)
        self.layer.shadowRadius = 8.8
        self.layer.shadowOpacity = 0.7
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.orange.cgColor
    }
}
