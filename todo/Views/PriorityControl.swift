//
//  PriorityControl.swift
//  todo
//
//  Created by Ehidiamen Ojielu on 6/7/20.
//  Copyright © 2020 ehis. All rights reserved.
//

import UIKit

@IBDesignable class PriorityControl: UIStackView {
    
    // MARK: - Properties
    private var priorityButtons = [UIButton]()
    @IBInspectable var prioritySize: CGSize = CGSize(width: 30.0, height: 30.0) {
        didSet {
            setupPriorityButtons()
        }
    }
    var priority = Priority.low
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPriorityButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupPriorityButtons()
    }
    
    private func setupPriorityButtons() {
        // clear any existing buttons
        for button in priorityButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        priorityButtons.removeAll()
        
        for index in 0..<3 {
            let button = UIButton()
            var backgroundColor: UIColor
            var accessibilityLabel: String
            if index == 0 {
                backgroundColor = UIColor.green
                accessibilityLabel = "Set a \(Priority.low) for this task"
                button.layer.borderWidth = 2.0;
                button.layer.borderColor = UIColor.gray.cgColor
            } else if index == 1 {
                backgroundColor = UIColor.orange
                accessibilityLabel = "Set a \(Priority.medium) for this task"
            } else {
                backgroundColor = UIColor.red
                accessibilityLabel = "Set a \(Priority.high) for this task"
            }
            
            button.backgroundColor = backgroundColor
            button.accessibilityLabel = accessibilityLabel
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 0.5 * prioritySize.width
            button.clipsToBounds = true
            button.heightAnchor.constraint(equalToConstant: prioritySize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: prioritySize.width).isActive = true
            
            button.addTarget(self, action: #selector(PriorityControl.priorityButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            
            priorityButtons.append(button)
        }
    }
    
    // MARK: - Button Actions
    
    @objc func priorityButtonTapped(button: UIButton) {
        // Reset look & feel for all buttons
        for button in priorityButtons {
            button.layer.borderWidth = 0
            button.layer.borderColor = UIColor.clear.cgColor
        }
        
        guard let index = priorityButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the priorityButtons array: \(priorityButtons)")
        }
        
        if index == 0 {
            priority = .low
        } else if index == 1 {
            priority = .medium
        } else {
            priority = .high
        }
        
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}
