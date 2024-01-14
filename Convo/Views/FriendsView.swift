import SwiftUI
import UIKit

struct FriendsView: View {
    // Questions array
    let questions = ["Hvad betyder venskab for dig?",
                     "Hvordan skaber du venskaber?",
                     "Hvilke egenskaber leder du efter hos en ven?",
                     "Hvad er den vigtigste del af et stærkt venskab?",
                     "Hvordan vedligeholder du et venskab over tid?",
                     "Hvad er fordelene ved at have tætte venner?",
                     "Hvordan håndterer du konflikter med dine venner?",
                     "Hvad er dit favoritminde med en ven?",
                     "Hvordan har teknologien ændret den måde, vi skaber og vedligeholder venskaber på?",
                     "Hvilken rolle spiller sociale medier i dine venskaber?",
                     "Kan venner nogensinde blive romantiske partnere?",
                     "Hvordan ved du, hvornår det er tid til at afslutte et venskab?",
                     "Hvad ville du gøre, hvis din bedste ven havde en negativ indflydelse på dit liv?",
                     "Hvordan påvirker venskaber dit mentale velvære?",
                     "Hvordan kan du støtte en ven, der har det svært?",
                     "Hvordan kan du opbygge et venskab med nogen, der har en helt anden baggrund end dig?",
                     "Hvordan kan du opretholde et venskab på tværs af geografiske afstande?",
                     "Hvordan håndterer du jalousi mellem venner?",
                     "Hvad er de største udfordringer ved at have tætte venskaber?",
                     "Hvordan kan du forhindre, at venskaber bliver for overfladiske?",
                     "Hvordan kan du hjælpe en ven med at komme igennem en svær tid?",
                     "Hvordan kan du være en bedre ven for dem omkring dig?",
                     "Hvordan kan du udvikle nye venskaber som voksen?",
                     "Hvordan kan du bedst støtte en ven, der går igennem en krise?",
                     "Hvordan kan du undgå at såre dine venner?",
                     "Hvad er din favoritaktivitet at lave med venner?"]
    
    // Current question state
    @State private var currentQuestion = ""
    
    // Current category state
    @State private var currentCategory = "Questions"
    
    // Number of questions asked
    @State private var questionCount = 0
    
    // Presentation mode
    @Environment(\.presentationMode) var presentationMode
    
    // Show "Tryk på skærmen" text
    @State private var showTapText = true
    
    // Impact feedback generator
    let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            // Background color
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Venner")
                    .font(.title)
                    .fontWeight(.semibold)
                    .gradientForeground(colors: [.pink, .yellow])
                    .padding([.leading, .bottom, .trailing])
                
                // Number of questions asked
                if showTapText {
                    Text(" \(questionCount)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .gradientForeground(colors: [.pink, .yellow])
                }
                
                Spacer()
                
                // Question text
                Text(currentQuestion)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .gradientForeground(colors: [.pink, .yellow])
                    .padding(.all, 60.0)
                    .cornerRadius(10)
                
                Spacer()
                
                // Show "Tryk på skærmen" text for 4 seconds
                if showTapText {
                    Text("Tryk på skærmen")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .gradientForeground(colors: [.pink, .yellow])
                }
                
                // Button to dismiss the view
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "globe.europe.africa")
                        .font(.headline)
                        .gradientForeground(colors: [.pink, .yellow])
                        .padding()
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.107))
                        .clipShape(Circle())
                })
                .padding(.top, 16)
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)
                
            }
        }
        .onTapGesture {
            // Select a random question and update the state
            currentQuestion = questions.randomElement() ?? "No question available"
            questionCount += 1
            
            // Show "Tryk på skærmen" text again
            withAnimation {
                showTapText = true
            }
            
            // Give haptic feedback
            impactGenerator.impactOccurred()
            
            // Hide "Tryk på skærmen" text after 4 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showTapText = false
                }
            }
        }
        .onAppear {
            // Select a random question when the view appears and update the state
            currentQuestion = questions.randomElement() ?? "No question available"
            questionCount = 1
            
            // Hide "Tryk på skærmen" text after 4 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showTapText = false
            }
        }
        .navigationBarHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
