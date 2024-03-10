//
//  ContentView.swift
//  i02_menu_icon
//
//  Created by sz ashik on 8/3/24.
//

import SwiftUI

struct ContentView: View {
  @State var isCentered = false
  @State var isRotated = false
  
  var body: some View {
    ZStack {
      Color(hex: "BFD7B5")
        .frame(width: 320, height: 320)
        .shadow(color: Color.black.opacity(0.2), radius: 12, x: 1, y: 5)
      
      ZStack() {
        RoundedRectangle(cornerRadius: 12)
          .frame(width: 64, height: 10)
          .offset(y: isCentered ? 0 : -20)
          .rotationEffect(.degrees(isRotated ? 48 : 0))
          .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 3)
        
        RoundedRectangle(cornerRadius: 12)
          .frame(width: 64, height: 10)
          .scaleEffect(isCentered ? 0.5 : 1)
          .opacity(isCentered ? 0 : 1)
          .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 3)
        
        RoundedRectangle(cornerRadius: 12)
          .frame(width: 64, height: 10)
          .offset(y: isCentered ? 0 : 20)
          .rotationEffect(.degrees(isRotated ? -48 : 0))
          .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 3)
      }
      .foregroundStyle(.white)
      .onTapGesture {
        if isCentered && isRotated {
          withAnimation(.easeInOut(duration: 0.3)) {
            isRotated.toggle()
          }
          withAnimation(.easeInOut(duration: 0.3).delay(0.3)) {
            isCentered.toggle()
          }
        } else {
          withAnimation(.easeInOut(duration: 0.3)) {
            isCentered.toggle()
          }
          withAnimation(.easeInOut(duration: 0.3).delay(0.3)) {
            isRotated.toggle()
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
