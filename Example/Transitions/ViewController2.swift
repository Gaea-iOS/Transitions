//
//  ViewController2.swift
//  Transitions_Example
//
//  Created by 王小涛 on 2019/1/26.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Transitions

class ViewController2: UIViewController {

    private let interactor = Interactor()


    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(pan)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        //        view.superview!.addGestureRecognizer(tap)

    }

    @objc func handleTap(sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {

        let percentThreshold: CGFloat = 0.3

        let progress = sender.downwardMovementProgress(in: view)

        switch sender.state {
        case .began:
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
    }
}

extension ViewController2: UIViewControllerTransitioningDelegate {

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transition = DismissAnimator()
        transition.transitionStyle = .bottom
        transition.transitionDuration = 0.5
        return transition
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }

}

