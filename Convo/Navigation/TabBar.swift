//
//  TabBar.swift
//  Our Conversation
//
//  Created by Emil Holmgaard on 15/02/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "globe.europe.africa")
                        .foregroundColor(Color.white)
                    Text("Udforsk")
                        .foregroundColor(Color.white)
                }
            HomeView()
                .tabItem {
                    Image(systemName: "eye")
                        .foregroundColor(Color.white)
                    Text("View")
                        .foregroundColor(Color.white)
                }
        }
        .accentColor(.white)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
