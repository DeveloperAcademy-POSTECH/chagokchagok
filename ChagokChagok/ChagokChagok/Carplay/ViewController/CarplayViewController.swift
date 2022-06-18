//
//  CarplayViewController.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/18.
//  Copyright © 2018 Sander van Tulden. All rights reserved.
//

import UIKit
import CarPlay

class CustomNavigationViewController: UIViewController {
    var mainView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mainView == nil {
            mainView = Bundle.main.loadNibNamed("CarplayView", owner: self, options: nil)?.first as? UIView
            mainView?.frame = view.bounds
            if let mainViewUnwrapped = mainView {self.view.addSubview(mainViewUnwrapped)}
        }
    }
}
