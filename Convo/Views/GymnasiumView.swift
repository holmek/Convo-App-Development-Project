import SwiftUI
import UIKit

struct GymnasiumView: View {
    // Questions array
    let questions = ["Hvordan definerer du succes i gymnasiet?",
                     "Hvad motiverer dig til at gå i skole hver dag?",
                     "Hvilke udfordringer har du stået over for i din gymnasieoplevelse?",
                     "På hvilke måder har gymnasiet ændret dig som person?",
                     "Hvilken rolle spiller sociale medier i gymnasiekulturen?",
                     "Hvordan balancerer du akademiske og fritidsforpligtelser?",
                     "Hvad er din mening om standardiserede tests i gymnasiet?",
                     "Hvordan har dine relationer til kammerater og lærere påvirket din gymnasieoplevelse?",
                     "På hvilke måder har gymnasiet påvirket dine fremtidige mål og ambitioner?",
                     "Hvad er din holdning til brugen af teknologi i klasseværelset?",
                     "På hvilke måder har mangfoldighed påvirket din gymnasieoplevelse?",
                     "Hvordan håndterer du stress og pres i gymnasiet?",
                     "Hvad er den vigtigste lektion, du har lært i gymnasiet?",
                     "Hvordan har din gymnasieoplevelse forberedt dig på voksenlivet?",
                     "Hvilke ændringer ville du foretage i gymnasiepensummet?",
                     "Hvad er rollen for kreativitet i gymnasieuddannelsen?",
                     "Hvordan balancerer du uafhængighed og afhængighed af andre i gymnasiet?",
                     "Hvilken rolle spiller fritidsaktiviteter i din gymnasieoplevelse?",
                     "Hvad er din holdning til betydningen af fysisk uddannelse i gymnasiet?",
                     "På hvilke måder har gymnasiet udfordret og udvidet din verdensopfattelse?",
                     "Hvordan håndterer du konflikter med kammerater og/eller lærere i gymnasiet?",
                     "På hvilke måder har gymnasiet påvirket dine karrierevalg?",
                     "Hvad er rollen for samfundstjeneste i gymnasieuddannelsen?",
                     "Hvordan opretholder du en balance mellem arbejde og fritid i gymnasiet?",
                     "På hvilke måder har gymnasiet påvirket din personlige vækst og udvikling?"]
    
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
                
                Text("Gymnasiet")
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

struct GymnasiumView_Previews: PreviewProvider {
    static var previews: some View {
        GymnasiumView()
    }
}
