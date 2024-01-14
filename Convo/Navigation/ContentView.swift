//
//  ContentView.swift
//  Our Conversation
//
//  Created by Emil Holmgaard on 14/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showSlideView = !UserDefaults.standard.bool(forKey: "hasSeenSlideView")
    
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
