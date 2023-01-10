//
//  SlideshowData.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/4/22.
//

import Foundation

struct slideshowImages: Identifiable, Hashable{
    let id = UUID().uuidString
    var imageURL: String
 }

