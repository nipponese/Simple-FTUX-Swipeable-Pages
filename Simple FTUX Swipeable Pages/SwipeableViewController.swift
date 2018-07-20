//
//  SwipeableViewController.swift
//  Simple FTUX Swipeable Pages
//
//  Created by Noah Tsutsui on 7/20/18.
//  Copyright © 2018 Noah Tsutsui. All rights reserved.
//

import UIKit

class SwipingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(image: #imageLiteral(resourceName: "Pallets01"), title: "Super Simple", description: "Just a demo app that uses a UICollectionView."),
        Page(image: #imageLiteral(resourceName: "Pallets02"), title: "Four Frames", description: "Just enough to show that it works."),
        Page(image: #imageLiteral(resourceName: "Pallets03"), title: "Any Orientation", description: "Go ahead, turn the phone on its side."),
        Page(image: #imageLiteral(resourceName: "Pallets04"), title: "Indicators Too", description: "Page indicators should work regardless if you use the buttons or swipe gesture to changes CollectionView items.")
    ]
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
    private let prevButton: UIButton = {
        let button = UIButton()
        button.setTitle("Prev", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(prevPage), for: .touchUpInside)
        return button
    }()
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.pink, for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    
    @objc private func nextPage() {
        let nextPage = min(pageControl.currentPage + 1, pages.count - 1)
        pageControl.currentPage = nextPage
        let indexPath = IndexPath(item: nextPage, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }
    
    @objc private func prevPage() {
        let prevPage = max(pageControl.currentPage - 1, 0)
        pageControl.currentPage = prevPage
        let indexPath = IndexPath(item: prevPage, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }
    
    private let bottomControls: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = UIStackViewDistribution.fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        view.addSubview(bottomControls)
        bottomControls.addArrangedSubview(prevButton)
        bottomControls.addArrangedSubview(pageControl)
        bottomControls.addArrangedSubview(nextButton)
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls() {
        NSLayoutConstraint.activate(
            [
                bottomControls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControls.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControls.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControls.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
}
