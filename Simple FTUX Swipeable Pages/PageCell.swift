//
//  PageCell.swift
//  Simple FTUX Swipeable Pages
//
//  Created by Noah Tsutsui on 7/20/18.
//  Copyright © 2018 Noah Tsutsui. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let page = page else {
                return
            }
            
            platformImageView.image = page.image
            
            let centerParagraphAlignment = NSMutableParagraphStyle()
            centerParagraphAlignment.alignment = .center
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [
                NSAttributedStringKey.foregroundColor: UIColor.black,
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 22),
                NSAttributedStringKey.paragraphStyle: centerParagraphAlignment
                ]
            )
            attributedText.append(
                NSMutableAttributedString(string: "\n\n\(page.description)", attributes: [
                    NSAttributedStringKey.foregroundColor: UIColor.gray,
                    NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light),
                    NSAttributedStringKey.paragraphStyle: centerParagraphAlignment
                    ]
                )
            )
            
            descriptionTextView.attributedText = attributedText
        }
    }
    
    private let topImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var platformImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Pallets01"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        addSubview(topImageContainerView)
        addSubview(platformImageView)
        addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate(
            [
                topImageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
                topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                platformImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
                platformImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
                platformImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6)
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                descriptionTextView.topAnchor.constraint(equalTo: platformImageView.bottomAnchor, constant: 10),
                descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
                descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
                descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ]
        )
    }
    
    
}
