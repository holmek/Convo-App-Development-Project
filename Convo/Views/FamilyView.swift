import SwiftUI
import UIKit

struct FamilyView: View {
    // Questions array
    let questions = ["Hvad betyder familie for dig?",
                     "Hvem er de vigtigste personer i din familie?",
                     "Hvordan definerer du en \"tæt knyttet\" familie?",
                     "Hvilke udfordringer står familier typisk overfor?",
                     "Hvordan opretholder du et sundt forhold til familiemedlemmer?",
                     "Har du nogensinde haft et fald ud med et familiemedlem? I så fald, hvordan håndterede du det?",
                     "Hvordan navigerer du i konflikter i familien?",
                     "Hvad er den vigtigste lektion, du har lært af din familie?",
                     "Hvordan skaber du en følelse af tilhørsforhold inden for din familie?",
                     "Synes du, det er vigtigt at tilbringe helligdage med familien? Hvorfor eller hvorfor ikke?",
                     "Hvilke traditioner har din familie?",
                     "Hvordan balancerer du behovene i din familie med dine egne personlige behov?",
                     "Hvad er den sværeste beslutning, du har truffet for din familie?",
                     "Hvordan håndterer du uenigheder med din partner om, hvordan I skal opdrage jeres børn?",
                     "Hvilken rolle spiller den udvidede familie i dit liv?",
                     "Hvad er nogle måder at styrke båndene mellem familiemedlemmer på?",
                     "Hvordan støtter du familiemedlemmer, der gennemgår svære tider?",
                     "Hvordan skaber du positive minder med din familie?",
                     "Hvad er den største udfordring, du har stået overfor som forælder?",
                     "Hvad er nogle almindelige misforståelser om familier?",
                     "Hvordan skaber du en følelse af enhed inden for din familie?",
                     "Hvad er dit tidligste minde om din familie?",
                     "Hvordan fejrer du milepæle inden for din familie?",
                     "Hvordan håndterer du konflikter mellem søskende?",
                     "Hvordan har din familie påvirket, hvem du er i dag?"]
    
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

struct FamilyView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
