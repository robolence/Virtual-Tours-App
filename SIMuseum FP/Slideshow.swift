//
//  Slideshow.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/4/22.
//

import SwiftUI

struct Slideshow: View {
    
    var image: slideshowImages
    
    var body: some View {
            AsyncImage(url: URL(string: "\(image.imageURL)")) { image in image
                    .resizable()
                    .frame(width: .infinity)
            } placeholder: {
                ProgressView()
        }
    }
}
