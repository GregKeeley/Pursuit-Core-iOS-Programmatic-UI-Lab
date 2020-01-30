//
//  ViewController.swift
//  Programattic UI Lab
//
//  Created by Gregory Keeley on 1/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let guessingGame = ColorGuessingModel()
    private var currentDomColor = UIColor()
    private var currentScore = Int()
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        loadNewColor()
        mainView.leftButton.addTarget(self, action: #selector(leftButtonPressed(_:)), for: .touchUpInside)
        mainView.middleButton.addTarget(self, action: #selector(middleButtonPressed(_:)), for: .touchUpInside)
        mainView.rightButton.addTarget(self, action: #selector(rightButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func loadNewColor() {
        mainView.mainColorView.backgroundColor = guessingGame.getNewColor()
    }
    private func guessColor(color: UIColor) {
            if guessingGame.isDominant(guess: color) == true {
            currentScore += 1
            print(currentScore)
        } else {
            
        }
    }
    @objc
    private func leftButtonPressed(_ sender: UIButton) {
        guessColor(color: .red)
    }
    @objc
    private func middleButtonPressed(_ sender: UIButton) {
        guessColor(color: .green)
    }
    @objc
    private func rightButtonPressed(_ sender: UIButton) {
        guessColor(color: .blue)
    }
}

