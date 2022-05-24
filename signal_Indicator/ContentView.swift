//
//  ContentView.swift
//  signal_Indicator
//
//  Created by Paulo Matos on 17/04/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isAnimating = false
	
    var body: some View {
		VStack {
			SignalIndicatorView(signalStrength: isAnimating ? 5 : 0)
				.frame(width: 100, height: 50)
				.padding()
			
			Text("Signal Indicator")
			Spacer()
		}
		.onAppear{
			withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
				isAnimating.toggle()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
