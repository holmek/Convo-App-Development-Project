import SwiftUI
import UIKit

struct EfterskoleView: View {
    // Questions array
    let questions = ["Hvad har du lært om dig selv og andre på din efterskole?",
                     "Hvordan har din efterskole oplevet og håndteret udfordringerne ved COVID-19?",
                     "Hvordan har du udviklet dine interpersonelle færdigheder på din efterskole?",
                     "Hvordan kan du tage de færdigheder, du har lært på din efterskole, med dig videre?",
                     "Hvordan kan du fortsætte med at udvikle dit faglige potentiale efter efterskolen?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at gøre en positiv forskel i verden?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at opbygge og opretholde sunde relationer?",
                     "Hvordan kan du tage ansvar for dit eget læringsforløb på efterskolen?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at forbedre din evne til at løse problemer?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at overvinde modgang i fremtiden?",
                     "Hvordan kan du udvikle dine lederegenskaber på efterskolen?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at forbedre dine kommunikationsfærdigheder?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forfølge dine mål og drømme?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at styrke dit mentale helbred?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at blive mere selvstændig?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at blive mere bevidst om samfundets udfordringer?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at opbygge en stærkere identitet?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forstå og værdsætte forskellige kulturer?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forbedre dine kreative evner?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at forstå og bekæmpe fordomme?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at engagere dig i din lokale og globale fællesskab?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at forbedre din evne til at samarbejde?", "Hvordan kan du bruge din efterskoleoplevelse til at forstå og respektere forskellige synspunkter?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at tage ansvar for dit eget liv og trivsel?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at udvikle dine interkulturelle kompetencer?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forstå og tackle sociale problemer?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at styrke dit selvværd og selvtillid?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forbedre din evne til at tage imod feedback og konstruktiv kritik?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at lære mere om dig selv og dine styrker og svagheder?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at opbygge og opretholde sunde relationer?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at lære mere om verden og dens mangfoldighed?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at udvikle dine evner til at håndtere konflikter på en positiv måde?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at forstå og bekæmpe diskrimination og uretfærdighed?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forbedre dine kommunikationsfærdigheder?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at lære mere om bæredygtighed og miljøbevidsthed?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forbedre dine evner til at tage initiativ og være en aktiv samfundsborger?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at udvikle dine evner til at tænke kritisk og analytisk?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forbedre dine evner til at samarbejde og arbejde i team?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at lære mere om kunst og kultur og udtrykke dig selv kreativt?",
                     "Hvordan kan du bruge det, du har lært på efterskolen, til at forstå og respektere forskellige religiøse og kulturelle traditioner?",
                     "Hvordan kan du bruge din efterskoleoplevelse til at lære mere om demokrati og menneskerettigheder?"]
    
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
                
                Text("Venner")
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

struct EfterskoleView_Previews: PreviewProvider {
    static var previews: some View {
        EfterskoleView()
    }
}
