//
//  ViewController.swift
//  Transitions
//
//  Created by wangxiaotao on 01/22/2019.
//  Copyright (c) 2019 wangxiaotao. All rights reserved.
//

import UIKit
import Transitions

class ViewController: UIViewController {

    var transitionStyle: TransitionStyle = .scale(initial: 0.5)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private var viewController: UIViewController {
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        viewController.modalPresentationStyle = .custom
//        viewController.transitioningDelegate = self
//        viewController.view.addGestureRecognizer(UITapGestureRecognizer(target: viewController, action: #selector(dismiss(animated:completion:))))
//        viewController.interactor = interactor
        return viewController
    }

    @IBAction func clickTopButton(sender: Any) {
        transitionStyle = .top
        present(viewController, animated: true, completion: nil)
    }

    @IBAction func clickBottomButton(sender: Any) {
        transitionStyle = .bottom
        present(viewController, animated: true, completion: nil)
    }

    @IBAction func clickLeftButton(sender: Any) {
        transitionStyle = .left
        present(viewController, animated: true, completion: nil)
    }

    @IBAction func clickDampingButton(sender: Any) {
        transitionStyle = .scale(initial: 0.5)
        present(viewController, animated: true, completion: nil)
    }
}

//extension ViewController: UIViewControllerTransitioningDelegate {
////    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
////        let transition = PresentAnimator()
////        transition.transitionStyle = transitionStyle
////        transition.transitionDuration = 0.3
////        transition.damping = 0.8
////        if #available(iOS 11.0, *) {
////        transition.finalFrame = {
////            CGRect(x: ($0.width-300) / 2, y: $0.height-300, width: 300, height: 300)
////            }
////        }
////        transition.finalBackgroundColor = UIColor(white: 0, alpha: 0.5)
////        return transition
////    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        let transition = DismissAnimator()
//        transition.transitionStyle = transitionStyle
//        transition.transitionDuration = 0.3
//        return transition
//    }
//
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return interactor!.hasStarted ? interactor : nil
//    }
//
//}
