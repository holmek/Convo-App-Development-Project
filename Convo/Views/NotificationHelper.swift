import UserNotifications

func scheduleNotification() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if let error = error {
            print("Error requesting authorization: \(error.localizedDescription)")
        } else if granted {
            print("Authorization granted!")
            
            // Array of possible notification messages
            let messages = [
                "Vores app er en fantastisk måde at forbinde med andre og have meningsfulde samtaler. Tag et øjeblik i dag til at starte en samtale med en ven eller måske endda et ny bekendtskab! Del dine tanker og ideer, og lad appen bringe jer tættere sammen.",
                "Brug vores app til at starte en samtale og forbinde med nogen, du ikke har talt med i et stykke tid. Du ved aldrig, hvad du kan lære eller opdage, når du taler med nogen. Så hvorfor ikke tage et skridt ud af din komfortzone og starte en samtale i dag?",
                "Vores app kan hjælpe dig med at skabe forbindelser og styrke relationer. Tag dig tid til at lytte og dele og se hvordan en god samtale kan gøre din dag bedre.",
                "Vores app er en sikker og pålidelig måde at forbinde med andre og opbygge meningsfulde relationer. Tag dig tid til at lytte til din vens historie og del dine egne oplevelser. Det kan ændre hele din dag til det bedre."
            ]
            
            // Randomly choose a message from the array
            let randomIndex = Int.random(in: 0..<messages.count)
            let randomMessage = messages[randomIndex]
            
            // Create notification content with randomized message
            let content = UNMutableNotificationContent()
            content.title = "Daglig påmindelse"
            content.body = randomMessage
            content.sound = UNNotificationSound.default
            
            // Create trigger with daily recurrence at 6 PM
            var dateComponents = DateComponents()
            dateComponents.hour = 18
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            // Create request with content and trigger
            let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
            
            // Schedule notification
            center.add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled!")
                }
            }
        } else {
            print("Authorization denied.")
        }
    }
}
