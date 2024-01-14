//
//  FriendsCardView.swift
//  Our Conversation
//
//  Created by Emil Holmgaard on 15/02/2023.
//

import SwiftUI

struct MentalHealthCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Mental Helbred")
                .font(.title3)
                .fontWeight(.semibold)
                .gradientForeground(colors: [.red, .pink])
                .multilineTextAlignment(.leading)
            Text("100 Spørgsmål")
                .fontWeight(.semibold)
                .gradientForeground(colors: [.red, .pink])
                .font(.footnote)
                .multilineTextAlignment(.leading)
            Text("Snakke om mental sundhed fremmer forståelse, inklusion, støtte og åbenhed")
                .fontWeight(.semibold)
                .gradientForeground(colors: [.red, .pink])
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

struct MentalHealthCardView_Previews: PreviewProvider {
    static var previews: some View {
        MentalHealthCardView()
    }
}
