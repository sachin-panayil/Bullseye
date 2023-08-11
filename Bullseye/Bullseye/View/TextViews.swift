//
//  TextViews.swift
//  Bullseye
//
//  Created by Sachin Panayil on 7/12/23.
//

import SwiftUI

struct InstructionText: View {
  var text: String

  var body: some View {
    Text(text.uppercased())
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String

  var body: some View {
    Text(text)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String

  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct LabelText: View {
  var text: String

  var body: some View {
    Text(text.uppercased())
      .kerning(1.5)
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct BodyText: View {
  var text: String

  var body: some View {
    Text(text)
      .multilineTextAlignment(.center)
      .lineSpacing(15)
      .fontWeight(.semibold)
      .font(.subheadline)
  }
}

struct ButtonText: View {
  var text: String

  var body: some View {
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: 250, maxHeight: 60)
      .background(
        Color.accentColor
          .cornerRadius(15)
      )
      .foregroundColor(.white)
      .font(.title2)
  }
}

struct ScoreText: View {
  var score: Int

  var body: some View {
    Text(String(score))
      .kerning(-0.2)
      .bold()
      .font(.title3)

  }
}

struct DateText: View {
  var date: Date

  var body: some View {
    Text(date, style: .time)
      .kerning(-0.2)
      .bold()
      .font(.title3)
  }
}

struct BigBoldText: View {
  let text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .font(.title)
      .kerning(2)
      .fontWeight(.black)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "99")
      LabelText(text: "Score")
      BodyText(text: "You scored 200 points! \n☠️☠️☠️")
      ButtonText(text: "Start New Round")
      ScoreText(score: 459)
      DateText(date: Date())
      BigBoldText(text: "Leaderboard")
    }
    .padding()
  }
}

