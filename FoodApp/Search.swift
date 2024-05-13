//
//  Search.swift
//  FoodApp
//
//  Created by Kobby on 10/05/2024.
//

extension UIApplication {
    /// Resigns the keyboard.
    ///
    /// Used for resigning the keyboard when pressing the cancel button in a searchbar based on [this](https://stackoverflow.com/a/58473985/3687284) solution.
    /// - Parameter force: set true to resign the keyboard.
    func endEditing(_ force: Bool) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.endEditing(force)
    }
}
    
struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

import SwiftUI

struct Search: View {
    @State private var searchValue = " ";
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("Search")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                    .padding(5)
                Spacer()
            }
            
            

            // Search View

            Group {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                                    
                        TextField("Search", text: $searchValue, onEditingChanged: { isEditing in self.showCancelButton = true
                                }, onCommit: {
                                        print("onCommit")
                                    }).foregroundColor(.primary)
                                    
                                    Button(action: {
                                        self.searchValue = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill").opacity(searchValue == "" ? 0 : 1)
                                    }
                                }
                                .padding(EdgeInsets(top: 15, leading: 6, bottom: 15, trailing: 6))
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10.0)
                                .padding(.vertical)
                                
                        if showCancelButton  {
                            Button("Cancel") {
                                UIApplication.shared.endEditing(true)
                                
                                    self.searchValue = ""
                                    self.showCancelButton = false
                            }
                            .foregroundColor(Color(.systemBlue))
                            .padding(0)
                        }
                    }
                .padding(.vertical, 0)
                .navigationBarHidden(showCancelButton)
                        
            }
            .navigationBarTitle("Hidden Title")
            
            
            HStack{
                Text("Top Restaurants")
                    .font(.title2)
                
                Spacer()
            }
            
            
            
            ScrollView(){
                Group{
                    VStack{
                        Image("bgsp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 190, height: 130)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading){
                            Text("Mcdonald's")
                                .font(.title3)
                                .fontWeight(.ultraLight)
                            HStack{
                                Text("$$ ")
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 6))
                                    .foregroundColor(Color.gray)
                                    .padding([.leading, .trailing], 0)
                                Text("Chinese")
                                    .padding([.leading], 4)
                                    .fontWeight(.light)
                                Spacer()
                                Text(" ")
                                
                            }
                            .frame(maxWidth: 180)
                            .padding([.top, .bottom], -11)
                        }
                        .frame(alignment: .leading)
                        .padding()
                        .padding([.top], -20)
                        .padding(.leading, 10)
                        
                        HStack{
                            
                        }
                    }
                    .frame(maxWidth: 190)
                }
            }
            
        }
        .padding()
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
