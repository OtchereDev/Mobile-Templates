//
//  PhoneNumberVerificationView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct PhoneNumberVerificationView: View {
    @State private var code: [String] = Array(repeating: "", count: 4)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Verify phone number")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Enter the 4-Digit code sent to you at +610489632578")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 10) {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("", text: $code[index])
                            .frame(width: 50, height: 50)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                
                Button(action: {
                    // Continue action
                }) {
                    Text("CONTINUE")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                HStack {
                    Text("Didn't receive code?")
                        .foregroundColor(.gray)
                    Button(action: {
                        // Resend code action
                    }) {
                        Text("Resend Again.")
                            .foregroundColor(.orange)
                    }
                }
                
                Text("By Signing up you agree to our Terms Conditions & Privacy Policy.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Login to Foodly")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct PhoneNumberVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberVerificationView()
    }
}
