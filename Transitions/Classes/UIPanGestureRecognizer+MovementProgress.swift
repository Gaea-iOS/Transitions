//
//  UIPanGestureRecognizer+MovementProgress.swift
//  Transitions
//
//  Created by 王小涛 on 2019/1/28.
//

import UIKit

extension UIPanGestureRecognizer {

    public func downwardMovementProgress(in view: UIView) -> CGFloat {
        let translation = self.translation(in: view)
        let movement = translation.y / view.bounds.width
        if movement < 0.0 {
            return 0.0
        } else if movement > 1.0 {
            return 1.0
        } else {
            return movement
        }
    }

    public func upwardMovementProgress(in view: UIView) -> CGFloat {
        let translation = self.translation(in: view)
        let movement = -translation.y / view.bounds.width
        if movement < 0.0 {
            return 0.0
        } else if movement > 1.0 {
            return 1.0
        } else {
            return movement
        }
    }

    public func rightwardMovementProgress(in view: UIView) -> CGFloat {
        let translation = self.translation(in: view)
        let movement = translation.x / view.bounds.width
        if movement < 0.0 {
            return 0.0
        } else if movement > 1.0 {
            return 1.0
        } else {
            return movement
        }
    }

    public func leftwardMovementProgress(in view: UIView) -> CGFloat {
        let translation = self.translation(in: view)
        let movement = -translation.x / view.bounds.width
        if movement < 0.0 {
            return 0.0
        } else if movement > 1.0 {
            return 1.0
        } else {
            return movement
        }
    }
}
