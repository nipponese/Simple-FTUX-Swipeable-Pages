//
//  SwipeableViewController + extension.swift
//  Simple FTUX Swipeable Pages
//
//  Created by Noah Tsutsui on 7/20/18.
//  Copyright © 2018 Noah Tsutsui. All rights reserved.
//

import UIKit

extension SwipingViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = CGPoint.zero
            } else {
                self.collectionView?.scrollToItem(at: IndexPath(item: self.pageControl.currentPage, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
            }
        }) { (_) in
            
        }
    }
}
