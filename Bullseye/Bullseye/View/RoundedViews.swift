//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Sachin Panayil on 7/12/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedRectViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("AccentColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedRectViewHeight)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundRectTextView: View {
  var text: String

  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(Color("AccentColor"))
      )
  }
}

struct RoundTextView: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.title3)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedRectViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("AccentColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedImageViewStroked(systemName: "list.dash")
      RoundRectTextView(text: "100")
      RoundTextView(text: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
