//
//  ProfileSettingsView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct ProfileSettingsView: View {
    @State private var fullName: String = "Sajin Tamang"
    @State private var emailAddress: String = "Sajin Tamang @ Figma .com"
    @State private var phoneNumber: String = "+61 04133398285"
    @State private var password: String = "****"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Full Name")) {
                    TextField("Full Name", text: $fullName)
                }
                
                Section(header: Text("Email Address")) {
                    TextField("Email Address", text: $emailAddress)
                        .keyboardType(.emailAddress)
                }
                
                Section(header: Text("Phone Number")) {
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
                
                Section(header: Text("Password")) {
                    HStack {
                        SecureField("Password", text: $password)
                        Spacer()
                        NavigationLink(destination: ChangePasswordView()) {
                            Text("Change")
                                .foregroundColor(.orange)
                        }
                    }
                }
            }
            .navigationBarTitle("Profile Settings")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        // Change settings action
                    }) {
                        Text("CHANGE SETTINGS")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

//struct ChangePasswordView: View {
//    var body: some View {
//        Text("Change Password")
//    }
//}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
