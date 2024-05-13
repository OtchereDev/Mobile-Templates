//
//  BrouseFoodView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct BrouseFoodView: View {
    var body: some View {
        NavigationStack {
            List {
                FoodItemView(imageName: "food1", title: "Rich Table", subtitle: "$$ · Chinese · American · Deshi food", rating: 4.3, ratingCount: "200+", time: "25 Min", price: "Free")
                FoodItemView(imageName: "food2", title: "Nethai Kitchen", subtitle: "$$ · Chinese · American · Deshi food", rating: 4.3, ratingCount: "200+", time: "25 Min", price: "Free")
                FoodItemView(imageName: "food3", title: "Mayfield Bakery & Cafe", subtitle: "$$ · Chinese · American · Deshi food", rating: 4.3, ratingCount: "200+", time: "25 Min", price: "Free")
            }
            //.navigationBarTitle("Browse Foods")
            .navigationBarItems(leading: Button(action: {
                // Action for back button
            }) {
                Image(systemName: "chevron.left")
                
                HStack {
                    Text("Browse Foods")
                        .padding(.horizontal, 100)
                        .foregroundColor(Color.black)
                        .font(.title3)
                        
                    
                }
            })
        }
    }
}

struct FoodItemView: View {
    var imageName: String
    var title: String
    var subtitle: String
    var rating: Double
    var ratingCount: String
    var time: String
    var price: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                //.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                //.clipped()
                //.resizable()
                .scaledToFit()
                .cornerRadius(10)
            
            Text(title)
                .font(.headline)
                .padding(.top, 8)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
            
            HStack {
                Text(String(format: "%.1f", rating))
                    .font(.subheadline)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(ratingCount) Ratings")
                    .font(.subheadline)
                
                Image(systemName: "clock")
                    .foregroundColor(.gray)
                Text(time)
                    .font(.subheadline)
                
                Image("Dollar")

                Text(price)
                    .font(.subheadline)
            }
            .foregroundColor(.gray)
            .padding(.bottom, 8)
        }
        .padding(.horizontal)
    }
}

struct BrouseFoodView_Previews: PreviewProvider {
    static var previews: some View {
        BrouseFoodView()
    }
}
