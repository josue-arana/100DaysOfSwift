//
//  ContentView.swift
//  Animations
//
//  Created by Josue Arana on 2/26/22.
//
/*
 Animations can be implemented in three different ways:
    1. attached to a view: .animation( .easeInOut, value: animationAmount)
    2. attached to a binding: $animationAmount.animation( .easeInOut(duration:2).repat.....
    3. explicit: withAnimation{ ... }
 */

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        
        Button("Flag") {
            //animation here
            withAnimation {
                isPressed.toggle()
            }
        }
        .frame(width: 250, height: 175)
        .background(LinearGradient(gradient: Gradient(colors: [.orange,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .rotation3DEffect(.degrees(isPressed ? 360 : 0), axis: (x: 0, y: 1, z: 0))
        
        
//        LinearGradient(gradient: Gradient(colors: [.orange,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 250, height: 175, alignment: .center)
//            .clipShape(RoundedRectangle(cornerRadius: 40))
//            .rotation3DEffect(.degrees( isPressed ? 360 : 0), axis: (x: 0, y: 1, z: 0))
//
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 
 struct CornerRotateModifier: ViewModifier {
     let amount: Double
     let anchor: UnitPoint

     func body(content: Content) -> some View {
         content
             .rotationEffect(.degrees(amount), anchor: anchor)
             .clipped()
     }
 }
 extension AnyTransition {
     static var pivot: AnyTransition {
         .modifier(
             active: CornerRotateModifier(amount: -90, anchor: .topLeading),
             identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
         )
     }
 }
 extension Color {
     static var pageColor = Color(red: 255, green: 254, blue: 242, opacity: 0)
 }

 
 let letters = Array("Hello, SwiftUI")
 @State private var enabled = false
 @State private var dragAmount = CGSize.zero
 
 var body: some View {
     HStack(spacing: 0){
         ForEach(0..<letters.count) { num in
             Text(String(letters[num]))
                 .padding(5)
                 .font(.title)
                 .background(enabled ? .blue : .red)
                 .offset(dragAmount)
                 .animation(
                     .default.delay(Double(num)/20) ,
                     value: dragAmount)
         }
     }
     .gesture(
     DragGesture()
         .onChanged { dragAmount = $0.translation }
         .onEnded { _ in
             dragAmount = .zero
             enabled.toggle()
         }
      )
 }
 */
