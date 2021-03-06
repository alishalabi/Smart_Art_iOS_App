//
//  CollectionViewCell.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/3/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit
import AVFoundation
import NVActivityIndicatorView

class QuestionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        addSubview(AI)
        NSLayoutConstraint.activate([
            AI.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            AI.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            AI.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            AI.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
            ])
        setupImageView()
        //setupLabel()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        var view = UIImageView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .cyan
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var quizLabel = QuestionLabel(frame: .zero)
    
    private func setupImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 1, constant: -30),
            imageView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 1, constant: -30)
            ])
    }
    
    // Curently disable
    private func setupLabel() {
        addSubview(quizLabel)
        
        NSLayoutConstraint.activate([
            quizLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            quizLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
    
    var AI: NVActivityIndicatorView = {
        var ai = NVActivityIndicatorView(frame: .zero, type: .orbit, color: .white, padding: 50)
        ai.translatesAutoresizingMaskIntoConstraints = false
        return ai
    }()
    
    
    func updateCell(with image: UIImage?) {
        if let imageToDisplay = image {
            AI.stopAnimating()
            imageView.image = imageToDisplay
            imageView.layoutIfNeeded()
            let realImageRect = AVMakeRect(aspectRatio: imageToDisplay.size, insideRect: imageView.frame)
            var testingView = UIView(frame: realImageRect)
            testingView.backgroundColor = .red
            addSubview(testingView)
            
            
        } else {
            imageView.image = nil
            AI.startAnimating()
        }
    }
}
