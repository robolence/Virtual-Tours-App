//
//  Article.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/2/22.
//  Based on SwiftSoup tutorial by Ege Sucu
//

import Foundation

// Define article object to be parsed from website HTML
struct Article: Identifiable, Hashable{
    let id = UUID().uuidString
    var title: String
    var blurb: String
    var secondTitle: String
    var imageURL: String
    var callToActionBlurb: String
    var url : URL?
 }
