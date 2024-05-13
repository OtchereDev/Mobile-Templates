//
//  FindRestaurantView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct FindRestaurantsView: View {
    @State private var searchText: String = "HayStreet, Perth"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Button(action: {
                        // Close action
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                
                Text("Find restaurants near you")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Please enter your location or allow access to your location to find restaurants near you.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                
                List {
                    LocationRow(location: "St George's Terrace, Perth", region: "Western Australia")
                    LocationRow(location: "Murray street, Perth", region: "Western Australia")
                    LocationRow(location: "Kings Square, Perth", region: "Western Australia")
                }
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct LocationRow: View {
    var location: String
    var region: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(location)
                .font(.body)
            Text(region)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct FindRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        FindRestaurantsView()
    }
}
