//
//  PresentingAnimator.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 12/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class PresentingAnimator : NSObject,UIViewControllerAnimatedTransitioning{
    
    var originFrame = CGRect.zero
    var duration = 0.33
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!

        let finalFrame = toView.frame
        
        let xScaleFactor = originFrame.width / finalFrame.width
        let yScaleFactor = originFrame.height / finalFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        toView.transform = scaleTransform
        toView.center = CGPoint(
            x: originFrame.midX,
            y: originFrame.midY
        )
        
        toView.clipsToBounds = true
        
        
        
        container.addSubview(toView)
        
        
        UIView.animate(withDuration: duration, delay: 0.0,
                       options: [], animations: {
                        
                        toView.transform = CGAffineTransform.identity
                        toView.center = CGPoint(
                            x: finalFrame.midX,
                            y: finalFrame.midY
                        )
                        
        }, completion: {_ in
            
            transitionContext.completeTransition(
                !transitionContext.transitionWasCancelled
            )
        })
    }
    
}
