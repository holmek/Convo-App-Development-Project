import SwiftUI
import UIKit

struct SportsView: View {
    // Questions array
    let questions = ["Skal gymnasie-atleter betales?",
                     "Skal atleter have lov til at knæle under nationalsangen?",
                     "Skal præstationsfremmende midler være tilladt i sport?",
                     "Er brugen af teknologi i sport fair?",
                     "Skal gymnasie-atleter have lov til at konkurrere på klubhold i skoleåret?",
                     "Skal atleter have lov til at skifte skole uden straf?",
                     "Skal gymnasie-atleter have lov til at gå direkte til professionelt niveau?",
                     "Er cheerleading en sport?",
                     "Skal kvindesport have samme finansiering som herresport?",
                     "Skal atleter holdes til højere moralske standarder?",
                     "Skal atleter straffes for adfærd uden for banen?",
                     "Skal sportsligaer have mere strikse regler for hjernerystelser?",
                     "Skal sportsligaer gøre mere for at forebygge brug af præstationsfremmende midler?",
                     "Skal OL fortsætte i deres nuværende form?",
                     "Skal sports hold ændre deres maskotter og navne, hvis de anses for at være stødende?",
                     "Skal sports hold have lov til at bruge Native American-billeder og maskotter?",
                     "Skal atleter have lov til at bruge deres platform til at give udtryk for politiske holdninger?",
                     "Skal sportsorganisationer og hold være påkrævet at offentliggøre deres økonomiske information?",
                     "Skal atleter være påkrævet at deltage i medieinterviews?",
                     "Skal atleter være påkrævet at tale til medierne på deres modersmål?",
                     "Skal VM afholdes hvert fjerde år?",
                     "Skal atleter være påkrævet at deltage i pressekonferencer før og efter kampe?",
                     "Skal sports hold have lov til at flytte til forskellige byer?",
                     "Skal atleter være påkrævet at tage obligatoriske stofprøver?",
                     "Skal fans have lov til at købe og bruge stoffer som alkohol og marihuana ved sportsarrangementer?"]
    
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
                
                Text("Sport")
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

struct SportsView_Previews: PreviewProvider {
    static var previews: some View {
        SportsView()
    }
}
