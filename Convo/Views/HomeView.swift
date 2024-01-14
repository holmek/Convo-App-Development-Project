import SwiftUI

struct RoundedSearchBarStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color(hue: 0.678, saturation: 0.0, brightness: 0.116))
            .cornerRadius(20)
            .foregroundColor(.white)
            .font(.title3)
    }
}

struct HomeView: View {
    @State private var searchQuery = ""
    
    let searchResults: [(String, AnyView)] = [
        ("Familie", AnyView(FamilyView())),
        ("Venner", AnyView(FriendsView())),
        ("Universitet", AnyView(UniversityView())),
        ("Gymnasium", AnyView(GymnasiumView())),
        ("Efterskole", AnyView(EfterskoleView())),
        ("Studie", AnyView(StudentView())),
        ("Social & politisk", AnyView(SocialAndPoliticalView())),
        ("Sundhed", AnyView(HealthView())),
        ("Sociale Medier", AnyView(SocialMediaView())),
        ("Sport", AnyView(SportsView())),
        ("Mentalt Helbred", AnyView(SportsView())),
        ("Single", AnyView(SingleView())),
        ("Kærester", AnyView(RelationshipView())),
        ("Bedste Venner", AnyView(BestFriendsView())),
        ("Nye Venner", AnyView(NewFriendsView())),
        ("Musik", AnyView(MusicView())),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Explore()
                    
                    Greeting()
                    
                    VStack {
                        VStack(alignment: .leading) {
                            TextField("Søg", text: $searchQuery)
                                .padding([.top, .leading, .trailing], 16)
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .textFieldStyle(RoundedSearchBarStyle())
                                .frame(width: 260)
                            
                            ForEach(searchResults.filter {
                                $0.0.localizedCaseInsensitiveContains(searchQuery)
                            }, id: \.0) { result in
                                NavigationLink(destination: result.1) {
                                    Text(result.0)
                                        .padding()
                                }
                            }
                            .padding(.horizontal, 16.0)
                            .foregroundColor(Color.gray)
                            .font(.title2)
                        }
                    }
                    .padding(.vertical)
                    
                    VStack {
                        
                        Popular()
                        
                        Selected()
                        
                        Debate()
                        
                        AZ()
                        
                        myMail()
                        
                    }
                }
            }
            .background(.black)
        }
        .onTapGesture {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

// Returns the greeting based on the current time of day
func getGreeting() -> String {
    let hour = Calendar.current.component(.hour, from: Date())
    if (hour >= 5 && hour < 10) {
        return "Godmorgen"
    } else if (hour >= 10 && hour < 12) {
        return "God formiddag"
    } else if (hour >= 12 && hour < 18) {
        return "god eftermiddag"
    } else if (hour >= 18 && hour < 24) {
        return "God aften"
    } else {
        return "Godnat"
    }
}

func getFormattedDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy - HH:mm"
    return formatter.string(from: Date())
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// View extension to add gradient foreground to a view
extension View {
    func gradientForeground(colors: [Color]) -> some View {
        let gradient = LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        return self.overlay(gradient)
            .mask(self)
    }
}

struct Explore: View {
    var body: some View {
        Text("Udforsk")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.all, 16)
    }
}

struct Greeting: View {
    var body: some View {
        Text(getGreeting())
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .bottom, .trailing], 16)
    }
}

struct Popular: View {
    var body: some View {
        VStack {
            Text("Populære")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    NavigationLink(destination: SingleView()) {
                        SingleCardView()
                    }
                    NavigationLink(destination: StudentView()) {
                        StudentCardView()
                    }
                    NavigationLink(destination: SocialMediaView()) {
                        SocialMediaCardView()
                    }
                    NavigationLink(destination: UniversityView()) {
                        UniversityCardView()
                    }
                    NavigationLink(destination: EfterskoleView()) {
                        EfterskoleCardView()
                    }
                }
            }
        }
        .padding(.bottom, 16.0)
    }
}

struct Selected: View {
    var body: some View {
        VStack {
            Text("Udvalgte")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    NavigationLink(destination: SocialMediaView()) {
                        SocialMediaCardView()
                    }
                    NavigationLink(destination: FriendsView()) {
                        FriendsCardView()
                    }
                    NavigationLink(destination: RelationshipView()) {
                        RelationshipCardView()
                    }
                    NavigationLink(destination: GymnasiumView()) {
                        GymnasiumCardView()
                    }
                    NavigationLink(destination: BestFriendsView()) {
                        BestFriendsCardView()
                    }
                }
            }
        }
        .padding(.bottom, 16.0)
    }
}

struct Debate: View {
    var body: some View {
        VStack {
            Text("Debat")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    NavigationLink(destination: StudentView()) {
                        StudentCardView()
                    }
                    NavigationLink(destination: SocialAndPoliticalView()) {
                        SocialAndPoliticalCardView()
                    }
                    NavigationLink(destination: HealthView()) {
                        HealthCardView()
                    }
                    NavigationLink(destination: SocialMediaView()) {
                        SocialMediaCardView()
                    }
                    NavigationLink(destination: SportsView()) {
                        SportsCardView()
                    }
                }
            }
        }
        .padding(.bottom, 16.0)
    }
}

struct AZ: View {
    var body: some View {
        VStack {
            Text("A-Å")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    NavigationLink(destination: FriendsView()) {
                        FriendsCardView()
                    }
                    NavigationLink(destination: FamilyView()) {
                        FamilyCardView()
                    }
                    NavigationLink(destination: PrimarySchoolView()) {
                        PrimarySchoolCardView()
                    }
                    NavigationLink(destination: EfterskoleView()) {
                        EfterskoleCardView()
                    }
                    NavigationLink(destination: GymnasiumView()) {
                        GymnasiumCardView()
                    }
                    NavigationLink(destination: H_jskoleView()) {
                        H_jskoleCardView()
                    }
                    NavigationLink(destination: UniversityView()) {
                        UniversityCardView()
                    }
                    NavigationLink(destination: StudentView()) {
                        StudentCardView()
                    }
                    NavigationLink(destination: SocialAndPoliticalView()) {
                        SocialAndPoliticalCardView()
                    }
                    NavigationLink(destination: HealthView()) {
                        HealthCardView()
                        
                    }
                }
            }
        }
        .padding(.bottom, 16.0)
    }
}

struct myMail: View {
    var body: some View {
        HStack {
            Image(systemName: "envelope")
                .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            Text("holm@holmdev.io")
                .font(.title3)
                .fontWeight(.semibold)
                .onTapGesture {
                    if let url = URL(string: "mailto:holm@holmdev.io") {
                        UIApplication.shared.open(url)
                    }
                }
        }
        .padding(.vertical, 20.0)
    }
}
