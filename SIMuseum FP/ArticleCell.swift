//
//  ArticleCell.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/2/22.
//  Based on SwiftSoup tutorial by Ege Sucu
//

import SwiftUI

struct ArticleCell: View {
    
    @Environment(\.colorScheme) var colorScheme
    var article: Article
    
    // Outputs a block for every HTML block from website
    var body: some View {
        HStack {
            VStack{
                // Article Image
                AsyncImage(url: URL(string: "\(article.imageURL)")) { image in image
                        .resizable()
                        .frame(width: .infinity)
                        .scaledToFill()
                    
                } placeholder: {
                    Color.gray
                }
                .onTapGesture {
                    if let url = article.url{
                        UIApplication.shared.open(url)
                    }
                }
                
                // Article Secondary Title
                Text(article.secondTitle.uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .thin))
                    .textSelection(.enabled)
                
                // Article Primary Title
                Text(article.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 45, weight: .bold))
                    .padding([.bottom], 25)
                    .textSelection(.enabled)
                    .onTapGesture {
                        if let url = article.url{
                            UIApplication.shared.open(url)
                        }
                    }
                
                // Article Text
                Text(article.blurb)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom], 25)
                    .textSelection(.enabled)
                
                // Call to action button for miscellaneous actions (relating back to website)
                HStack {
                    Button(action: {
                        if let url = article.url{
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("\(article.callToActionBlurb)")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        
                    }
                    .padding()
                    .background(Color.primary)
                    .cornerRadius(40)
                    
                    Spacer()
                    
                    // Option to share (built in Swift)
                    ShareLink(item: article.url!) {
                        Image(systemName: "paperplane")
                        .foregroundColor(Color.primary)
                    }
                }
                .padding([.bottom], 25)
            }
        }
    }
}
