//
//  DismissAnimatedTransition.swift
//  Transitions
//
//  Created by 王小涛 on 2019/1/26.
//

import UIKit

public class DismissAnimator: NSObject {
    public var transitionDuration: TimeInterval = 0.3
    public var transitionStyle: TransitionStyle = .scale(initial: 0.5)
    public var options: UIView.AnimationOptions = .curveEaseInOut
}

extension DismissAnimator: UIViewControllerAnimatedTransitioning {

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let fromViewController = transitionContext.viewController(forKey: .from)!
        let containerView = transitionContext.containerView

        let transitionView = fromViewController.view!

        let transitionState = transitionStyle.dismissTransitionState(containerView: containerView, transitionView: transitionView)

        animate(initialState: {
            transitionState.initial()
        }, finnalState: {
            containerView.backgroundColor = .clear
            transitionState.final()
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

extension DismissAnimator {

    private func animate(initialState: () -> Void = {},
                         finnalState: @escaping () -> Void = {},
                         completion: @escaping (Bool) -> Void = { _ in }) {
        initialState()
        UIView.animate(withDuration: transitionDuration,
                       delay: 0.0,
                       options: options,
                       animations: finnalState,
                       completion: completion)
    }
}
