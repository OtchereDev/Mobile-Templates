//
//  PhoneNumberLoginView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct PhoneNumberLoginView: View {
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: String = "+61"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Get started with Foodly")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Enter your phone number to use Foodly and enjoy your food :)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Menu {
                        Button("+61") { selectedCountryCode = "+61" }
                        Button("+1") { selectedCountryCode = "+1" }
                        Button("+44") { selectedCountryCode = "+44" }
                        // Add more country codes as needed
                    } label: {
                        HStack {
                            Image(systemName: "flag.fill") // Placeholder for flag
                                .foregroundColor(.blue) // Placeholder color for the flag
                            Text(selectedCountryCode)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                    
                    TextField("PHONE NUMBER", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Sign up action
                }) {
                    Text("SIGN UP")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Login to Tamang Food Services")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct PhoneNumberLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberLoginView()
    }
}
