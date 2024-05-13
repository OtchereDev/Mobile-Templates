//
//  AccountSettingsView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct AccountSettingsView: View {
    @State private var pushNotifications: Bool = true
    @State private var smsNotifications: Bool = false
    @State private var promotionalNotifications: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Profile Information")) {
                        NavigationLink(destination: ProfileSettingsView()) {
                            SettingsRow(icon: "person", title: "Profile Information", subtitle: "Change your account information")
                        }
                        NavigationLink(destination: ChangePasswordView()) {
                            SettingsRow(icon: "lock", title: "Change Password", subtitle: "Change your password")
                        }
                        NavigationLink(destination: PaymentMethodsView()) {
                            SettingsRow(icon: "creditcard", title: "Payment Methods", subtitle: "Add your credit & debit cards")
                        }
                        NavigationLink(destination: LocationsView()) {
                            SettingsRow(icon: "location", title: "Locations", subtitle: "Add or remove your delivery locations")
                        }
                        NavigationLink(destination: AddSocialAccountView()) {
                            SettingsRow(icon: "person.2", title: "Add Social Account", subtitle: "Add Facebook, Twitter etc")
                        }
                        NavigationLink(destination: ReferToFriendsView()) {
                            SettingsRow(icon: "person.crop.circle.badge.plus", title: "Refer to Friends", subtitle: "Get $10 for referring friends")
                        }
                    }
                    
                    Section(header: Text("Notifications")) {
                        Toggle(isOn: $pushNotifications) {
                            SettingsRow(icon: "bell", title: "Push Notifications", subtitle: "For daily updates you will get it")
                        }
                        Toggle(isOn: $smsNotifications) {
                            SettingsRow(icon: "message", title: "SMS Notifications", subtitle: "For daily updates you will get it")
                        }
                        Toggle(isOn: $promotionalNotifications) {
                            SettingsRow(icon: "megaphone", title: "Promotional Notifications", subtitle: "For daily updates you will get it")
                        }
                    }
                    
                    Section(header: Text("More")) {
                        NavigationLink(destination: RateUsView()) {
                            SettingsRow(icon: "star", title: "Rate Us", subtitle: "Rate us on Playstore, Appstore")
                        }
                        NavigationLink(destination: FAQView()) {
                            SettingsRow(icon: "book", title: "FAQ", subtitle: "Frequently asked questions")
                        }
                        NavigationLink(destination: LogoutView()) {
                            SettingsRow(icon: "arrow.backward", title: "Logout", subtitle: "")
                        }
                    }
                }
            }
            .navigationBarTitle("Account Settings")
        }
    }
}

// Methods OR Views to be created
struct LogoutView: View {
    var body: some View {
        Text("Logged Out")
    }
}

//struct PaymentMethodsView: View {
//    var body: some View {
//        Text("Logged Out")
//    }
//}
struct LocationsView: View {
    var body: some View {
        Text("Logged Out")
    }
}
struct AddSocialAccountView: View {
    var body: some View {
        Text("Logged Out")
    }
}
struct RateUsView: View {
    var body: some View {
        Text("Logged Out")
    }
}
struct FAQView: View {
    var body: some View {
        Text("Logged Out")
    }
}
struct ReferToFriendsView: View {
    var body: some View {
        Text("Logged Out")
    }
}










struct SettingsRow: View {
    var icon: String
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 20, height: 20)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
