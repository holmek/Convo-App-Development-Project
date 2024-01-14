import SwiftUI
import UIKit

struct NewFriendsView: View {
    // Questions array
    let questions = ["Hvordan fandt du ud af om dette sted / denne begivenhed?",
                     "Hvordan beskriver du din personlighed?",
                     "Hvad laver du for at slappe af?",
                     "Hvordan bruger du normalt din fritid?",
                     "Hvad er din yndlingsfilm?",
                     "Hvad er din yndlingsbog?",
                     "Hvad er din yndlingsmusikgenre eller kunstner?",
                     "Hvad er din yndlingsmad eller restaurant?",
                     "Har du nogen husdyr? Hvis ja, hvilken slags?",
                     "Hvad er din største frygt eller bekymring?",
                     "Hvad er din største ambition eller drøm?",
                     "Hvordan ville du beskrive din familiesituation?",
                     "Hvordan vil du beskrive dit forhold til dine forældre?",
                     "Hvordan vil du beskrive dit forhold til dine søskende?",
                     "Har du nogen hobbyer eller interesser, som du bruger meget tid på?",
                     "Hvad ville du gøre, hvis du vandt en stor sum penge?",
                     "Hvad er den mest spændende oplevelse, du nogensinde har haft?",
                     "Hvad ville du beskrive som din største styrke?",
                     "Hvad ville du beskrive som din største svaghed?",
                     "Hvad ville du sige er din største præstation hidtil?",
                     "Hvad ville du sige er dit største fejltagelse hidtil?",
                     "Hvad er din holdning til at rejse og opleve nye kulturer?",
                     "Hvad er din holdning til politik og samfundsproblemer?",
                     "Hvad vil du sige er din største udfordring lige nu?",
                     "Hvad vil du sige er din største glæde i livet?"]
    
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
                
                Text("Nye venner")
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

struct NewFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendsView()
    }
}
