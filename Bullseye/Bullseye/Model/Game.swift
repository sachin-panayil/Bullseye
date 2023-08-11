//
//  Game.swift
//  Bullseye
//
//  Created by Sachin Panayil on 6/21/23.
//

import Foundation

struct Game {
  var targetValue: Int = Int.random(in: 1...100)
  var score: Int = 0
  var round: Int = 1
  var leaderboardEntrities: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      addToLeaderboard(score: 100)
      addToLeaderboard(score: 80)
      addToLeaderboard(score: 200)
      addToLeaderboard(score: 5600)
      addToLeaderboard(score: 4)
      addToLeaderboard(score: 4842)
      addToLeaderboard(score: 100)
      addToLeaderboard(score: 80)
      addToLeaderboard(score: 200)
      addToLeaderboard(score: 5600)
      addToLeaderboard(score: 4)
      addToLeaderboard(score: 4842)
    }
  }
  
  func calculatePoints(sliderValue: Int) -> Int {
    let difference: Int = abs(sliderValue - targetValue)
    let awardedPoints: Int = 100 - difference
    
    switch difference {
    case 0:
      return awardedPoints + 100
    case 1:
      return awardedPoints + 50
    case 2:
      return awardedPoints + 50
    default:
      return awardedPoints
    }
  }
  
  mutating func startNewRound(points: Int) {
    addToLeaderboard(score: points)
    score += points
    round += 1
    targetValue = Int.random(in: 1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    targetValue = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard(score: Int) {
    leaderboardEntrities.append(LeaderboardEntry(score: score, date: Date()))
    leaderboardEntrities.sort { $0.score > $1.score }
  }
}

struct LeaderboardEntry {
  let score: Int
  let date: Date
}
