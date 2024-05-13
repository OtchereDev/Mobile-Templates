//
//  SearchRestaurantView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct SearchRestaurantsView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Search")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search on foodly", text: $searchText)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Top Restaurants")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(restaurantData) { restaurant in
                                RestaurantCard(restaurant: restaurant)
                            }
                        }
                        .padding()
                    }
                }
                
                // Bottom Navigation Bar
                // To HomeView
                HStack {
                    NavigationLink(destination: SignInView()) {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .foregroundColor(Color.gray)
                    }
                    .frame(maxWidth: .infinity)
                    // To Search
                    NavigationLink(destination: SingleResturant()) {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .foregroundColor(Color.gray)
                    }
                    .frame(maxWidth: .infinity)
                    // To OrderView
                    NavigationLink(destination: SignUpView()) {
                        VStack {
                            Image(systemName: "bag.fill")
                            Text("Orders")
                        }
                        .foregroundColor(Color.gray)
                    }
                    .frame(maxWidth: .infinity)
                    // To profile View
                    NavigationLink(destination: Search()) {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                        .foregroundColor(Color.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color(.systemGray6))
            }
            .navigationBarHidden(true)
        }
    }
}

struct RestaurantCard: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(restaurant.name)
                .font(.headline)
                .padding(.top, 8)
            
            HStack {
                Text(restaurant.price)
                Text("·")
                Text(restaurant.cuisine)
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
    }
}

struct Restaurant: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: String
    let cuisine: String
}

let restaurantData = [
    Restaurant(imageName: "restaurant1", name: "The Halal Guys", price: "$$", cuisine: "Chinese"),
    Restaurant(imageName: "restaurant2", name: "Popeyes 1426 Flmst", price: "$$", cuisine: "Chinese"),
    Restaurant(imageName: "restaurant3", name: "Mixt - Yerba Buena", price: "$$", cuisine: "Chinese"),
    Restaurant(imageName: "restaurant4", name: "Split Bread - Russian", price: "$$", cuisine: "Chinese"),
    // Add more restaurant data as needed
]

struct SearchRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRestaurantsView()
    }
}
