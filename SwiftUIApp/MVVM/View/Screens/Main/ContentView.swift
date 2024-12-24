//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI
import CoreData

struct ContentView: View {
 
    var body: some View {
        VStack(alignment: .center){
                   Text("Welcome to VoiceOver accessibility")
                       .font(.title)
                       .padding()
                       .accessibility(label: Text("Welcome message"))
                       .accessibility(hint: Text("Displays a welcome message"))
                   
                   Button(action: {
                       announceGreeting()
                   }) {
                       Text("Tap me")
                           .font(.title2)
                           .padding()
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                           .accessibility(label: Text("Greeting button"))
                           .accessibility(hint: Text("Tap to hear a greeting message"))
                           .accessibility(addTraits: .isButton)
                   }
               }
               .padding()
    }
    private func announceGreeting() {
            let greetingMessage = "Hello, welcome to VoiceOver accessibility!"
            UIAccessibility.post(notification: .announcement, argument: greetingMessage)
    }

}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
struct VoiceOverView: View {
    var body: some View {
        VStack {
            Text("Welcome to VoiceOver accessibility")
                .font(.title)
                .accessibility(label: Text("Welcome message"))
                .accessibility(hint: Text("Displays a welcome message"))
            
            Button(action: {
                announceGreeting()
            }) {
                Text("Tap me")
                    .font(.title2)
                    .accessibility(label: Text("Greeting button"))
                    .accessibility(hint: Text("Tap to hear a greeting message"))
                    .accessibility(addTraits: .isButton)
            }
        }
        .padding()
    }
    
    private func announceGreeting() {
        let greetingMessage = "Hello, welcome to VoiceOver accessibility!"
        UIAccessibility.post(notification: .announcement, argument: greetingMessage)
    }
}

