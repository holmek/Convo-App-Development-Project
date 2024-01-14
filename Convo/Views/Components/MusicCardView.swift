//
//  FriendsCardView.swift
//  Our Conversation
//
//  Created by Emil Holmgaard on 15/02/2023.
//

import SwiftUI

struct MusicCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Musik")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .gradientForeground(colors: [.pink, .yellow])
            Text("100 Spørgsmål")
                .fontWeight(.semibold)
                .gradientForeground(colors: [.pink, .yellow])
                .font(.footnote)
                .multilineTextAlignment(.leading)
            Text("Debatter om musik fremmer kreativitet, kulturudveksling, identitet og personlig smag")
                .fontWeight(.semibold)
                .gradientForeground(colors: [.pink, .yellow])
                .font(.body)
                .multilineTextAlignment(.leading)
        }
        .foregroundColor(Color.white)
        .padding(20)
        .frame(width: 252, height: 190)
        .background(Color(hue: 0.678, saturation: 0.0, brightness: 0.116))
        .cornerRadius(20)
    }
}

struct MusicCardView_Previews: PreviewProvider {
    static var previews: some View {
        MusicCardView()
    }
}
