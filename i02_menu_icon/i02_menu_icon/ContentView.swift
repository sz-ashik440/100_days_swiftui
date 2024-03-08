//
//  ContentView.swift
//  i02_menu_icon
//
//  Created by sz ashik on 8/3/24.
//

import SwiftUI

struct ContentView: View {
  @State var isClosed = false
  
  var body: some View {
    VStack(alignment: .center, spacing: 14) {
      RoundedRectangle(cornerRadius: 12)
        .frame(width: 64, height: 10)
        .rotationEffect(.degrees(isClosed ? 48 : 0), anchor: .leading)
      
      RoundedRectangle(cornerRadius: 12)
        .frame(width: 64, height: 10)
        .scaleEffect(isClosed ? 0.5 : 1, anchor: .leading)
        .opacity(isClosed ? 0 : 1)
      
      RoundedRectangle(cornerRadius: 12)
        .frame(width: 64, height: 10)
        .rotationEffect(.degrees(isClosed ? -48 : 0), anchor: .leading)
    }
    .foregroundStyle(.orange)
    .animation(.interpolatingSpring(stiffness: 300, damping: 15))
    .onTapGesture {
      isClosed.toggle()
    }
  }
}

//struct ContentView: View {
//  @State var isHidding = false
//  @State var isRotating = false
//  
//  var body: some View {
//    VStack(alignment: .center, spacing: 14) {
//      RoundedRectangle(cornerRadius: 12)
//        .frame(width: 64, height: 10)
//        .offset(y: isHidding ? 24 : 0)
//        .rotationEffect(.degrees(isRotating ? 48 : 0), anchor: .center)
//      
//      RoundedRectangle(cornerRadius: 12)
//        .frame(width: 64, height: 10)
//        .foregroundStyle(.blue)
//        .scaleEffect(isHidding ? 0.5 : 1)
//        .opacity(isHidding ? 0 : 1)
//      
//      RoundedRectangle(cornerRadius: 12)
//        .frame(width: 64, height: 10)
//        .offset(y: isHidding ? -24 : 0)
//        .rotationEffect(.degrees(isRotating ? -48 : 0), anchor: .center)
//        .border(.black)
//    }
//    .foregroundStyle(.orange)
//    .onTapGesture {
//      withAnimation(.easeInOut(duration: 0.3)) {
//        isHidding.toggle()
//      }
//      withAnimation(.easeInOut(duration: 0.3).delay(0.3)) {
//        isRotating.toggle()
//      }
//    }
//  }
//}

#Preview {
  ContentView()
}
