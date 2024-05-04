//
//  AMNowPlayingAnimationController.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMNowPlayingAnimationController: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, UIViewControllerInteractiveTransitioning {
    // MARK: - Private Properties
    private var interactiveTransitionContext: UIViewControllerContextTransitioning!
    
    private var panGestureRecogniser: UIPanGestureRecognizer!
    
    // MARK: - Public Properties
    weak var parent: AMNowPlayingViewController!
    
    var transitionDuration: TimeInterval = 0.5
    
    var wantsInteractiveStart: Bool = false
    
    // MARK: - init(parent:)
    init(parent: AMNowPlayingViewController) {
        super.init()
        self.parent = parent
    }
    
    // MARK: - Private Methods
    private func animatePresentationTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let delegate = parent.delegate else { fatalError() }
        
        let sourceRect = delegate.nowPlayingViewController(parent, sourceRectFor: parent.view)
        
        let toolBar = delegate.nowPlayingViewController(parent, sourceViewFor: parent.view)
        toolBar.alpha = 0
        
        let transitionToolBar = AMToolbarView()
        transitionToolBar.song = toolBar.song
        transitionToolBar.isArtworkViewHidden = true
        transitionToolBar.frame = sourceRect
        transitionToolBar.layoutIfNeeded()
        
        let nowPlayingView = parent.view!
        nowPlayingView.layoutIfNeeded()
        
        let clippingView = UIView()
        clippingView.alpha = 0
        clippingView.frame = sourceRect
        clippingView.clipsToBounds = true
        clippingView.layer.cornerCurve = .continuous
        clippingView.layer.cornerRadius = toolBar.cornerRadius
        clippingView.addSubview(nowPlayingView)
        
        let artworkView = parent.view.subviews.first(of: AMArtworkView.self)!
        artworkView.alpha = 0
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.cornerCurve = .continuous
        imageView.image = artworkView.artwork
        imageView.frame = CGRect(x: toolBar.frame.minX + 8, y: toolBar.frame.minY + 8, width: 40, height: 40)
        
        let containerView = transitionContext.containerView
        containerView.addSubview(transitionToolBar)
        containerView.addSubview(clippingView)
        containerView.addSubview(imageView)
        
        let sourceView = transitionContext.viewController(forKey: .from)!.view!
        sourceView.clipsToBounds = true
        sourceView.layer.cornerCurve = .continuous
        sourceView.layer.cornerRadius = UIScreen.main.displayCornerRadius
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration, dampingRatio: 1) {
            transitionToolBar.frame = containerView.bounds
            transitionToolBar.cornerRadius = UIScreen.main.displayCornerRadius
            
            clippingView.layer.cornerRadius = UIScreen.main.displayCornerRadius
            clippingView.frame = containerView.bounds
            clippingView.alpha = 1
            
            nowPlayingView.frame = containerView.bounds
            
            imageView.layer.cornerRadius = 10
            imageView.frame = artworkView.frame
            
            sourceView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            sourceView.layer.cornerRadius = 30
        }
        
        animator.addCompletion { position in
            toolBar.alpha = 1
            artworkView.alpha = 1
            sourceView.transform = .identity
            
            containerView.addSubview(nowPlayingView)
            
            clippingView.removeFromSuperview()
            transitionToolBar.removeFromSuperview()
            imageView.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
    }
    
    private func animateDismissalTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let delegate = parent.delegate else { fatalError() }
        
        let sourceRect = delegate.nowPlayingViewController(parent, sourceRectFor: parent.view)
        
        let toolBar = delegate.nowPlayingViewController(parent, sourceViewFor: parent.view)
        toolBar.alpha = 0
        
        let transitionToolBar = AMToolbarView()
        transitionToolBar.song = toolBar.song
        transitionToolBar.isArtworkViewHidden = true
        transitionToolBar.frame = parent.view.frame
        transitionToolBar.cornerRadius = UIScreen.main.displayCornerRadius
        transitionToolBar.layoutIfNeeded()
        
        let nowPlayingView = parent.view!
        nowPlayingView.layoutIfNeeded()
        
        let clippingView = UIView()
        clippingView.autoresizesSubviews = false
        clippingView.clipsToBounds = true
        clippingView.layer.cornerCurve = .continuous
        clippingView.layer.cornerRadius = UIScreen.main.displayCornerRadius
        clippingView.frame = transitionContext.containerView.frame
        clippingView.addSubview(nowPlayingView)
        
        let artworkView = parent.view.subviews.first(of: AMArtworkView.self)!
        artworkView.alpha = 0
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.cornerCurve = .continuous
        imageView.image = artworkView.artwork
        imageView.frame = artworkView.frame
        
        let containerView = transitionContext.containerView
        containerView.addSubview(transitionToolBar)
        containerView.addSubview(clippingView)
        containerView.addSubview(imageView)
        
        let destinationView = transitionContext.viewController(forKey: .to)!.view!
        destinationView.clipsToBounds = true
        destinationView.layer.cornerCurve = .continuous
        destinationView.layer.cornerRadius = 30
        destinationView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration, dampingRatio: 1) {
            transitionToolBar.frame = sourceRect
            transitionToolBar.cornerRadius = 14
            
            clippingView.layer.cornerRadius = 14
            clippingView.frame = sourceRect
            clippingView.alpha = 0
            
            nowPlayingView.frame.size = containerView.frame.size
            nowPlayingView.frame.origin.x = (sourceRect.width / 2) - (containerView.frame.width / 2)
            
            imageView.layer.cornerRadius = 5
            imageView.frame.size = CGSize(width: 40, height: 40)
            imageView.frame.origin = CGPoint(x: toolBar.frame.minX + 8, y: toolBar.frame.minY + 8)
            
            destinationView.transform = CGAffineTransform(scaleX: 1, y: 1)
            destinationView.layer.cornerRadius = UIScreen.main.displayCornerRadius
        }
        
        animator.addCompletion { position in
            toolBar.alpha = 1
            
            clippingView.removeFromSuperview()
            transitionToolBar.removeFromSuperview()
            imageView.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
    }
    
    @objc private func panGestureRecognised(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            wantsInteractiveStart = true
            parent?.dismiss(animated: true)
        case .changed:
            interactiveTransitionDidChange(sender)
        case .ended:
            interactiveTransitionDidEnd(sender)
        default:
            return
        }
    }
    
    private func interactiveTransitionDidBegin(_ transitionContext: UIViewControllerContextTransitioning) {
        self.interactiveTransitionContext = transitionContext
        transitionContext.containerView.addGestureRecognizer(panGestureRecogniser)
        
        let clippingView = UIView()
        clippingView.autoresizesSubviews = false
        clippingView.clipsToBounds = true
        clippingView.layer.cornerCurve = .continuous
        clippingView.layer.cornerRadius = UIScreen.main.displayCornerRadius
        clippingView.frame = interactiveTransitionContext.containerView.bounds
        
        clippingView.addSubview(parent.view)
        
        let containerView = interactiveTransitionContext.containerView
        containerView.addSubview(clippingView)
        
        let destinationView = transitionContext.viewController(forKey: .to)!.view
        destinationView?.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        
        parent.delegate?.nowPlayingViewController(parent, sourceViewFor: parent.view).alpha = 0
    }
    
    private func interactiveTransitionDidChange(_ panGestureRecogniser: UIPanGestureRecognizer) {
        let clippingView = interactiveTransitionContext.containerView.subviews[0]
        let y = panGestureRecogniser.translation(in: parent.view).y
        clippingView.frame.origin.y = max(0, y)
        
        let fractionComplete = y / parent.view.frame.height
        let scale = interpolate(0.85, 1, by: fractionComplete)
        let cornerRadius = interpolate(30, UIScreen.main.displayCornerRadius, by: fractionComplete)
        
        let destinationView = interactiveTransitionContext.viewController(forKey: .to)!.view!
        destinationView.transform = CGAffineTransform(scaleX: scale, y: scale)
        destinationView.layer.cornerRadius = cornerRadius
    }
    
    private func interactiveTransitionDidEnd(_ panGestureRecogniser: UIPanGestureRecognizer) {
        guard let delegate = parent.delegate else { fatalError() }
        
        let toolBar = delegate.nowPlayingViewController(parent, sourceViewFor: parent.view)
        
        let transitionToolBar = AMToolbarView()
        transitionToolBar.song = toolBar.song
        transitionToolBar.isArtworkViewHidden = true
        transitionToolBar.cornerRadius = UIScreen.main.displayCornerRadius
        transitionToolBar.frame = interactiveTransitionContext.containerView.subviews[0].frame
        transitionToolBar.layoutIfNeeded()
        
        let artworkView = parent.view.subviews.first(of: AMArtworkView.self)!
        artworkView.alpha = 0
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = artworkView.artwork
        imageView.layer.cornerRadius = 10
        imageView.layer.cornerCurve = .continuous
        imageView.frame = parent.view.convert(artworkView.frame, to: interactiveTransitionContext.containerView)
        
        let containerView = interactiveTransitionContext.containerView
        containerView.insertSubview(transitionToolBar, at: 0)
        containerView.addSubview(imageView)
        
        let clippingView = containerView.subviews[1]
        let destinationView = interactiveTransitionContext.viewController(forKey: .to)!.view!
        
        let animator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 1) { [unowned self] in
            transitionToolBar.cornerRadius = 14
            transitionToolBar.frame = delegate.nowPlayingViewController(parent, sourceRectFor: parent.view)
            
            clippingView.frame = delegate.nowPlayingViewController(parent, sourceRectFor: parent.view)
            clippingView.layer.cornerRadius = 14
            clippingView.alpha = 0
            
            imageView.layer.cornerRadius = 6
            imageView.frame.size = CGSize(width: 40, height: 40)
            imageView.frame.origin = CGPoint(x: toolBar.frame.minX + 8, y: toolBar.frame.minY + 8)
            
            destinationView.layer.cornerRadius = UIScreen.main.displayCornerRadius
            destinationView.transform = .identity
        }
        
        animator.addCompletion { [unowned self] _ in
            delegate.nowPlayingViewController(parent, sourceViewFor: parent.view).alpha = 1
            
            destinationView.layer.cornerRadius = 0
            
            interactiveTransitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
    }
    
    // MARK: - Public Methods
    func setupPanGestureRecogniser(in view: UIView) {
        panGestureRecogniser = UIPanGestureRecognizer()
        panGestureRecogniser.cancelsTouchesInView = false
        panGestureRecogniser.addTarget(self, action: #selector(panGestureRecognised))
        
        view.addGestureRecognizer(panGestureRecogniser)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if transitionContext.viewController(forKey: .to) is AMNowPlayingViewController {
            animatePresentationTransition(using: transitionContext)
        } else {
            animateDismissalTransition(using: transitionContext)
        }
    }
    
    // MARK: - UIViewControllerInteractiveTransitioning
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        interactiveTransitionDidBegin(transitionContext)
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return wantsInteractiveStart ? self : nil
    }
}
