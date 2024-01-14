import SwiftUI
import UIKit

struct RelationshipView: View {
    // Questions array
    let questions = ["Hvad er nogle af de ting, du sætter pris på ved din partner, og hvorfor?",
                     "Hvad er de største udfordringer, I har haft i jeres forhold, og hvordan har I arbejdet på at overvinde dem?",
                     "Hvordan kan I bedst støtte hinanden i jeres individuelle mål og drømme?",
                     "Hvad er jeres fælles passioner, og hvordan kan I udforske dem sammen?",
                     "Hvordan kan I kommunikere bedre og undgå misforståelser?",
                     "Hvordan kan I styrke jeres tillid og åbenhed overfor hinanden?",
                     "Hvad er jeres yndlingsaktivitet at gøre sammen, og hvorfor elsker I det så meget?",
                     "Hvad er jeres kærlighedssprog, og hvordan kan I bruge det til at styrke jeres forhold?",
                     "Hvordan kan I fejre hinandens succeser og milepæle på den bedste måde?",
                     "Hvordan kan I arbejde på at være mere til stede og opmærksomme, når I er sammen?",
                     "Hvordan kan I lære at være mere tålmodige og forstående overfor hinanden?",
                     "Hvordan kan I undgå at lade små uenigheder og irritationer påvirke jeres forhold?",
                     "Hvad er nogle af jeres fælles mål for jeres forhold, og hvordan kan I arbejde på at nå dem sammen?",
                     "Hvordan kan I styrke jeres fysisk og emotionel intimitet?",
                     "Hvordan kan I navigere og tackle jalousi eller usikkerhed i jeres forhold?",
                     "Hvordan kan I finde en balance mellem jeres individuelle liv og jeres liv som et par?",
                     "Hvad er noget, du ønsker, din partner vidste om dig, som du endnu ikke har delt?",
                     "Hvad er noget, din partner har sagt eller gjort, der har gjort en stor indvirkning på dig?",
                     "Hvad er den bedste oplevelse, I har haft sammen, og hvorfor var det så mindeværdigt?",
                     "Hvordan kan I håndtere uenigheder og konflikter på den bedste måde?",
                     "Hvad er nogle af de små ting, du gør for din partner, der betyder meget for dem?",
                     "Hvordan kan I undgå at tage hinanden for givet og i stedet sætte pris på hinanden hver dag?",
                     "Hvordan kan I lære af jeres tidligere forhold og bruge det til at styrke jeres nuværende forhold?",
                     "Hvad er jeres drømme for fremtiden, og hvordan kan I arbejde sammen for at opnå dem?",
                     "Hvad er noget, du er bange for at dele med din partner, og hvorfor?"]
    
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
                
                Text("Kærester")
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

struct RelationshipView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipView()
    }
}
