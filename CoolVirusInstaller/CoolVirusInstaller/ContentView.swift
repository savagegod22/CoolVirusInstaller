//
//  ContentView.swift
//  CoolVirusInstaller
//
//  Created by Aryan Sharma on 11/4/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var downloadAmount: Float = 0.0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Installing Virus...")
                .font(.title)
                .fontWeight(.bold)
            ProgressBar(value: $downloadAmount).frame(height: 20).padding()
            if downloadAmount > 1.1 {
                Text("🦠 Done ✅! Your Mac is now infected! 🦠").font(.headline)
                    .fontWeight(.bold)
            }
            
        }
        .onReceive(timer) { _ in
            withAnimation {
                if downloadAmount < 1.3 {
                    downloadAmount += 0.1
                }
                print(downloadAmount)
                if downloadAmount > 1.3 {
                    fatalError()
                }
            }
        }
        .frame(minWidth: 500, idealWidth: 500, maxWidth: 500, minHeight: 300, idealHeight: 300, maxHeight: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.lightGray))
            }.cornerRadius(45.0)
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.lightGray))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(.systemBlue))
                    .animation(.spring(response: 0.5, dampingFraction: 3, blendDuration: 0.3))
            }.cornerRadius(45.0)
        }
    }
}
