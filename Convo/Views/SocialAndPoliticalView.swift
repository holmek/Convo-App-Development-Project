import SwiftUI
import UIKit

struct SocialAndPoliticalView: View {
    // Questions array
    let questions = ["Bør der være begrænsninger på ytringsfriheden?",
                     "Bør sociale medieplatforme have magten til at regulere indhold?",
                     "Bør der være begrænsninger på kampagneudgifter i politiske valg?",
                     "Bør regeringen yde en garanteret grundindkomst til alle borgere?",
                     "Bør affirmative action-programmer implementeres for at tackle historisk diskrimination?",
                     "Bør der være tidsbegrænsninger for valgte embedsmænd?",
                     "Bør politiske kandidater være forpligtede til at offentliggøre deres skatteoplysninger?",
                     "Bør der være strammere våbenkontrollove?",
                     "Bør dødsstraffen afskaffes?",
                     "Bør ulovlige indvandrere have en vej til statsborgerskab?",
                     "Bør sundhedspleje være en universel rettighed?",
                     "Bør mindstelønnen hæves?",
                     "Bør USA gå over til et system med en enkelt betaler for sundhedspleje?",
                     "Bør regeringen regulere prisen på receptpligtig medicin?",
                     "Bør private fængsler forbydes?",
                     "Bør stemmevotering være obligatorisk?",
                     "Bør rekreativ marihuana legaliseres?",
                     "Bør regeringen finansiere kunstprogrammer?",
                     "Bør gymnasie-atleter betales?",
                     "Bør militærbudgettet reduceres?",
                     "Bør USA have en militærudskrivning?",
                     "Bør USA trække sig tilbage fra internationale organisationer som De Forenede Nationer?",
                     "Bør regeringen regulere brugen af ansigtsgenkendelsesteknologi?",
                     "Bør offentlige skoler privatiseres?"]
    
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
                
                Text("Social & politisk")
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

struct SocialAndPoliticalView_Previews: PreviewProvider {
    static var previews: some View {
        SocialAndPoliticalView()
    }
}
