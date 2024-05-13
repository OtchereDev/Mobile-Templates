//
//  HomepageView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Top Navigation Bar
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("DELIVERY TO")
                            .font(.caption)
                            .foregroundColor(.gray)
                        HStack {
                            Text("HayStreet, Perth")
                                .font(.headline)
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    Button(action: {
                        // Filter action
                    }) {
                        Text("Filter")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Featured Image Slider
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(featuredImages, id: \.self) { image in
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 200)
                                        .clipped()
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Featured Partners Section
                        SectionHeaderView(title: "Featured Partners")
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(featuredPartners) { partner in
                                    RestaurantHomeCard(restaurant: partner)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Free Delivery Section
                        FreeDeliveryView()
                        
                        // Best Picks RestaurantHomes by Team Section
                        SectionHeaderView(title: "Best Picks RestaurantHomes by team")
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(bestPicks) { pick in
                                    RestaurantHomeCard(restaurant: pick)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // All RestaurantHomes Section
                        SectionHeaderView(title: "All RestaurantHomes")
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(allRestaurantHomes) { restaurant in
                                RestaurantHomeCard(restaurant: restaurant)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Bottom Navigation Bar
                HStack {
                    NavigationLink(destination: HomeView()) {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink(destination: SearchView()) {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink(destination: OrdersView()) {
                        VStack {
                            Image(systemName: "bag.fill")
                            Text("Orders")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink(destination: ProfileView()) {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
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

struct ProfileView: View {
    var body: some View {
        Text("Logged Out")
    }
}
struct OrdersView: View {
    var body: some View {
        Text("Logged Out")
    }
}
struct SearchView: View {
    var body: some View {
        Text("Logged Out")
    }
}


struct SectionHeaderView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            Button(action: {
                // See all action
            }) {
                Text("See all")
                    .foregroundColor(.orange)
            }
        }
        .padding(.horizontal)
    }
}

struct FreeDeliveryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Free Delivery for 1 Month!")
                .font(.headline)
            Text("You’ve to order at least $10 for using free delivery for 1 month.")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.yellow.opacity(0.3))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct RestaurantHomeCard: View {
    var restaurant: RestaurantHome
    
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
            
            Text(restaurant.details)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
        }
    }
}

struct RestaurantHome: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let details: String
}

let featuredImages = ["image1", "image2", "image3"]
let featuredPartners = [
    RestaurantHome(imageName: "restaurant1", name: "Krispy Creme", details: "St Georgece Terrace, Perth"),
    RestaurantHome(imageName: "restaurant2", name: "Mario Italiano", details: "Hay street, Perth City")
]
let bestPicks = [
    RestaurantHome(imageName: "restaurant3", name: "McDonald's", details: "Hay street, Perth City"),
    RestaurantHome(imageName: "restaurant4", name: "The Halal Guys", details: "Hay street, Perth City")
]
let allRestaurantHomes = [
    RestaurantHome(imageName: "restaurant5", name: "McDonald's", details: "$$ · Chinese · American · Deshi food"),
    RestaurantHome(imageName: "restaurant6", name: "Cafe Brichor’s", details: "$$ · Chinese · American · Deshi food")
]

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
