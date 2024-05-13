//
//  FeaturedPartnersView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct FeaturedPartnersView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(partnersData) { partner in
                            PartnerCard(partner: partner)
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Featured Partners")
                .navigationBarItems(leading: Button(action: {
                    // Back action
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                })
                
                Spacer()
                
                // Bottom Navigation Bar
                HStack {
                    NavigationLink(destination: SignInView()) {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink(destination: SignInView()) {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink(destination: SignInView()) {
                        VStack {
                            Image(systemName: "bag.fill")
                            Text("Orders")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink(destination: SignInView()) {
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
        }
    }
}

struct PartnerCard: View {
    var partner: Partner
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                Image(partner.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .cornerRadius(10)
                    .clipped()
                
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .foregroundColor(.white)
                        Text("\(partner.time) min")
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
                        Text(partner.cost)
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
                }
                .padding([.leading, .bottom], 8)
                
                Text(String(format: "%.1f", partner.rating))
                    .padding(8)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .font(.caption)
                    .cornerRadius(10)
                    .padding([.trailing, .top], 8)
            }
            
            Text(partner.name)
                .font(.headline)
                .padding(.top, 8)
            
            Text(partner.cuisine)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
        }
    }
}

struct Partner: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let cuisine: String
    let time: Int
    let cost: String
    let rating: Double
}

let partnersData = [
    Partner(imageName: "food1", name: "Tacos Nanchas", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
    Partner(imageName: "food2", name: "McDonald's", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
    Partner(imageName: "food3", name: "KFC Foods", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
    Partner(imageName: "food4", name: "Cafe MayField’s", cuisine: "Chinese · American", time: 25, cost: "Free", rating: 4.5),
    // Add more data as needed
]

struct FeaturedPartnersView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedPartnersView()
    }
}
