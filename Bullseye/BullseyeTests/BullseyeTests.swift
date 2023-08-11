//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Sachin Panayil on 6/26/23.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
  var game: Game!

    override func setUpWithError() throws {
      game = Game()
    }

    override func tearDownWithError() throws {
      game = nil
    }
  
  func testScorePositive() {
    let guess = game.targetValue + 5
    let score = game.calculatePoints(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.targetValue - 5
    let score = game.calculatePoints(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testNewRound() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)
  }
  
  func testScoreExact() {
    let guess = game.targetValue
    let score = game.calculatePoints(sliderValue: guess)
    XCTAssertEqual(score, 200)
  }
  
  func testScoreClose() {
    let guess = game.targetValue + 2
    let score = game.calculatePoints(sliderValue: guess)
    XCTAssertEqual(score, 98 + 50)
  }
  
  func testRestart() {
    game.startNewRound(points: 100)
    XCTAssertNotEqual(game.score, 0)
    XCTAssertNotEqual(game.round, 1)
    game.restart()
    XCTAssertEqual(game.score, 0)
    XCTAssertEqual(game.round, 1)
  }
  
  func testLeaderboard() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.leaderboardEntrities.count, 1)
    XCTAssertEqual(game.leaderboardEntrities[0].score, 100)
    game.startNewRound(points: 200)
    XCTAssertEqual(game.leaderboardEntrities.count, 2)
    XCTAssertEqual(game.leaderboardEntrities[0].score, 200)
    XCTAssertEqual(game.leaderboardEntrities[1].score, 100)
  }
  

}
