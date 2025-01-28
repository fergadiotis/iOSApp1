//
//  OrderCreationView.swift
//  iOSApp1
//
//  Created by Tassos Fergadiotis on 2025-01-27.
//

import Foundation

import SwiftUI

struct OrderCreationView: View {
    @State private var coffeeOrder = CoffeeOrder(
        id: UUID(),
        name: "",
        drinkType: "Espresso",
        size: "Medium",
        customizations: [],
        notes: ""
    )
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    private let availableSizes = ["Small", "Medium", "Large"]
    private let availableDrinkTypes = ["Espresso", "Latte", "Cappuccino", "Americano", "Black Coffee"]
    private let availableCustomizations = ["Extra Shot", "Non-fat Milk", "Oat Milk", "Sugar", "No Foam"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Section {
                    Text("Customer Information")
                        .font(.headline)
                    TextField("Your Name", text: $coffeeOrder.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.top)
                
                Section {
                    Text("Drink Information")
                        .font(.headline)
                    Picker("Select Drink Type", selection: $coffeeOrder.drinkType) {
                        ForEach(availableDrinkTypes, id: \.self) { drink in
                            Text(drink)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Picker("Select Size", selection: $coffeeOrder.size) {
                        ForEach(availableSizes, id: \.self) { size in
                            Text(size)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("Customizations")
                        .font(.headline)
                    ForEach(availableCustomizations, id: \.self) { customization in
                        Toggle(customization, isOn: Binding(
                            get: { coffeeOrder.customizations.contains(customization) },
                            set: { isOn in
                                var newCustomizations = coffeeOrder.customizations
                                if isOn {
                                    newCustomizations.append(customization)
                                } else {
                                    newCustomizations.removeAll { $0 == customization }
                                }
                                coffeeOrder.customizations = newCustomizations
                            }
                        ))
                    }
                }
                
                Section {
                    Text("Special Notes")
                        .font(.headline)
                    TextField("Any additional notes?", text: $coffeeOrder.notes)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical)
                }
                
                Button(action: submitOrder) {
                    Text("Submit Order")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Create Your Coffee Order")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Status", isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
    }
    
    private func submitOrder() {
        if coffeeOrder.name.trimmingCharacters(in: .whitespaces).isEmpty {
            alertMessage = "Please enter your name"
            showingAlert = true
            return
        }
        
        alertMessage = "Order submitted successfully!"
        showingAlert = true
        
        // Reset form
        coffeeOrder = CoffeeOrder(
            id: UUID(),
            name: "",
            drinkType: "Espresso",
            size: "Medium",
            customizations: [],
            notes: ""
        )
    }
}

struct OrderCreationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderCreationView()
        }
    }
}
