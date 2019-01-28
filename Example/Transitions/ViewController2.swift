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

    override func viewDidLoad() {
        super.viewDidLoad()
        isInteractiveTransitionEnabled = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.superview!.addGestureRecognizer(tap)
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
//        view.superview!.addGestureRecognizer(pan)
    }

    @objc func handleTap(sender: Any) {
        dismiss(animated: true, completion: nil)
    }

//
//    @objc func handleGesture(_ sender: UIPanGestureRecognizer) {
//        guard let interactor = interactor else {return}
//        let percentThreshold:CGFloat = 0.3
//        // convert y-position to downward pull progress (percentage)
//        let translation = sender.translation(in: view.superview!)
//        let verticalMovement = translation.y / view.bounds.height
//        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
//        let downwardMovementPercent = fminf(downwardMovement, 1.0)
//        let progress = CGFloat(downwardMovementPercent)
//
//        print("progress = \(progress)")
//
//        switch sender.state {
//        case .began:
//            interactor.hasStarted = true
//            dismiss(animated: true, completion: nil)
//        case .changed:
//            interactor.shouldFinish = progress > percentThreshold
//            interactor.update(progress)
//        case .cancelled:
//            interactor.hasStarted = false
//            interactor.cancel()
//        case .ended:
//            interactor.hasStarted = false
//            interactor.shouldFinish
//                ? interactor.finish()
//                : interactor.cancel()
//        default:
//            break
//        }
//    }
}
