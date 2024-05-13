//
//  ResetEmailSentView.swift
//  FoodApp
//
//  Created by Kobby on 11/05/2024.
//

import SwiftUI

struct ResetEmailSentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Reset email sent")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("We have sent an instructions email to ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text("sajin tamang@figma.com. ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text("Having problem?")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                
                Spacer()
                
                Button(action: {
                    // Send again action
                }) {
                    Text("SEND AGAIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Forgot Password")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct ResetEmailSentView_Previews: PreviewProvider {
    static var previews: some View {
        ResetEmailSentView()
    }
}
