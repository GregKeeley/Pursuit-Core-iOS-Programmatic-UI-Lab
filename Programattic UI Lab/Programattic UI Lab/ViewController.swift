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
    private var currentScore = 0
    private var highScore = 0
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        loadNewColor()
        setCurrentScoreLabel()
        toggleGameElements()
        setHighScoreLabel()
        mainView.currentScoreLabel.isHidden = true
        mainView.leftButton.addTarget(self, action: #selector(leftButtonPressed(_:)), for: .touchUpInside)
        mainView.middleButton.addTarget(self, action: #selector(middleButtonPressed(_:)), for: .touchUpInside)
        mainView.rightButton.addTarget(self, action: #selector(rightButtonPressed(_:)), for: .touchUpInside)
        mainView.beginGameButton.addTarget(self, action: #selector(beginGameButtonPressed), for: .touchUpInside)
    }

    private func toggleGameElements() {
        mainView.mainColorView.isHidden.toggle()
        mainView.leftButton.isHidden.toggle()
        mainView.middleButton.isHidden.toggle()
        mainView.rightButton.isHidden.toggle()
    }
    private func loadNewColor() {
        mainView.mainColorView.backgroundColor = guessingGame.getNewColor()
    }
    private func setCurrentScoreLabel() {
        mainView.currentScoreLabel.text = "Current Score: \(currentScore.description)"
    }
    private func setHighScore() {
        if currentScore > highScore {
                        highScore = currentScore
        }
    }
    private func changeHighScoreLabel() {
        mainView.highScoreLabel.text = "High Score: \(highScore)"
    }
    // TODO: Correct highScoreLabel funcs to properly refelect actual high score,
    private func setHighScoreLabel() {
        if highScore > 0 {
            mainView.highScoreLabel.isHidden = false
        } else {
            mainView.highScoreLabel.isHidden = true
        }
    }
    private func guessColor(color: UIColor) {
            
            if guessingGame.isDominant(guess: color) == true {
            setHighScore()
            changeHighScoreLabel()
            currentScore += 1
            setCurrentScoreLabel()
            mainView.mainColorView.backgroundColor = guessingGame.getNewColor()
            print(currentScore)
        } else {
                setHighScore()
                setHighScoreLabel()
                changeHighScoreLabel()
                                toggleGameElements()
                mainView.beginGameButton.setTitle("Tap here to try again", for: .normal)
                mainView.beginGameButton.isHidden = false
                mainView.currentScoreLabel.text = """
                Incorrect! Try Again?
                Your Score: \(currentScore)
                """
        }
    }
    @objc
    private func beginGameButtonPressed() {
        currentScore = 0
        mainView.currentScoreLabel.isHidden = false
        mainView.beginGameButton.isHidden = true
        setCurrentScoreLabel()
        toggleGameElements()
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

