import SwiftUI
import UIKit

struct SingleView: View {
    // Questions array
    let questions = ["Hvad nyder du mest ved at være single?",
                     "Hvad er nogle af de udfordringer, du har haft som single, og hvordan har du overvundet dem?",
                     "Hvad er dine langsigtede mål for dit singleliv?",
                     "Hvordan kan du skabe mere mening og formål i dit singleliv?",
                     "Hvad er nogle af de positive sider ved at være single, som folk ofte overser?",
                     "Hvordan kan du undgå at føle dig ensom eller isoleret som single?",
                     "Hvordan kan du bruge dit singleliv som en mulighed for selvudvikling og vækst?",
                     "Hvordan kan du opretholde sunde relationer med venner og familie, mens du er single?",
                     "Hvordan kan du finde balancen mellem at være alene og social?",
                     "Hvordan kan du dyrke dine interesser og hobbyer og udforske nye ting som single?",
                     "Hvordan kan du undgå at sammenligne dig selv med andre i forhold, og i stedet fokusere på dit eget liv?",
                     "Hvordan kan du tage ansvar for dit eget lykke og trivsel som single?",
                     "Hvordan kan du finde styrke i din single status, når du møder modgang eller udfordringer?",
                     "Hvordan kan du styrke dit selvværd og selvtillid som single?",
                     "Hvad er noget, du gerne vil lære eller opnå som single, og hvordan kan du arbejde på det?",
                     "Hvordan kan du bruge din tid og energi på at skabe et meningsfuldt singleliv?",
                     "Hvordan kan du navigere i datingverdenen og undgå at miste dig selv i processen?",
                     "Hvordan kan du undgå at føle dig presset til at finde en partner eller blive i et forhold, når du egentlig ikke er klar til det?",
                     "Hvordan kan du værdsætte din frihed og uafhængighed som single?",
                     "Hvordan kan du undgå at føle dig som om der er noget galt med dig, bare fordi du er single?",
                     "Hvordan kan du finde balance mellem at nyde dit singleliv og samtidig holde åbent for at møde nye mennesker?",
                     "Hvordan kan du undgå at lade din single status definere dig som person?",
                     "Hvordan kan du opbygge stærke og meningsfulde venskaber som single?",
                     "Hvad er noget, du er taknemmelig for i dit singleliv?",
                     "Hvordan kan du styrke dit eget selvværd og undgå at søge efter bekræftelse fra andre?"]
    
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
                
                Text("Single")
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

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView()
    }
}
