//
//  PresentAnimatedTransition.swift
//  Transitions
//
//  Created by 王小涛 on 2019/1/22.
//

import UIKit

public class PresentAnimator: NSObject {

    public var transitionDuration: TimeInterval = 0.3
    public var transitionStyle: TransitionStyle = .scale(initial: 0.3)

    public var finalFrame: (_ containerViewFrame: CGRect) -> CGRect = { $0 }
    public var finalBackgroundColor: UIColor?
    public var options: UIView.AnimationOptions = .curveLinear
    public var damping: CGFloat = 0.0
}

extension PresentAnimator: UIViewControllerAnimatedTransitioning {

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let toViewController = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView

        containerView.addSubview(toViewController.view)

        let transitionView = toViewController.view!
        let finalFrame = self.finalFrame(containerView.frame)

        let transitionState = transitionStyle.presentTransitionState(containerView: containerView, transitionView: transitionView, finalFrame: finalFrame)

        animate(initialState: {
            containerView.backgroundColor = .clear
            transitionState.initial()
        }, finnalState: {
            containerView.backgroundColor = self.finalBackgroundColor
            transitionState.final()
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

extension PresentAnimator {

    private func animate(initialState: () -> Void = {},
                 finnalState: @escaping () -> Void = {},
                 completion: @escaping (Bool) -> Void = { _ in }) {
        initialState()
        if damping == 0 {
            UIView.animate(withDuration: transitionDuration,
                           delay: 0.0,
                           options: options,
                           animations: finnalState,
                           completion: completion)
        } else {
            UIView.animate(withDuration: transitionDuration,
                           delay: 0.0,
                           usingSpringWithDamping: damping,
                           initialSpringVelocity: 1 / damping,
                           options: options,
                           animations: finnalState,
                           completion: completion)
        }
    }
}


