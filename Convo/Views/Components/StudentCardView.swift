//
//  FriendsCardView.swift
//  Our Conversation
//
//  Created by Emil Holmgaard on 15/02/2023.
//

import SwiftUI

struct StudentCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Studie")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .gradientForeground(colors: [.red, .pink])
            Text("100 Spørgsmål")
                .fontWeight(.semibold)
                .gradientForeground(colors: [.red, .pink])
                .font(.footnote)
                .multilineTextAlignment(.leading)
            Text("Debatter om studier fremmer perspektiver, udfordrer ideer og beslutningsprocesser")
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

struct StudentCardView_Previews: PreviewProvider {
    static var previews: some View {
        StudentCardView()
    }
}
