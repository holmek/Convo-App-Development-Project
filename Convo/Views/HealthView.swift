import SwiftUI
import UIKit

struct HealthView: View {
    // Questions array
    let questions = ["Bør sundhedspleje betragtes som en grundlæggende menneskeret?",
                     "Bør vaccinationer være obligatoriske?",
                     "Bør organdonation være obligatorisk?",
                     "Bør aktiv dødshjælp legaliseres?",
                     "Bør privat sundhedspleje forbydes?",
                     "Bør regeringen regulere prisen på receptpligtig medicin?",
                     "Bør genetisk ingeniørarbejde anvendes til at forebygge sygdomme?",
                     "Bør alternativ medicin omfattes af sygeforsikringen?",
                     "Bør læger have lov til at ordinere placebo?",
                     "Bør stofprøver være obligatoriske for gymnasieatleter?",
                     "Bør der være en afgift på usunde fødevarer?",
                     "Bør der være en afgift på sukkerholdige drikkevarer?",
                     "Bør regeringen regulere reklamer for usunde fødevarer?",
                     "Bør fastfood-restauranter være påkrævet at vise kalorieindholdet?",
                     "Bør der være et forbud mod rygning på offentlige steder?",
                     "Bør rygning forbydes helt?",
                     "Bør der være en afgift på cigaretter?",
                     "Bør marihuana legaliseres til medicinsk brug?",
                     "Bør stofmisbrug behandles som et medicinsk problem i stedet for et kriminelt?",
                     "Bør mental sundhedspleje omfattes af sygeforsikringen?",
                     "Bør der være mere finansiering af mental sundhedsforskning?",
                     "Bør aktiv dødshjælp være en mulighed for personer med psykiske lidelser?",
                     "Bør regeringen regulere brugen af e-cigaretter?",
                     "Bør der være et forbud mod energidrikke?",
                     "Bør aktiv dødshjælp legaliseres?"]
    
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
                
                Text("Sundhed")
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

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
