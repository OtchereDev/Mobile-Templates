//
//  Partners.swift
//  FoodApp
//
//  Created by Kobby on 06/05/2024.
//

import SwiftUI

struct Partners: View {
        
    var body: some View {
        VStack{
            Text(" Featured Partners")
                .font(.title3)
                .fontWeight(.bold)
            GeometryReader{geometry in
                ScrollView{
                    let componentWidth = geometry.size.width * 0.5;
                    VStack {
                        ZStack{

                            Image("bg 1")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 5){
                                Spacer()
                                HStack {
                                    Image("fast-clock")
                                        .scaledToFit()
                                    Text("25min")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 15))
                                }
                                HStack(spacing: 40){
                                    
                                    HStack {
                                        Image("Dollar 1")
                                        Text("Free ")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 13))
                                    }
                                    
                                    Text("4.5")
                                        .padding(5)
                                        .frame(width: 40)
                                        .background(.orange)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .cornerRadius(7)
                                        .font(.system(size: 13))
                                    
                                    
                                }
                            }
                            .padding()
                            
                        }
                        .frame(width: componentWidth)
                        VStack(alignment: .leading){
                            Text("Tacos Nanchas")
                                .font(.system(size: 22))
                                .fontWeight(.ultraLight)
                                .foregroundColor(Color.black)
                            
                            HStack{
                                Text("Chinese")
                                    .padding([.leading], 4)
                                    .fontWeight(.light)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 6))
                                    .foregroundColor(Color.gray)
                                    .padding([.leading, .trailing], 0)
                                Text("American")
                                    .padding([.leading], 4)
                                    .fontWeight(.light)
                            }
                           
                        }
                        .frame(width: componentWidth)
                    }
                }
            }
            
            
                
        }
        .padding()
       
 
        Spacer()
    }
}

struct Partners_Previews: PreviewProvider {
    static var previews: some View {
        Partners()
    }
}
