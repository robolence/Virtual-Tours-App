//
//  TabFooterView.swift
//  SIMuseum FP
//
//  Created by Robert Nilsen on 12/5/22.
//

// PAGE IS NOT INCLUDED UNTIL I CAN DEBUG WHY IT DOESNT WORK, IT'S INCLUDED IN CONTENTVIEW()

//import SwiftUI
//
//struct TabFooterView: View {
//
//    @Environment(\.colorScheme) var colorScheme
//    @StateObject var viewRouter: ViewRouter
//
//    var body: some View {
//        GeometryReader { geometry in
//            HStack {
//                TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "house", tabName: "Home")
//                TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "bag", tabName: "Shop")
//                ZStack {
//                    Circle()
//                        .fill(.ultraThinMaterial)
//                        .frame(width: geometry.size.width/6, height: geometry.size.width/6)
//                        .shadow(radius: 4)
//                    Circle().strokeBorder(colorScheme == .dark ? Color(UIColor.darkGray) : Color(UIColor.white), lineWidth: 2)
//                        .frame(width: geometry.size.width/6, height: geometry.size.width/6)
//                    Button(action: {
//                        Unity.shared.show()
//                    }) {
//                        Image(systemName: "arkit")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: geometry.size.width/10 , height: geometry.size.width/10)
//                            .foregroundColor(colorScheme == .dark ? Color(UIColor.lightGray) : Color(UIColor.gray))
//                    }
//                }
//                .offset(y: -geometry.size.height/8/2)
//                TabBarIcon(viewRouter: viewRouter, assignedPage: .records, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "ticket", tabName: "Tickets")
//                TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "Donate")
//            }
//            .frame(width: geometry.size.width, height: geometry.size.height/8, alignment: .bottom)
//            .background(.ultraThinMaterial)
//            .shadow(color: Color.primary.opacity(0.2), radius: 8, x: 0, y: 0)
//        }
//    }
//}
//
//    struct TabBarIcon: View {
//
//        @StateObject var viewRouter: ViewRouter
//        let assignedPage: Page
//
//        let width, height: CGFloat
//        let systemIconName, tabName: String
//
//        var body: some View {
//            VStack {
//                Image(systemName: systemIconName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: width, height: height)
//                    .padding(.top, 10)
//                    .scaledToFit()
//                Text(tabName)
//                    .font(.footnote)
//                Spacer()
//            }
//            .padding(.horizontal, -4)
//            .onTapGesture {
//                viewRouter.currentPage = assignedPage
//            }
//            .foregroundColor(viewRouter.currentPage == assignedPage ? Color.primary : .gray)
//        }
//    }
