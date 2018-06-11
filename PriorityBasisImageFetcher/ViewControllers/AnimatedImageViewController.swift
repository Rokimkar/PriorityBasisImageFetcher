//
//  AnimatedImageViewController.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 12/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class AnimatedImageViewController: UIViewController {

    @IBOutlet weak var contentImageView: UIImageView!
    var contentImage : UIImage?
    var contextFrame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView.image = contentImage
        addRightBarButton()
        self.navigationController?.navigationBar.barTintColor = .white
        // Do any additional setup after loading the view.
    }
    
    func addRightBarButton(){
        let leftBarButton = UIBarButtonItem.init(title: "Back", style: .done, target: self, action: #selector(optionButtonPressed))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func optionButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension AnimatedImageViewController : UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        let presentingAnimator = PresentingAnimator.init()
        presentingAnimator.originFrame = contextFrame
        return presentingAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let dismissingAnimator = DismissingAnimator.init()
        dismissingAnimator.originFrame = contextFrame
        return dismissingAnimator
    }
}
