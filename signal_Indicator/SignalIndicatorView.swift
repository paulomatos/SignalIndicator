//
//  SignalIndicatorView.swift
//  signal_Indicator
//
//  Created by Paulo Matos on 17/04/22.
//

import SwiftUI

struct SignalIndicatorView: View {
	
	var signalStrength = 1
	
    var body: some View {
		ZStack {
			SignalShape()
				.fill(.gray)
			
			SignalShape(count: signalStrength)
				.fill(.black)
		}
    }
}

struct SignalIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        SignalIndicatorView()
    }
}

struct SignalShape: Shape {
	
	var count = 5
	
	var animatableData: Double {
		get { Double (count) }
		set { count = Int(newValue.rounded())}
			  
	}
			  
	func path(in rect: CGRect) -> Path {
		var path = Path()
		let maxRectWidth = (Int(rect.maxX) / 5)
			
		for i in 0..<5 {
			if i < count {
				let startX = (i * maxRectWidth)
				let height = Int (Int (rect.maxY) / 5 * (i + 1))
				
				let roundedRect = CGRect(
					x: startX,
					y: Int(rect.maxY) - height,
					width: maxRectWidth - 4,
					height: height
				)
				
				path.addRoundedRect (in: roundedRect, cornerSize: CGSize(width: 5, height: 5))
				
			}
		}
		return path
	}
}

