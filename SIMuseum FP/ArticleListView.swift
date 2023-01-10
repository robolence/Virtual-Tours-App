//
//  ArticleListView.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/2/22.
//  Based on SwiftSoup tutorial by Ege Sucu
//

import SwiftUI

struct ArticleListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var data = DataService()
    @ObservedObject var dataSlideshow = SlideshowDataService()
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    @State private var currentIndex = 0
    @State var count = 3
    
    var body: some View {
        GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        TabView(selection: $currentIndex) {
                            ForEach(dataSlideshow.slideshowList, id: \.self) { slideshowImages in
                                Slideshow(image: slideshowImages)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .padding([.top], 60)
                        .frame(height: 275)
                        .onReceive(timer, perform: { _ in
                            withAnimation {
                                currentIndex = currentIndex < count ? count + 1 : 0
                            }
                        })
                            
                            
                        }
                        VStack {
                            Text("NOW ON VIEW FROM YOUR DEVICE")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 20, weight: .thin))
                                .padding(.leading)
                                .textSelection(.enabled)
                                .foregroundColor(Color.primary)
                            Text("Yes, And")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 45, weight: .bold))
                                .padding(.leading)
                                .textSelection(.enabled)
                                .foregroundColor(Color.primary)
                            
                            HStack {
                                Button(action: {
                                    Unity.shared.show()
                                }) {
                                    Text("Launch VR Simulator")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                    
                                }
                                .padding()
                                .background(Color.primary)
                                .cornerRadius(40)
                                
                                Spacer()
                            }
                            .padding([.leading])
                        }
                        .padding([.bottom], 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                        ForEach(data.articleList) { article in
                            ArticleCell(article: article)
                        }
                        .padding([.trailing, .leading])
                    }
                    .disableAutocorrection(true)
                    .onAppear(perform: fetchData)
                    .onAppear(perform: fetchSlideshowImages)
                    .listStyle(GroupedListStyle())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(width: geometry.size.width)
                    .background(colorScheme == .dark ? Color(UIColor.systemGray6) : Color.white)
            }
        }
        func fetchData(){
            data.fetchArticles()
        }
        
        func fetchSlideshowImages(){
            dataSlideshow.fetchSlideshowImages()
    }
}
