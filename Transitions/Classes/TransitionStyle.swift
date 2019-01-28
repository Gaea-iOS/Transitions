//
//  PresentTransitionStyle.swift
//  Transitions
//
//  Created by 王小涛 on 2019/1/28.
//

import UIKit

public enum TransitionStyle {
    case top
    case bottom
    case left
    case scale(initial: CGFloat)
}

extension TransitionStyle {

    func presentTransitionState(containerView: UIView, transitionView: UIView, finalFrame: CGRect)
        -> (initial: () -> (), final: () -> ()) {

            var initialFrame: CGRect {
                switch self {
                case .top:
                    var frame = finalFrame
                    frame.origin.y = -frame.height
                    return frame

                case .bottom:
                    var frame = finalFrame
                    frame.origin.y = frame.minY + frame.height + (containerView.bounds.height - frame.maxY)
                    return frame

                case .left:
                    var frame = finalFrame
                    frame.origin.x = -frame.width
                    return frame

                case .scale:
                    return finalFrame
                }
            }

            switch self {
            case .top:
                let initialState = {
                    transitionView.frame = initialFrame
                }
                let finalState = {
                    transitionView.frame = finalFrame
                }
                return (initial: initialState, final: finalState)

            case .bottom:
                let initialState = {
                    transitionView.frame = initialFrame
                }
                let finalState = {
                    transitionView.frame = finalFrame
                }
                return (initial: initialState, final: finalState)

            case .left:
                let initialState = {
                    transitionView.frame = initialFrame
                }
                let finalState = {
                    transitionView.frame = finalFrame
                }
                return (initial: initialState, final: finalState)

            case let .scale(initial: value):
                let initialState = {
                    transitionView.frame = initialFrame
                    transitionView.alpha = 0.0
                    transitionView.transform = CGAffineTransform(scaleX: value, y: value)
                }
                let finalState = {
                    transitionView.alpha = 1.0
                    transitionView.transform = .identity
                }
                return (initial: initialState, final: finalState)
            }
    }

    func dismissTransitionState(containerView: UIView, transitionView: UIView)
        -> (initial: () -> (), final: () -> ()) {

            var finalFrame: CGRect {
                switch self {
                case .top:
                    var frame = transitionView.frame
                    frame.origin.y = -frame.height
                    return frame

                case .bottom:
                    var frame = transitionView.frame
                    frame.origin.y = containerView.bounds.height + frame.height
                    return frame

                case .left:
                    var frame = transitionView.frame
                    frame.origin.x = -frame.width
                    return frame

                case .scale:
                    return transitionView.frame
                }
            }

            switch self {
            case .top:
                let initialState = { }
                let finalState = {
                    transitionView.frame = finalFrame
                }
                return (initial: initialState, final: finalState)

            case .bottom:
                let initialState = { }
                let finalState = {
                    transitionView.frame = finalFrame
                }
                return (initial: initialState, final: finalState)

            case .left:
                let initialState = { }
                let finalState = {
                    transitionView.frame = finalFrame
                }
                return (initial: initialState, final: finalState)

            case let .scale(initial: value):
                let initialState = { }
                let finalState = {
                    transitionView.alpha = 0.0
                    transitionView.transform = CGAffineTransform(scaleX: value, y: value)
                }
                return (initial: initialState, final: finalState)
            }
    }
}

