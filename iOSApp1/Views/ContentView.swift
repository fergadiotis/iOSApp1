//
//  ContentView.swift
//  iOSApp1
//
//  Created by Tassos Fergadiotis on 2025-01-27.
//

import SwiftUI
import CoreData

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
 
                VStack {
                    Image(systemName: "cup.and.saucer")
                        .imageScale(.large)
                        .foregroundColor(Color(red: 0.6, green: 0.3, blue: 0.1))
                    
                    Text("Coffee Run")
                        .font(.largeTitle)
                        .foregroundColor(.white)
 
                    NavigationLink(destination: OrderCreationView()) {
                        Text("Start Order")
                            .font(.title)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
