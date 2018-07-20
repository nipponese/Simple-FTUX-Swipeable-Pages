//
//  SwipeableViewController + UIScrollView.swift
//  Simple FTUX Swipeable Pages
//
//  Created by Noah Tsutsui on 7/20/18.
//  Copyright © 2018 Noah Tsutsui. All rights reserved.
//

import UIKit

extension SwipingViewController {
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
}
