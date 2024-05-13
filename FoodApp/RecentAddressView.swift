//
//  RecentAddressView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct RecentAddressesView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search new address", text: $searchText)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // Recent Addresses Header
                HStack {
                    Text("RECENT ADDRESS")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                    Button(action: {
                        // Clear all action
                    }) {
                        Text("CLEAR ALL")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing)
                }
                .padding(.top)
                
                // Recent Addresses List
                List {
                    AddressRow(address: "Hay Street, Perth")
                    AddressRow(address: "Zoo, Perth")
                    AddressRow(address: "Murray Street, Perth")
                    AddressRow(address: "St George Terrace, Perth")
                }
                .listStyle(PlainListStyle())
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

struct AddressRow: View {
    var address: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .foregroundColor(.gray)
            Text(address)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct RecentAddressesView_Previews: PreviewProvider {
    static var previews: some View {
        RecentAddressesView()
    }
}
