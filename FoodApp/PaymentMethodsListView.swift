//
//  PaymentMethodsListView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct PaymentMethodsListView: View {
    var body: some View {
        NavigationView {
            List {
                PaymentMethodRow(method: PaymentMethod(icon: "paypal", name: "PayPal", status: "Default Payment"))
                PaymentMethodRow(method: PaymentMethod(icon: "mastercard", name: "MasterCard", status: "Not Default"))
                PaymentMethodRow(method: PaymentMethod(icon: "visa", name: "Visa", status: "Not Default"))
            }
            .navigationBarTitle("Payment Methods")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct PaymentMethodRow: View {
    var method: PaymentMethod
    
    var body: some View {
        HStack {
            Image(method.icon)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(method.name)
                    .font(.headline)
                Text(method.status)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

struct PaymentMethod: Identifiable {
    let id = UUID()
    let icon: String
    let name: String
    let status: String
}

struct PaymentMethodsListView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodsListView()
    }
}
