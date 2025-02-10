//
//  UISetup.swift
//  MovieDB
//
//  Created by Soemin Thein on 20/01/2025.
//

import UIKit

func setupGradientBackground(_ view: UIView) {
    
    let gradientLayer = CAGradientLayer()
    
    gradientLayer.frame = view.bounds
    
    gradientLayer.colors = [
        UIColor.black.cgColor,
        UIColor(red: 10/255, green: 51/255, blue: 82/255, alpha: 1).cgColor
    ]
    
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)   // Top center
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)     // Bottom center
    
    
    view.layer.insertSublayer(gradientLayer, at: 0)
}
