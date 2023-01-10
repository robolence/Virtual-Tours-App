//
//  ViewRouter.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/4/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    // Default tab is home
    @Published var currentPage: Page = .home
    
}

// Define each tab type
enum Page {
     case home
     case shop
     case ticket
     case donate
}
