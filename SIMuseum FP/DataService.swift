//
//  DataService.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/2/22.
//  Based on SwiftSoup tutorial by Ege Sucu
//

import Foundation
import SwiftSoup

class DataService: ObservableObject{
    
    // Defines articleList for each article of block variables
    @Published var articleList = [Article]()
    
    // Website from which HTML will be fetched
    let baseURL = URL(string: "https://www.statenislandmuseum.org/")
    
    func fetchData(){
        articleList.removeAll()
        // SwiftSoup uses do + catch to grab HTML & parse
        do {
                // Defines HTML variable with the html content from the museum website
                let html = try String(contentsOf: baseURL!, encoding: String.Encoding.ascii)
                // Allows html to be parsed from document variable
                let document: Document = try SwiftSoup.parse(html)
                
                // Grabs and indexes each block from content portion of website & creates array
                let homepage = try document.getElementsByClass("home-page-blocks").select("div.block")
                
                // Grabs specific instances of elements (title, text, etc.)
                for block in homepage{
                    let title = try block.select("h2.header").first()?.text(trimAndNormaliseWhitespace: true) ?? ""
                    let secondTitle = try block.select("div.mini_header").first()?.text(trimAndNormaliseWhitespace: true) ?? ""
                    let blurb = try block.select("p.blurb").first()?.text(trimAndNormaliseWhitespace: true) ?? ""
                    // img.primary-image
                    let imageBlock: Element = try block.select("img.primary-image").first()!
                    let imageURL: String = try imageBlock.attr("src")
                    
                    let callToActionBlurb = try block.select("button").first()?.text(trimAndNormaliseWhitespace: true) ?? ""
                    
                    guard let baseURL = baseURL
                    
                    else {
                        return
                    }
                    
                    let url = try baseURL.appendingPathComponent(block.select("a").attr("href")
                        // Adds extension of block to base URL path
                        .replacingOccurrences(of: "https://www.statenislandmuseum.org/", with: ""))
                    
                    // Inputs all values into [Article], each set grouped into a "post"
                    let post = Article(title: title, blurb: blurb, secondTitle: secondTitle, imageURL: imageURL, callToActionBlurb: callToActionBlurb, url: url)
                    self.articleList.append(post)
                }
                
            } catch let error {
                print(error)
        }
    }
}

struct Article: Identifiable, Hashable{
    let id = UUID().uuidString
    var title: String
    var blurb: String
    var secondTitle: String
    var imageURL: String
    var callToActionBlurb: String
    var url : URL?
 }

struct slideshowImages: Identifiable, Hashable{
    let id = UUID().uuidString
    var imageURL: String
 }

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
