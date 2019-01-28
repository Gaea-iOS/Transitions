//
//  UIView+Animate.swift
//  Transitions
//
//  Created by 王小涛 on 2019/1/28.
//

import UIKit

extension UIView {

    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 usingSpringWithDamping dampingRatio: CGFloat,
                 initialSpringVelocity velocity: CGFloat,
                 options: UIView.AnimationOptions = [],
                 initialState: () -> Void = {},
                 finnalState: @escaping () -> Void = {},
                 completion: @escaping (Bool) -> Void = { _ in }) {
        initialState()
        if dampingRatio == 0 {
            UIView.animate(withDuration: duration,
                           delay: 0.0,
                           options: options,
                           animations: finnalState,
                           completion: completion)
        } else {
            UIView.animate(withDuration: duration,
                           delay: 0.0,
                           usingSpringWithDamping: dampingRatio,
                           initialSpringVelocity: velocity,
                           options: options,
                           animations: finnalState,
                           completion: completion)
        }
    }
}



