//
//  ViewController.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/2/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @StateObject var viewRouter = ViewRouter()
    @ObservedObject var data = DataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIHostingController(rootView: ContentView(viewRouter: self.viewRouter))
        addChild(vc)
        vc.view.frame = self.view.frame
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        data.fetchData()
    }
}

