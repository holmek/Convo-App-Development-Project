import SwiftUI
import UIKit

struct PrimarySchoolView: View {
    // Questions array
    let questions = ["Hvad er dine bedste minder fra folkeskolen?",
                     "Hvilke fag eller aktiviteter var du mest interesseret i i folkeskolen?",
                     "Hvordan har folkeskolen påvirket din personlige vækst og udvikling?",
                     "Hvordan oplevede du din relation til lærerne og de andre elever i folkeskolen?",
                     "Hvordan var din motivation for at lære og deltage aktivt i undervisningen i folkeskolen?",
                     "Hvordan påvirkede folkeskolen dine fremtidsplaner eller karriereambitioner?",
                     "Hvilke udfordringer oplevede du i folkeskolen, og hvordan overvandt du dem?",
                     "Hvordan har folkeskolen hjulpet dig med at opdage dine interesser eller passioner?",
                     "Hvordan har folkeskolen hjulpet dig med at forberede dig på videreuddannelse eller arbejdsmarkedet?",
                     "Hvordan har du håndteret konflikter eller vanskelige situationer med andre elever eller lærere i folkeskolen?",
                     "Hvordan har folkeskolen ændret dine holdninger eller synspunkter om forskellige emner?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine kreative og intellektuelle evner?",
                     "Hvordan har folkeskolen påvirket dit syn på dig selv og din selvtillid?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine sociale færdigheder og evnen til at samarbejde med andre?",
                     "Hvordan har folkeskolen påvirket dit syn på uddannelse og læring generelt?",
                     "Hvordan har folkeskolen hjulpet dig med at forstå og håndtere forskellige kulturelle eller sociale perspektiver?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine kommunikationsfærdigheder?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine problemløsningsfærdigheder?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine kritiske tænkefærdigheder?",
                     "Hvordan har folkeskolen påvirket dit syn på samfundet og din rolle i det?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine digitale færdigheder?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine researchfærdigheder?",
                     "Hvordan har folkeskolen hjulpet dig med at udvikle dine evner til at lære og anvende viden på tværs af forskellige fagområder?",
                     "Hvordan har folkeskolen hjulpet dig med at forstå og håndtere forskellige former for stress eller pres?"]
    
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
                
                Text("Folkeskole")
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

struct PrimarySchoolView_Previews: PreviewProvider {
    static var previews: some View {
        PrimarySchoolView()
    }
}
