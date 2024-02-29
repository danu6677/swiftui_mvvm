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
        VStack{
            Text("Home Screen")
           
        }
    }

}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
