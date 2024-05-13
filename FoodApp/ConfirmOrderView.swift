//
//  ConfirmOrderView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct ConfirmOrderView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orderItems) { item in
                        OrderItemRow(item: item)
                    }
                    
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text("AUD$30")
                    }
                    
                    HStack {
                        Text("Delivery")
                        Spacer()
                        Text("$0")
                    }
                    
                    HStack {
                        Text("Total (incl. VAT)")
                        Spacer()
                        Text("AUD$30")
                    }
                }
                .listStyle(PlainListStyle())
                
                VStack {
                    NavigationLink(destination: AddMoreItemsView()) {
                        HStack {
                            Text("Add more items")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding()
                    
                    NavigationLink(destination: PromoCodeView()) {
                        HStack {
                            Text("Promo code")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGray6))
                
                Button(action: {
                    // Checkout action
                }) {
                    Text("CHECKOUT (AUD $30)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("McDonald's", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct OrderItemRow: View {
    var item: OrderItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(item.quantity)")
                    .frame(width: 20, height: 20)
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(4)
                Text(item.name)
                Spacer()
                Text("AUD$\(item.price)")
                    .foregroundColor(.orange)
            }
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

struct OrderItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let quantity: Int
    let price: Double
}

let orderItems = [
    OrderItem(name: "Cookie Sandwich", description: "Shortbread, chocolate turtle cookies, and red velvet.", quantity: 1, price: 10.0),
    OrderItem(name: "Combo Burger", description: "Shortbread, chocolate turtle cookies, and red velvet.", quantity: 1, price: 10.0),
    OrderItem(name: "Oyster Dish", description: "Shortbread, chocolate turtle cookies, and red velvet.", quantity: 2, price: 10.0)
]

struct AddMoreItemsView: View {
    var body: some View {
        Text("Add more items")
    }
}

struct PromoCodeView: View {
    var body: some View {
        Text("Promo code")
    }
}

struct ConfirmOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOrderView()
    }
}
