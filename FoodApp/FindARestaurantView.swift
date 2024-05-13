//
//  FindARestaurantView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct FindARestaurantsView: View {
    @State private var selectedCategory: String? = "BURGERS"
    @State private var searchText: String = ""
    
    let categories = ["BURGERS", "BRUNCH", "BREAKFAST"]
    let restaurants = [
        RestaurantA(imageName: "restaurant1", name: "Nethai Kitchen", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
        RestaurantA(imageName: "restaurant2", name: "Lazy Bear", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
        RestaurantA(imageName: "restaurant3", name: "State Bird", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
        RestaurantA(imageName: "restaurant4", name: "Petit Creen", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
        RestaurantA(imageName: "restaurant5", name: "Rich Table", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
        RestaurantA(imageName: "restaurant6", name: "Cotogna", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Map View
                ZStack(alignment: .topLeading) {
                    Image("mapImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                    
                    HStack {
                        Button(action: {
                            // Back action
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .padding(.leading, 16)
                        
                        Spacer()
                        
                        Button(action: {
                            // Search action
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.top, 16)
                }
                
                // Top Pick Restaurants
                VStack(alignment: .leading) {
                    Text("Top Pick Restaurants")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category)
                                    .font(.subheadline)
                                    .padding()
                                    .background(selectedCategory == category ? Color.orange : Color(.systemGray6))
                                    .foregroundColor(selectedCategory == category ? .white : .gray)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(restaurants) { restaurant in
                            RestaurantACard(restaurant: restaurant)
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct RestaurantACard: View {
    var restaurant: RestaurantA
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .foregroundColor(.white)
                        Text("\(restaurant.time) min")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.white)
                        Text(restaurant.cost)
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
                }
                .padding([.leading, .bottom], 8)
                
                Text(String(format: "%.1f", restaurant.rating))
                    .padding(8)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .font(.caption)
                    .cornerRadius(10)
                    .padding([.trailing, .top], 8)
            }
            
            Text(restaurant.name)
                .font(.headline)
                .padding(.top, 8)
            
            Text(restaurant.cuisine)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
        }
    }
}

struct RestaurantA: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let cuisine: String
    let time: Int
    let cost: String
    let rating: Double
}

struct FindARestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        FindARestaurantsView()
    }
}
