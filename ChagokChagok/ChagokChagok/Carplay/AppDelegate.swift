//
//  AppDelegate.swift
//  ChagokChagok
//
//  Created by LeeJiSoo on 2022/06/18.
//  Copyright © 2018 Sander van Tulden. All rights reserved.
//

import UIKit
import Combine
import CarPlay

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CPApplicationDelegate, CPMapTemplateDelegate {
    private var cancellable: AnyCancellable!
    var carWindow: CPWindow?
    var interfaceController: CPInterfaceController?
    var mapTemplate: CPMapTemplate?
    var window: UIWindow?

    func application(_ application: UIApplication, didConnectCarInterfaceController interfaceController: CPInterfaceController, to window: CPWindow) {
        print("[CARPLAY] 카플레이 연결 성공")

        self.interfaceController = interfaceController
        self.carWindow = window
        print("[CARPLAY] cpmaptemplate 만드는중")
        
        let mapTemplate = createTemplate()
        mapTemplate.mapDelegate = self
        
        self.mapTemplate = mapTemplate
        interfaceController.setRootTemplate(mapTemplate, animated: true)
        window.rootViewController = CustomNavigationViewController()

    }
    
    func application(_ application: UIApplication, didDisconnectCarInterfaceController interfaceController: CPInterfaceController, from window: CPWindow) {
        print("[CARPLAY] DISCONNECTED FROM CARPLAY!")
    }

    func createTemplate() -> CPMapTemplate {
        let mapTemplate = CPMapTemplate()
        let searchBarButton = createBarButton(.record)
        
        mapTemplate.leadingNavigationBarButtons = [searchBarButton]
        mapTemplate.automaticallyHidesNavigationBar = false
        return mapTemplate
    }

    enum BarButtonType: String {
        case record = "🖍 기록하기"
    }

    private func createBarButton(_ type: BarButtonType) -> CPBarButton {
        let barButton = CPBarButton(type: .text) { (button) in
            print("[CARPLAY] \(button.title ?? "_") tapped")
            var carplayClick = 1
            print("[전달해야할 변수] \(carplayClick)")
        }

        barButton.title = type.rawValue
        return barButton
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
}
