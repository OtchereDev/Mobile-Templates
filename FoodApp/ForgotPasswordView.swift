//
//  ForgotPasswordView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Forgot password")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Enter your email address and we will send you a reset instructions.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("EMAIL ADDRESS", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                
                Button(action: {
                    // Reset password action
                }) {
                    Text("RESET PASSWORD")
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
            .navigationBarTitle("Forgot Password")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
