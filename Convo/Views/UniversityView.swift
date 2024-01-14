import SwiftUI
import UIKit

struct UniversityView: View {
    // Questions array
    let questions = ["Hvad er dit formål med at gå på universitetet?",
                     "Hvad er det største udfordring ved at studere på universitetet?",
                     "Hvordan kan du bedst udnytte ressourcerne på universitetet?",
                     "Hvilken rolle spiller dit sociale liv på universitetet i dit akademiske liv?",
                     "Hvordan håndterer du stress og balance mellem studier og personlige liv?",
                     "Hvordan kan du bidrage til universitetets mangfoldighed og inklusion?",
                     "Hvordan vil du bruge din uddannelse efter endt universitet?",
                     "Hvordan kan du opbygge forbindelser og netværk på universitetet?",
                     "Hvordan kan du udvikle dine interesser og lidenskaber på universitetet?",
                     "Hvordan kan du lære af forskellige perspektiver og holdninger på universitetet?",
                     "Hvordan kan du mest effektivt forberede dig til eksamener og opgaver på universitetet?",
                     "Hvordan kan du udvikle dine færdigheder inden for forskning og kritisk tænkning?",
                     "Hvordan kan du finde balance mellem at følge pensum og udforske dine egne interesser?",
                     "Hvordan kan du bedst udnytte mentorer og vejledere på universitetet?",
                     "Hvordan kan du engagere dig i forskellige klubber, organisationer og aktiviteter på universitetet?",
                     "Hvordan kan du udnytte teknologi og digitale ressourcer til at forbedre dine studier?",
                     "Hvordan kan du udvikle dine kommunikationsfærdigheder på universitetet?",
                     "Hvordan kan du lære af dine fejl og modgang på universitetet?",
                     "Hvordan kan du udvikle dine lederegenskaber og teamwork-færdigheder på universitetet?",
                     "Hvordan kan du skabe en god work-life balance på universitetet?",
                     "Hvordan kan du udnytte internationale muligheder og perspektiver på universitetet?",
                     "Hvordan kan du engagere dig i samfundet og forbedre verden gennem dine studier?",
                     "Hvordan kan du udnytte karriereservices og praktikpladser på universitetet?",
                     "Hvordan kan du udvikle dine kreative og innovative færdigheder på universitetet?",
                     "Hvordan kan du skabe meningsfulde relationer og venskaber på universitetet?"]
    
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
                
                Text("Universitet")
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

struct UniversityView_Previews: PreviewProvider {
    static var previews: some View {
        UniversityView()
    }
}
