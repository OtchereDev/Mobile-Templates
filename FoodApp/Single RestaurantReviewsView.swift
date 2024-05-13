//
//  Single RestaurantReviewsView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct SingleRestaurantReviewsView: View {
    @State private var searchText: String = ""
    
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
                    
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.gray)
                            Text("Hay Street, Perth")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding()
                    }
                }
                
                // Ratings & Reviews
                VStack(alignment: .leading) {
                    HStack {
                        Text("Ratings & Reviews")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                        Button(action: {
                            // See all reviews action
                        }) {
                            Text("See all")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(reviewsData) { review in
                                ReviewRow(review: review)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                // Browse Food Button
                Button(action: {
                    // Browse food action
                }) {
                    HStack {
                        Text("BROWSE FOOD")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationBarTitle("")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct ReviewRow: View {
    var review: Review
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(review.userImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(review.userName)
                        .font(.headline)
                    HStack {
                        Text(String(format: "%.1f", review.rating))
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.orange)
                            .cornerRadius(4)
                        Text(review.text)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(review.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct Review: Identifiable {
    let id = UUID()
    let userImage: String
    let userName: String
    let rating: Double
    let text: String
    let images: [String]
}

let reviewsData = [
    Review(userImage: "user1", userName: "Susie Bridges", rating: 5.0, text: "Great food! I like this place, I think best place of Colorado. Chilling with Friends :)", images: ["food1", "food2", "food3"]),
    Review(userImage: "user2", userName: "Rodney Miller", rating: 4.8, text: "One of the best and so much good food corner in Colorado. Specially the burger, Lemonade.", images: ["food4", "food5"]),
    Review(userImage: "user3", userName: "Larry Bowers", rating: 5.0, text: "Great food! I like this place, I think best place of Colorado. Chilling with Friends :)", images: ["food6", "food7", "food8"]),
    // Add more reviews as needed
]

struct SingleRestaurantReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRestaurantReviewsView()
    }
}
