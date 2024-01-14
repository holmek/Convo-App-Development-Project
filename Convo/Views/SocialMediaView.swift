import SwiftUI
import UIKit

struct SocialMediaView: View {
    // Questions array
    let questions = ["Er social medieafhængighed et reelt problem?",
                     "Skal sociale medievirksomheder holdes ansvarlige for indhold, der er postet på deres platforme?",
                     "Skal sociale medievirksomheder have lov til at censurere indhold?",
                     "Skal sociale medievirksomheder være forpligtet til at kontrollere fakta i opslag?",
                     "Skal sociale medievirksomheder reguleres af regeringen?",
                     "Skal sociale medievirksomheder være forpligtet til at beskytte brugerdata?",
                     "Skal sociale medievirksomheder være forpligtet til at offentliggøre, hvordan brugerdata bliver brugt?",
                     "Skal sociale medievirksomheder være forpligtet til at verificere brugeridentiteter?",
                     "Skal sociale medievirksomheder være forpligtet til at mærke falske nyheder?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne hadefuldt indhold?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne falske nyheder?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne voldeligt indhold?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne nøgenhed og seksuelt indhold?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne cybermobning?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne indhold, der fremmer selvskade?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne indhold, der fremmer terrorisme?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne indhold, der fremmer spiseforstyrrelser?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne politiske annoncer?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne annoncer, der retter sig mod børn?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne konti, der spreder misinformation?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne konti, der spreder hadefuldt indhold?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne konti, der spreder konspirationsteorier?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne konti, der fremmer vold?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne konti, der fremmer selvskade?",
                     "Skal sociale medievirksomheder være forpligtet til at fjerne konti, der fremmer spiseforstyrrelser?"]
    
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
                
                Text("Sociale medier")
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

struct SocialMediaView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaView()
    }
}
