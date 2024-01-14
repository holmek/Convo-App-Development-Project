import SwiftUI
import UIKit

struct BestFriendsView: View {
    // Questions array
    let questions = ["Hvordan har vi mødt hinanden, og hvad gjorde, at vi blev bedste venner?",
                      "Hvordan beskriver du vores venskab, og hvad betyder det for dig?",
                      "Hvad er den bedste oplevelse, vi har haft sammen, og hvorfor var det så mindeværdigt?",
                      "Hvordan ser du på vores forhold, og hvad vil du gerne have, at det udvikler sig til?",
                      "Hvordan vil du beskrive mig til en person, der ikke kender mig?",
                      "Hvordan kan vi støtte hinanden bedst, når vi har brug for det?",
                      "Hvordan kan vi kommunikere bedre og undgå misforståelser?",
                      "Hvordan håndterer vi uenigheder og konflikter på den bedste måde?",
                      "Hvad er din største bekymring i vores forhold, og hvordan kan vi tackle den?",
                      "Hvordan kan vi have det sjovt og skabe gode minder sammen?",
                      "Hvordan kan vi hjælpe hinanden med at nå vores individuelle mål og drømme?",
                      "Hvad kan vi lære af hinanden, og hvordan kan vi hjælpe hinanden med at vokse som personer?",
                      "Hvad er noget, du gerne vil sige til mig, men som du måske ikke har haft mod til at sige før?",
                      "Hvad er det bedste råd, du nogensinde har fået, og hvordan kan vi anvende det i vores forhold?",
                      "Hvad er det mest overraskende, du har lært om mig, siden vi blev bedste venner?",
                      "Hvordan kan vi styrke vores tillid og åbenhed overfor hinanden?",
                      "Hvordan kan vi hjælpe hinanden med at blive mere selvsikre og modstandsdygtige?",
                      "Hvordan kan vi fejre hinandens succeser og milepæle på den bedste måde?",
                      "Hvad er vores fælles passioner, og hvordan kan vi udforske dem sammen?",
                      "Hvad er noget, som du beundrer ved mig, og hvordan kan jeg arbejde på at udvikle det yderligere?",
                      "Hvad er vores yndlingsaktivitet at gøre sammen, og hvorfor elsker vi det så meget?",
                      "Hvad er vores mest mindeværdige rejseoplevelse, og hvad gjorde den så speciel?",
                      "Hvordan kan vi lære at være mere tålmodige og forstående overfor hinanden?",
                      "Hvordan kan vi arbejde på at være mere til stede og opmærksomme, når vi er sammen?",
                      "Hvad er nogle af vores fælles udfordringer, og hvordan kan vi hjælpe hinanden med at overvinde dem?"]
    
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
                
                Text("Bedste venner")
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

struct BestFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        BestFriendsView()
    }
}
