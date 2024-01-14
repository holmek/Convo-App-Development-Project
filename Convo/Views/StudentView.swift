import SwiftUI
import UIKit

struct StudentView: View {
    // Questions array
    let questions = ["Skal elever være forpligtede til at bære skoleuniform?",
                     "Skal skoler bruge standardiserede tests som mål for elevpræstation?",
                     "Skal skoler have myndighed til at søge elevernes personlige ejendele?",
                     "Skal skoler tilbyde undervisning i mental sundhed og mindfulness?",
                     "Skal universitetsuddannelse være gratis for alle studerende?",
                     "Skal lærere have lov til at bruge sociale medier til at kommunikere med deres elever?",
                     "Skal elever have lov til at medbringe deres egne enheder til skolen?",
                     "Skal elever have adgang til mobiltelefoner under undervisningen?",
                     "Skal skoler eliminere lektier?",
                     "Skal skoler tilbyde gratis måltider til eleverne?",
                     "Skal skoler have en dress code politik?",
                     "Skal skoler tilbyde erhvervsuddannelser udover traditionelle akademiske programmer?",
                     "Skal skoler undervise i finansiel litteratur?",
                     "Skal skoler tilbyde seksualundervisning?",
                     "Skal skoler give eleverne adgang til prævention?",
                     "Skal skoler have ret til at disciplinere elever for adfærd, der forekommer uden for skolen?",
                     "Skal skoler tilbyde undervisning i klimaforandringer og bæredygtighed?",
                     "Skal skoler tillade elever at danne deres egne klubber og organisationer?",
                     "Skal skoler undervise elever i at kode?",
                     "Skal skoler eliminere karakterer og i stedet fokusere på individualiserede vurderinger?",
                     "Skal skoler eliminere sportsprogrammer?",
                     "Skal elever have lov til at tage fridage til håndtering af deres mentale sundhed?",
                     "Skal skoler give elever adgang til terapi- og rådgivningstjenester?",
                     "Skal skoler tilbyde undervisning i race og privilegium?",
                     "Skal skoler integrere teknologi i enhver aspekt af læringen?"]
    
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
                
                Text("Studie")
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

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
