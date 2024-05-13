//
//  SignUpView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Enter your Name, Email and Password for sign up. ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text("Already have account?")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                
                TextField("FULL NAME", text: $fullName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                TextField("EMAIL ADDRESS", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                SecureField("PASSWORD", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
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
                
                Text("By Signing up you agree to our Terms Conditions & Privacy Policy.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    Text("Or")
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                
                Button(action: {
                    // Connect with Facebook action
                }) {
                    HStack {
                        Image(systemName: "f.circle.fill")
                            .foregroundColor(.white)
                        Text("CONNECT WITH FACEBOOK")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Connect with Google action
                }) {
                    HStack {
                        Image(systemName: "g.circle.fill")
                            .foregroundColor(.white)
                        Text("CONNECT WITH GOOGLE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                }
                
               // Spacer()
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
