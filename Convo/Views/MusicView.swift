import SwiftUI
import UIKit

struct MusicView: View {
    // Questions array
    let questions = ["Hvordan har internettet og sociale medier påvirket den måde, vi opdager og forbruger musik på?",
                     "Hvad er musikkens rolle i at udtrykke og udforske menneskelig seksualitet?",
                     "Kan musik overskride sprog- og kulturelle barrierer?",
                     "Hvordan adskiller kompositionsprocessen sig på tværs af genrer og kulturer?",
                     "Hvordan er oplevelsen af at lytte til live musik i forhold til indspillet musik?",
                     "Kan musik bruges til at håndtere og bearbejde sorg og tab?",
                     "Hvad er musikkens rolle i at forme personlig identitet?",
                     "Hvordan balancerer musikere kommerciel succes med kunstnerisk integritet?",
                     "Hvad er musikkens indvirkning på miljøet og klimaændringer?",
                     "Kan musik betragtes som en form for aktivisme eller samfundskommentar?",
                     "Hvordan påvirker musik vores følelse af fællesskab og tilhørsforhold?",
                     "Hvad er forholdet mellem musik og mental sundhed?",
                     "Kan musik bruges til at forbedre kognitive evner og læring?",
                     "Hvordan krydser musik med teknologi i skabelses- og produktionsprocessen?",
                     "Hvad er virkningen af musikcensur og ytringsfrihed?",
                     "Hvordan udvikler musiksmag og præferencer sig over tid?",
                     "Kan musik fungere som et værktøj til konfliktløsning og fredsopbygning?",
                     "Hvad er musikkens rolle i at forme politiske ideologier og propaganda?",
                     "Hvordan navigerer musikere spændingen mellem kommerciel succes og kunstnerisk udtryk?",
                     "Hvordan krydser musik med andre kulturelle former, såsom mode og film?",
                     "Kan musik betragtes som en form for åndelig praksis eller tilbedelse?",
                     "Hvad er virkningen af musikfestivaler og store koncerter på samfundet og miljøet?",
                     "Hvordan krydser musik med spørgsmål om race, køn og social retfærdighed?",
                     "Kan musik bruges til at lette intergenerationelle forbindelser og forståelse?",
                     "Hvad er musikkens rolle i at forme og bevare kulturarv og traditioner?"]
    
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
                
                Text("Musik")
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

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
