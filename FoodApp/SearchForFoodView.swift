//
//  SearchForFoodView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct SearchFoodView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                            Text("Search")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        .padding(.leading)
                        
                        Text("Top Categories")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(categoryData) { category in
                                CategoryCard(category: category)
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

struct CategoryCard: View {
    var category: Category
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("bg 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(category.name)
                .font(.headline)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
                .padding([.leading, .bottom], 8)
                
        }
    }
}

struct Category: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
}

let categoryData = [
    Category(imageName: "fast_food", name: "Fast Food"),
    Category(imageName: "breakfast_brunch", name: "Breakfast & Brunch"),
    Category(imageName: "mexican", name: "Mexican"),
    Category(imageName: "bakery", name: "Bakery"),
    Category(imageName: "deserts", name: "Deserts"),
    Category(imageName: "burgers", name: "Burgers"),
    // Add more categories as needed
]

struct SearchFoodView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFoodView()
    }
}
