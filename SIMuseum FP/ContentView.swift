//
//  ContentView.swift
//  SIMuseum
//
//  Created by Robert Nilsen on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
                // Brings different tab views to be opened on command from main view
        GeometryReader { geometry in
            ZStack {
                // Controls tab views
                switch viewRouter.currentPage {
                case .home:
                    ArticleListView()
                case .shop:
                    ShopView()
                case .ticket:
                    TicketView()
                case .donate:
                    DonateView()
                }
                
                VStack {
                    Header()
                        .frame(width: geometry.size.width, height: geometry.size.height/5)
                    Spacer()
                    Footer(viewRouter: viewRouter)
                        .frame(height: geometry.size.height/9)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct Header: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            HStack {
                Button(action: {
                    print("Menu")
                }) {
                    Image(systemName: "line.horizontal.3")
                }
                .accentColor(Color.primary)
                
                Spacer()
                
                Button(action: {
                    print("Home")
                }) {
                    Image(colorScheme == .dark ? "Logo" : "BWLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 28.0)
                }
                
                Spacer()
                
                Button(action: {
                    print("Search")
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .accentColor(Color.primary)
            }
            .padding()
            .background(.ultraThinMaterial)
            .shadow(color: Color.primary.opacity(0.2), radius: 8, x: 0, y: 0)
    }
}

struct Footer: View {

    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geometry in
            HStack {
                // Height and width variables
                let iconHeight = geometry.size.height/4
                let iconWidth = geometry.size.width/4.8
                
                // Tab icons
                TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: iconWidth, height: iconHeight, systemIconName: "house", tabName: "Home")
                TabBarIcon(viewRouter: viewRouter, assignedPage: .shop, width: iconWidth, height: iconHeight, systemIconName: "bag", tabName: "Shop")
                ZStack {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: geometry.size.width/6, height: geometry.size.width/6)
                        .shadow(radius: 4)
                    Circle().strokeBorder(colorScheme == .dark ? Color(UIColor.darkGray) : Color(UIColor.white), lineWidth: 2)
                        .frame(width: geometry.size.width/6, height: geometry.size.width/6)
                    Button(action: {
                        Unity.shared.show()
                    }) {
                        Image(systemName: "arkit")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/10 , height: geometry.size.width/10)
                            .foregroundColor(colorScheme == .dark ? Color(UIColor.lightGray) : Color(UIColor.gray))
                    }
                }
                .offset(y: -geometry.size.height/2)
                TabBarIcon(viewRouter: viewRouter, assignedPage: .ticket, width: iconWidth, height: iconHeight, systemIconName: "ticket", tabName: "Tickets")
                TabBarIcon(viewRouter: viewRouter, assignedPage: .donate, width: iconWidth, height: iconHeight, systemIconName: "heart", tabName: "Donate")
            }
            .background(.thinMaterial)
            .shadow(color: Color.primary.opacity(0.2), radius: 8, x: 0, y: 0)
        }
    }
    
    struct TabBarIcon: View {
        
        @StateObject var viewRouter: ViewRouter
        let assignedPage: Page
        
        let width, height: CGFloat
        let systemIconName, tabName: String

        var body: some View {
            VStack {
                Image(systemName: systemIconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.top, 10)
                    .scaledToFit()
                Text(tabName)
                    .font(.footnote)
                Spacer()
            }
                .padding(.horizontal, -4)
                .onTapGesture {
                    viewRouter.currentPage = assignedPage
                }
                .foregroundColor(viewRouter.currentPage == assignedPage ? Color.primary : .gray)
        }
    }
}

struct ArticleListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var data = DataService()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    ForEach(data.articleList) { article in
                        ArticleCell(article: article)
                    }
                    .padding([.trailing, .leading])
                }
                .padding(.top, 72)
                .disableAutocorrection(true)
                .onAppear(perform: fetchData)
                .listStyle(GroupedListStyle())
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(width: geometry.size.width)
                .background(colorScheme == .dark ? Color(UIColor.systemGray6) : Color.white)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    fetchData()
                }
            }
        }
    }
    func fetchData(){
        data.fetchData()
    }
}

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



struct DonateView: View {
    var body: some View {
        Text("Donate")
    }
}

struct ShopView: View {
    var body: some View {
        Text("Shop")
    }
}

struct TicketView: View {
    var body: some View {
        Text("Tickets")
    }
}

