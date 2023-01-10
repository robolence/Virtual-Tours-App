//
//  SlideshowDataService.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/4/22.
//

import Foundation
import SwiftSoup

class SlideshowDataService: ObservableObject{
    
    // Defines articleList for each article of block variables
    @Published public var slideshowList = [slideshowImages]()
    // Website from which HTML will be fetched
    let baseURL = URL(string: "https://www.statenislandmuseum.org/")
    
    
    func fetchSlideshowImages(){
        slideshowList.removeAll()

            // SwiftSoup uses do + catch to grab HTML & parse
            do {
                // Defines HTML variable with the html content from the museum website
                let html = try String(contentsOf: baseURL!, encoding: String.Encoding.ascii)
                // Allows html to be parsed from document variable
                let document: Document = try SwiftSoup.parse(html)
                
                // Grabs and indexes each block from content portion of website & creates array
                let header = try document.getElementsByClass("full-width-hero-wrapper").select("div.carousel-cell")
                
                // Grabs specific instances of elements (title, text, etc.)
                for img in header{
                    // img.primary-image
                    let imageBlock: Element = try img.select("img").first()!
                    let imageURL: String = try imageBlock.attr("src")
                    
                    // Inputs all values into [Article], each set grouped into a "post"
                    let image = slideshowImages(imageURL: imageURL)
                    self.slideshowList.append(image)
                }
                
            } catch let error {
                print(error)
            }
        }
        
    }

