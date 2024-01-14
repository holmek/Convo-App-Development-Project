import SwiftUI
import UIKit

struct H_jskoleView: View {
    // Questions array
    let questions = ["Hvad er din oplevelse af højskolelivet indtil nu?",
                     "Hvilke fag har du mest nydt at tage på højskolen?",
                     "Hvordan har du udviklet dig personligt og intellektuelt under dit ophold på højskolen?",
                     "Hvordan har du forholdt dig til det sociale miljø på højskolen?",
                     "Hvad har været dit største faglige eller personlige gennembrud på højskolen?",
                     "Hvad er nogle af de udfordringer, du har mødt på højskolen, og hvordan har du overvundet dem?",
                     "Hvordan kan du bruge det, du har lært på højskolen, i dit fremtidige arbejde eller studier?",
                     "Hvad er nogle af de nye interesser eller passioner, du har opdaget på højskolen?",
                     "Hvordan har du oplevet undervisningen og lærerne på højskolen?",
                     "Hvordan har højskolelivet ændret dine holdninger eller synspunkter om forskellige emner?",
                     "Hvordan har du fundet balance mellem fagligt og socialt liv på højskolen?",
                     "Hvordan har du oplevet den kreative og intellektuelle atmosfære på højskolen?",
                     "Hvordan har du været i stand til at anvende det, du har lært på højskolen, i dit personlige liv?",
                     "Hvordan har du fundet meningsfulde og støttende relationer på højskolen?",
                     "Hvordan har du oplevet at bo på højskolen og deltage i fællesskabet?",
                     "Hvordan har højskoleopholdet ændret dine fremtidsplaner eller karriereambitioner?",
                     "Hvordan har du været i stand til at tage initiativ og tage ansvar for dit eget læringsforløb på højskolen?",
                     "Hvad er noget, du vil tage med dig fra dit ophold på højskolen resten af livet?",
                     "Hvordan har du oplevet at lære og samarbejde med mennesker fra forskellige kulturer og baggrunde?",
                     "Hvordan har højskoleopholdet påvirket din personlige vækst og udvikling?",
                     "Hvordan har du håndteret udfordringer eller konflikter med andre studerende på højskolen?",
                     "Hvordan har højskoleopholdet udvidet dine horisonter og eksponeret dig for nye ideer og perspektiver?",
                     "Hvordan har du fundet balance mellem at tage imod de tilbudte aktiviteter og undervisning og have tid til dig selv?",
                     "Hvordan har højskoleopholdet hjulpet dig med at finde din passion eller karrierevej?"]
    
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
                
                Text("Højskole")
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

struct H_jskoleView_Previews: PreviewProvider {
    static var previews: some View {
        H_jskoleView()
    }
}
