//
//  AddToOrderView.swift
//  FoodApp
//
//  Created by Kobby on 12/05/2024.
//

import SwiftUI

struct AddToOrderView: View {
    @State private var selectedTopCookie: String? = "Cookies and Cream"
    @State private var selectedBottomCookie: String? = "Red Velvet"
    @State private var quantity: Int = 1
    
    let topCookies = ["Chocolate Chip", "Cookies and Cream", "Funfetti", "M and M", "Red Velvet", "Peanut Butter", "Snickerdoodle", "White Chocolate Macadamia"]
    let bottomCookies = ["Chocolate Chip", "Chocolate Chip", "Funfetti", "M and M", "Red Velvet", "Peanut Butter", "Snickerdoodle", "White Chocolate Macadamia"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                ZStack(alignment: .topLeading) {
                    Image("bg 1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                    
                    Button(action: {
                        // Close action
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Cookie Sandwich")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Shortbread, chocolate turtle cookies, and red velvet. 8 ounces cream cheese, softened.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("$$ · Chinese · American · Deshi food")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Group {
                        Section(header: Text("Choice of top Cookie").font(.headline)) {
                            ForEach(topCookies, id: \.self) { cookie in
                                HStack {
                                    Text(cookie)
                                    Spacer()
                                    if selectedTopCookie == cookie {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.orange)
                                    }
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedTopCookie = cookie
                                }
                            }
                        }
                        
                        Section(header: Text("Choice of Bottom Cookie").font(.headline)) {
                            ForEach(bottomCookies, id: \.self) { cookie in
                                HStack {
                                    Text(cookie)
                                    Spacer()
                                    if selectedBottomCookie == cookie {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.orange)
                                    }
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedBottomCookie = cookie
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                NavigationLink(destination: SpecialInstructionsView()) {
                    HStack {
                        Text("Add Special Instructions")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                HStack {
                    Stepper(value: $quantity, in: 1...10) {
                        Text("Quantity: \(quantity)")
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                Button(action: {
                    // Add to order action
                }) {
                    Text("ADD TO ORDER ($11.98)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
            .padding(.bottom)
        }
    }
}

struct SpecialInstructionsView: View {
    var body: some View {
        Text("Special Instructions")
    }
}

struct AddToOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddToOrderView()
    }
}
