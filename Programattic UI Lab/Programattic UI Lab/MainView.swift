//
//  MainView.swift
//  Programattic UI Lab
//
//  Created by Gregory Keeley on 1/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class MainView: UIView {

    public lazy var mainColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    public lazy var leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    public lazy var middleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        return button
    }()
    public lazy var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        setMainColorViewConstraints()
        setLeftButtonConstraints()
        setMiddleButtonConstraints()
        setRightButtonConstraints()
    }
    
    private func setMainColorViewConstraints() {
        addSubview(mainColorView)
        mainColorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            mainColorView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            mainColorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mainColorView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mainColorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
                ])
    }
    private func setLeftButtonConstraints() {
        addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.topAnchor.constraint(equalTo: mainColorView.bottomAnchor, constant: 20),
            leftButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            leftButton.heightAnchor.constraint(equalToConstant: 50),
            leftButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setMiddleButtonConstraints() {
        addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.topAnchor.constraint(equalTo: mainColorView.bottomAnchor, constant: 20),
            middleButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            middleButton.heightAnchor.constraint(equalToConstant: 50),
            middleButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setRightButtonConstraints() {
        addSubview(rightButton)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            rightButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            rightButton.topAnchor.constraint(equalTo: mainColorView.bottomAnchor, constant: 20),
            rightButton.heightAnchor.constraint(equalToConstant: 50),
            rightButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
