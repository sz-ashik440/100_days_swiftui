//
//  ContentView.swift
//  01_100_days_gradient
//
//  Created by sz ashik on 7/3/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      LinearGradient(gradient:
                      Gradient(colors: [
                        Color(red: 67/255, green: 56/255, blue: 159/255),
                        Color(red: 78/255, green: 198/255, blue: 202/255)
                      ]),
                     startPoint: .bottomLeading,
                     endPoint: .topTrailing)
      .frame(width: 340, height: 340)
      .shadow(color: Color.black.opacity(0.3), radius: 12, x: 1, y: 5)
      
      VStack(spacing: 0) {
        HStack{
          ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 4)
              .fill(.white)
              .frame(width: 40, height: 20)
              .rotationEffect(Angle(degrees: -50))
              .offset(x: -16, y: 10)
              .shadow(color: Color.black.opacity(0.2), radius: 13, x: 0, y: 0)
            
            RoundedRectangle(cornerRadius: 4)
              .fill(.white)
              .frame(width: 24, height: 118)
              .shadow(color: Color.black.opacity(0.2), radius: 13, x: 0, y: 0)
          }
          .offset(CGSize(width: 12, height: 0.0))
          .zIndex(3)
          
          Circle()
            .stroke(.white, lineWidth: 24)
            .frame(width: 100)
            .shadow(color: Color.black.opacity(0.2), radius: 13, x: 0, y: 0)
            .zIndex(2)
          
          Circle()
            .stroke(.white, lineWidth: 24)
            .frame(width: 100)
            .shadow(color: Color.black.opacity(0.2), radius: 13, x: 0, y: 0)
            .zIndex(1)
          
        }
        
        Text("DAYS")
          .font(.custom("RussoOne-Regular", size: 96))
          .foregroundStyle(.white)
        
        Text("SwiftUI CHALLENGE")
          .font(.custom("RussoOne-Regular", size: 24))
          .foregroundStyle(.white)
      }
    }
    
  }
}

#Preview {
  ContentView()
}
