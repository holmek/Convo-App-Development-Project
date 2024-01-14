import SwiftUI
import UIKit

struct MentalHealthView: View {
    // Questions array
    let questions = ["Hvordan påvirker stigmatisering af mental sundhed personer, der søger behandling?",
                     "Hvad er de langsigtede virkninger af barndomstraumer på mental sundhed?",
                     "Hvordan påvirker sociale medier mental sundhed?",
                     "Hvordan kan kulturelle forskelle påvirke diagnoser og behandling af mental sundhed?",
                     "Hvad er forbindelsen mellem fysisk sundhed og mental sundhed?",
                     "Hvordan kan mental sundhed påvirkes af økonomiske stressfaktorer?",
                     "Hvordan kan samfundet bedre støtte personer med mentale sundhedsproblemer?",
                     "Hvad er de mest effektive former for terapi til behandling af mentale sundhedsproblemer?",
                     "Hvordan kan personer med mentale sundhedsproblemer håndtere stigmatiseringen forbundet med deres tilstand?",
                     "Hvordan kan mental sundhed påvirkes af arbejdsrelaterede stressfaktorer?",
                     "Hvilken rolle spiller genetik i udviklingen af mentale sundhedsproblemer?",
                     "Hvordan kan kost og motion påvirke mental sundhed?",
                     "Hvordan kan søvnmønstre påvirke mental sundhed?",
                     "Hvad er forholdet mellem stofmisbrug og mentale sundhedsproblemer?",
                     "Hvordan kan personer støtte deres kære med mentale sundhedsproblemer?",
                     "Hvordan påvirker kulturelle og samfundsmæssige holdninger måden, hvorpå mentale sundhedsproblemer opfattes og behandles?",
                     "Hvordan kan personer genkende tegn på en mental sundhedskrise hos sig selv eller andre?",
                     "Hvad er de potentielle langsigtede virkninger af ubehandlede mentale sundhedsproblemer?",
                     "Hvordan kan personer få adgang til overkommelig mental sundhedspleje?",
                     "Hvordan kan mentale sundhedsproblemer påvirke relationer med andre?",
                     "Hvordan kan personer udvikle mestringstrategier til at håndtere symptomer på mentale sundhedsproblemer?",
                     "Hvad er forbindelsen mellem barndomsoplevelser og udviklingen af mentale sundhedsproblemer senere i livet?",
                     "Hvordan kan personer skabe støttende fællesskaber for at fremme mental sundhed?",
                     "Hvordan kan personer navigere i det komplekse system for mental sundhedspleje?",
                     "Hvordan kan personer opbygge modstandsdygtighed og fremme mental velvære i ansigtet af modgang?"]
    
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
                
                Text("Mentalt Helbred")
                    .font(.title)
                    .fontWeight(.semibold)
                    .gradientForeground(colors: [.red, .pink])
                    .padding([.leading, .bottom, .trailing])
                
                // Number of questions asked
                if showTapText {
                    Text(" \(questionCount)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .gradientForeground(colors: [.red, .pink])
                }
                
                Spacer()
                
                // Question text
                Text(currentQuestion)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .gradientForeground(colors: [.red, .pink])
                    .padding(.all, 60.0)
                    .cornerRadius(10)
                
                Spacer()
                
                // Show "Tryk på skærmen" text for 4 seconds
                if showTapText {
                    Text("Tryk på skærmen")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .gradientForeground(colors: [.red, .pink])
                }
                
                // Button to dismiss the view
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "globe.europe.africa")
                        .font(.headline)
                        .gradientForeground(colors: [.red, .pink])
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

struct MentalHealthView_Previews: PreviewProvider {
    static var previews: some View {
        MentalHealthView()
    }
}
