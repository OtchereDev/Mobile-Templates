//
//  AddPaymentMethodView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct AddPaymentMethodsView: View {
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvc: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Add your payment methods")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("This card will only be charged when you place an order.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("Card Number", text: $cardNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(HStack {
                        Spacer()
                        Image(systemName: "creditcard")
                            .foregroundColor(.gray)
                            .padding()
                    })
                
                HStack {
                    TextField("MM/YY", text: $expiryDate)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    TextField("CVC", text: $cvc)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Button(action: {
                    // Add card action
                }) {
                    Text("ADD CARD")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(.bottom, 8)
                
                Button(action: {
                    // Scan card action
                }) {
                    HStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.black)
                        Text("SCAN CARD")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct AddPaymentMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentMethodsView()
    }
}
