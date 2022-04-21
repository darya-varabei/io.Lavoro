//
//  SlideOverView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 22.04.22.
//

import Foundation
import SwiftUI

struct SlideOverView<Content: View>: View {
  @GestureState var dragState = DragState.inactive
  
  @Binding var position: ViewPosition
  
  var isHalfScreenHeight: Bool
    
  var isHalfScreenAvailable: Bool = false
  
  var isFullScreenAvailable: Bool = true

  var handleOption: SlideOverHandle.SlideOverHandleOption = .regular
  
  var content: () -> Content
  
  private let cornerRadius: CGFloat = 20.0
  
  var body: some View {
    let drag = DragGesture()
      .updating($dragState) { drag, state, _ in
        if !(handleOption == .staticWithoutHandler ||
             handleOption == .staticWithHandler) {
          state = .dragging(translation: drag.translation)
        }
      }
      .onEnded { dragState in
        if !(handleOption == .staticWithoutHandler ||
            handleOption == .staticWithHandler) {
          onDragEnded(drag: dragState)
        }
      }
    
    return VStack {
      if handleOption != .blur {
        SlideOverHandle(handleOption: handleOption)
          .padding(.vertical, 5)
      }
      self.content()
      Spacer()
    }
    .frame(minWidth: UIScreen.main.bounds.width,
           idealWidth: UIScreen.main.bounds.width,
           maxWidth: UIScreen.main.bounds.width)
    .overlay(
        SlideOverHandle(handleOption: handleOption)
        //.isHidden(handleOption != .blur), alignment: .top
    )
    .background(Color.customWhite)
    .cornerRadius(cornerRadius)
    .shadow(color: Color.gray, radius: 5.0)
    .offset(y: position.offset(dragState: dragState))
    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0), value: position.offset(dragState: dragState))
    .gesture(drag)
  }
  
  private func onDragEnded(drag: DragGesture.Value) {
    let verticalDirection = drag.predictedEndLocation.y - drag.location.y
    let cardTopEdgeLocation = self.position.height + drag.translation.height
    let topPosition: ViewPosition = isFullScreenAvailable ? .top : .halfScreen
    let positionAbove: ViewPosition = isHalfScreenHeight ? .halfScreen : topPosition
    let positionMiddle: ViewPosition = .halfScreen
    let positionBelow: ViewPosition = .bottom
    let closestPosition: ViewPosition
    
    if (cardTopEdgeLocation - positionAbove.height) < (positionBelow.height - cardTopEdgeLocation) {
      closestPosition = positionAbove
    } else {
      closestPosition = positionBelow
    }
    
    if verticalDirection > 0 {
      if position == positionMiddle || (!isHalfScreenAvailable && position == positionAbove) {
        self.position = positionBelow
      } else if isHalfScreenAvailable {
        self.position = positionMiddle
      }
    } else if verticalDirection < 0 {
      if position == positionMiddle || (!isHalfScreenAvailable && position == positionBelow) {
        self.position = positionAbove
      } else if isHalfScreenAvailable {
        self.position = positionMiddle
      }
    } else {
      self.position = closestPosition
    }
  }
}

enum ViewPosition: Equatable {
  case top
  case halfScreen
  case bottom
  case hidden
  case custom(CGFloat)

  var height: CGFloat {
    switch self {
    case .top:
      return 0.98
    case .halfScreen:
      return 0.5
    case .bottom:
      return 0.4
    case .hidden:
      return 0
    case .custom(height: let height):
      return height
    }
  }

  func offset(dragState: DragState) -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let offset = screenHeight - (screenHeight * CGFloat(self.height)) + dragState.translation.height
    return offset
  }
  
  var coveringPortionOfScreen: Double {
    return self.height * UIScreen.main.bounds.height
  }
}

enum DragState {
  case inactive
  case dragging(translation: CGSize)
  
  var translation: CGSize {
    switch self {
    case .inactive:
      return .zero
    case .dragging(let translation):
      return translation
    }
  }
  
  var isDragging: Bool {
    switch self {
    case .inactive:
      return false
    case .dragging:
      return true
    }
  }
}

struct SlideOverHandle: View {

  var handleOption: SlideOverHandleOption = .regular
  
  private let handleThickness = CGFloat(4.0)

  private var handleCornerRadius: CGFloat {
    handleThickness / 2
  }

  @ViewBuilder
  var body: some View {
    switch handleOption {
    case .blur:
      ZStack {
        BackgroundBlurView(alpha: ViewConstants.blurAlpha)

        RoundedRectangle(cornerRadius: handleCornerRadius)
          .frame(width: ViewConstants.slideOverHandleWidth, height: handleThickness)
          .foregroundColor(Color.customWhite)
          .padding(.vertical, ViewConstants.slideOverHandleVaerticalPadding)

      }
      .frame(maxWidth: .infinity, maxHeight: ViewConstants.blurHeight)
    case .regular, .staticWithHandler:
      RoundedRectangle(cornerRadius: handleCornerRadius)
        .frame(width: ViewConstants.slideOverHandleWidth, height: handleThickness)
        .foregroundColor(Color.customWhite)
        .padding(5)
    case .staticWithoutHandler:
      EmptyView()
    }
  }
}

extension SlideOverHandle {
  enum SlideOverHandleOption {
    case staticWithoutHandler
    case staticWithHandler
    case blur
    case regular
  }

  enum ViewConstants {
    static let slideOverHandleWidth: CGFloat = 40
    static let slideOverHandleVaerticalPadding: CGFloat = 10

    static let blurAlpha: CGFloat = 0.9
    static let blurHeight: CGFloat = 28
  }
}

struct BackgroundBlurView: UIViewRepresentable {
  
  let style: UIBlurEffect.Style
  let alpha: CGFloat
  
  init(style: UIBlurEffect.Style = .light, alpha: CGFloat = 1.0) {
    self.style = style
    self.alpha = alpha
  }
  
  func makeUIView(context: Context) -> UIView {
    let blurEffect = UIBlurEffect(style: style)
    let view = UIVisualEffectView(effect: blurEffect)
    DispatchQueue.main.async {
      view.superview?.superview?.backgroundColor = .clear
    }
    if alpha > 1 || alpha < 0 {
      view.alpha = 1
    }
    view.alpha = alpha
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {}
}
