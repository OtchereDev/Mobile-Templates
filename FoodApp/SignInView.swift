//
//  SignInView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome to Tamang Food Services")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Enter your Phone number or Email address for sign in. Enjoy your food :)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("EMAIL ADDRESS", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                SecureField("PASSWORD", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                HStack {
                    Spacer()
                    Button(action: {
                        // Forgot password action
                    }) {
                        Text("Forget Password?")
                            .foregroundColor(.gray)
                    }
                }
                
                Button(action: {
                    // Sign in action
                }) {
                    Text("SIGN IN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("primaryColor"))
                        .cornerRadius(10)
                }
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    Button(action: {
                        // Create new account action
                    }) {
                        Text("Create new account.")
                            .foregroundColor(.orange)
                    }
                }
                
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
                
                //Spacer()
            }
            .padding()
            .navigationBarTitle("Sign In")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
