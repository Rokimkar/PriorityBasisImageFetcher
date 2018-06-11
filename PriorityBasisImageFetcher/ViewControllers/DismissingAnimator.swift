//
//  DismissingAnimator.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 12/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class DismissingAnimator : NSObject,UIViewControllerAnimatedTransitioning{
    let duration = 1.0
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        containerView.insertSubview(toView, belowSubview: fromView)
        
        UIView.animate(withDuration: duration, delay: 0.0, options: [], animations: {
            
            fromView.transform = CGAffineTransform(scaleX: self.originFrame.size.width/fromView.frame.size.width, y: self.originFrame.size.height/(fromView.frame.size.height-10))
            fromView.center = CGPoint(
                x: self.originFrame.midX,
                y: self.originFrame.midY
            )
            
        }, completion: {_ in
            transitionContext.completeTransition(
                !transitionContext.transitionWasCancelled
            )
        })
    }
}
