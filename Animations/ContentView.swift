//
//  ContentView.swift
//  Animations
//
//  Created by stranger on 2024-02-05.
//

import SwiftUI

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

struct ContentView: View {
	@State private var animationAmount = 0.0
	@State private var enabled = false
	@State private var dragAmount = CGSize.zero
	
	let letters = Array("Хелоу, кохана")
	
	@State private var isShowingRed = false
	
    var body: some View {
		ZStack {
			Rectangle()
				.fill(.blue)
				.frame(width: 200, height: 200)
			
			if isShowingRed {
				Rectangle()
					.fill(.red)
					.frame(width: 200, height: 200)
					.transition(.pivot)
			}
		}
		.onTapGesture {
			withAnimation {
				isShowingRed.toggle()
			}
		}
		
//		VStack {
//			Button("Tap me") {
//				withAnimation {
//					isShowingRed.toggle()
//				}
//			}
//			
//			if isShowingRed {
//				Rectangle()
//					.fill(.red)
//					.frame(width: 200, height: 100)
//					.transition(.asymmetric(insertion: .scale, removal: .opacity))
//			}
//		}
		
//		HStack(spacing: 0) {
//			ForEach(0..<letters.count, id: \.self) { num in
//				Text(String(letters[num]))
//					.padding(.vertical, 4)
//					.padding(.horizontal, 2)
//					.font(.title)
//					.background(enabled ? .blue : .red)
//					.offset(dragAmount)
//					.animation(.linear.delay(Double(num) / 20), value: dragAmount)
//			}
//		}
//		.gesture(
//			DragGesture()
//				.onChanged {
//					dragAmount = $0.translation
//				}
//				.onEnded { _ in
//					dragAmount = .zero
//					enabled.toggle()
//				}
//		)
		
//		LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//			.frame(width: 300, height: 200)
//			.clipShape(.rect(cornerRadius: 10))
//			.offset(dragAmount)
//			.gesture(
//				DragGesture()
//				.onChanged { dragAmount = $0.translation }
//					.onEnded { _ in
//						withAnimation(.bouncy) {
//							dragAmount = .zero
//						}
//					}
//			 )
//		
		
//		Button("Tap me") {
//			enabled.toggle()
//		}
//		.frame(width: 200, height: 140)
//		.background(enabled ? .blue : .gray)
//		.foregroundStyle(.white)
//		.animation(nil, value: enabled) // nil helps specify what to animate
//		.clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//		.animation(.spring(duration: 1, bounce: 0.6), value: enabled)
		
//		Button("Tap me") {
//			withAnimation(.spring(duration: 1, bounce: 0.5)) {
//				animationAmount += 360
//			}
//		}
//		.padding(24)
//		.background(.blue)
//		.foregroundColor(.white)
//		.clipShape(.capsule)
//		.rotation3DEffect(
//			.degrees(animationAmount), axis: (x: 0, y: 1, z: 0)
//		)
		
//		print(animationAmount)
//		
//		return VStack {
//			Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//			
//			Spacer()
//			
//			Button("Tap me") {
//				animationAmount += 1
//			}
//			.padding(40)
//			.background(.red)
//			.foregroundStyle(.white)
//			.clipShape(.circle)
//			.scaleEffect(animationAmount)
//			
//			Spacer()
//		}
		
//		VStack {
//			
//			Button("Tap me") {
//				//			animationAmount += 1
//			}
//			.padding(50)
//			.background(.blue)
//			.foregroundColor(.white)
//			.clipShape(.circle)
//			.overlay(
//				Circle()
//					.stroke(.blue)
//					.scaleEffect(animationAmount)
//					.opacity(2 - animationAmount)
//					.animation(
//						.spring(duration: 1)
//						.repeatForever(autoreverses: false),
//						value: animationAmount
//					)
//			)
//			.onAppear {
//				animationAmount = 2
//			}
//		}
		
    }
}

#Preview {
    ContentView()
}
