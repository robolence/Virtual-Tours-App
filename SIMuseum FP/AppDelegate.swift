//
//  AppDelegate.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/2/22.
//

import SwiftUI
import UIKit

struct SIMuseumApp: App {
    @StateObject var viewRouter = ViewRouter()
    @Environment(\.scenePhase) var scenePhase
    
    // App opens to ContentView()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
    
    // Unity utilizes ContentView to initialize environment
    @main
    class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

            Unity.shared.setHostMainWindow(window)

            return true
        }
    }

}

