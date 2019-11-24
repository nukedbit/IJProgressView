//
//  IJProgressView.swift
//  IJProgressView
//
//  Created by Isuru Nanayakkara on 1/14/15.
//  Copyright (c) 2015 Appex. All rights reserved.
//

import UIKit

open class IJProgressView {
    public static let shared = IJProgressView()
    
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var cancelButton = UIButton(type:.system)
    public var cancelText = "Cancel"
    public var cancelAction : (() -> Void)? = nil
    
    open func showProgressView(showCancel: Bool = false) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
        
        if showCancel {
            progressView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        }else {
            progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        }
        progressView.center = window.center
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        progressView.addSubview(cancelButton)
        
        cancelButton.frame = CGRect(x: 0, y: 80, width: 120, height: 40)
        cancelButton.setTitle(cancelText, for: .normal)
        cancelButton.titleLabel?.textAlignment = .center
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.addTarget(self, action: #selector(self.requestCancel), for: .touchUpInside)
        cancelButton.isHidden = !showCancel
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        UIApplication.shared.keyWindow?.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    @objc private func requestCancel() {
        self.cancelAction?()
    }
    
    open func hideProgressView() {
        self.cancelAction = nil;
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.containerView.removeFromSuperview()
        }
    }
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
