//
//  UIViewController+InteractiveTansition.swift
//  Transitions
//
//  Created by 王小涛 on 2019/1/28.
//

import UIKit

extension UIViewController {

    struct AssociatedObjectKeys {
        static var interactor = "interactor"
        static var isInteractiveTransitionEnabled = "isInteractiveTransitionEnabled"
        static var panGestureRecognizerForInteractor = "panGestureRecognizerForInteractor"
    }

    public var interactor: Interactor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectKeys.interactor) as? Interactor
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.interactor, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    public var isInteractiveTransitionEnabled: Bool {
        get {
            if let value = objc_getAssociatedObject(self, &AssociatedObjectKeys.isInteractiveTransitionEnabled) as? Bool {
                return value
            } else {
                return false
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.isInteractiveTransitionEnabled, newValue, .OBJC_ASSOCIATION_ASSIGN)
            view.removeGestureRecognizer(panGestureRecognizerForInteractor)
            if newValue {
                view.addGestureRecognizer(panGestureRecognizerForInteractor)
            }
        }
    }

    private var panGestureRecognizerForInteractor: UIPanGestureRecognizer {
        get {
            if let value = objc_getAssociatedObject(self, &AssociatedObjectKeys.panGestureRecognizerForInteractor) as? UIPanGestureRecognizer {
                return value
            } else {
                let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
                objc_setAssociatedObject(self, &AssociatedObjectKeys.panGestureRecognizerForInteractor, pan, .OBJC_ASSOCIATION_RETAIN)
                return pan
            }
        }
    }
}

extension UIViewController {

    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {

        guard let interactor = interactor else { return }

        let percentThreshold: CGFloat = 0.3

        let progress = sender.downwardMovementProgress(in: view)

        print("progress = \(progress)")

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


extension UIPanGestureRecognizer {

    func downwardMovementProgress(in view: UIView) -> CGFloat {
        let translation = self.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(Float(downwardMovement), 1.0)
        let progress = CGFloat(downwardMovementPercent)
        return progress
    }
}
