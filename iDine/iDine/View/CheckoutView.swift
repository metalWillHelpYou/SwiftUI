//
//  CheckoutView.swift
//  iDine
//
//  Created by metalWillHelpYou on 02.03.2023.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    
    @State private var addloyaltyDetails = false
    @State private var loyatyNumber = ""
    @State private var tipAmount = 15
    @State private var paymentAlert = false
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    let paymentTypes = ["Cash", "Credit Card"]
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addloyaltyDetails.animation())
                if addloyaltyDetails {
                    TextField("Enter your ID", text: $loyatyNumber)
                        .keyboardType(.decimalPad)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    paymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $paymentAlert) {
            
        } message: {
            Text("Tour total was \(totalPrice) - thank u!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
