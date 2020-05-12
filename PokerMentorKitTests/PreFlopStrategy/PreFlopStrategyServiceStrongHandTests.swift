//
//  PreFlopStrategyServiceStrongHandTests.swift
//  PokerMentorKitTests
//
//  Created by Nikita Teplyakov on 05.05.2020.
//

import XCTest
@testable import PokerMentorKit

class PreFlopStrategyServiceStrongHandTests: PreFlopStrategyServiceTests {

	lazy var hands = testHandsProvider.allStrongHands()

	// MARK: - First Round

	func testStrongHandStrategy() {
		let cards = randomHand()

		testAllFold(cards: cards, position: .early, expectedAction: .raise)
		testAllFold(cards: cards, position: .middle, expectedAction: .raise)
		testAllFold(cards: cards, position: .late, expectedAction: .raise)
		testAllFold(cards: cards, position: .smallBlind, expectedAction: .raise)
		testAllFold(cards: cards, position: .bigBlind, expectedAction: .raise)

		testOneCall(cards: cards, position: .early, expectedAction: .raise)
		testOneCall(cards: cards, position: .middle, expectedAction: .raise)
		testOneCall(cards: cards, position: .late, expectedAction: .raise)
		testOneCall(cards: cards, position: .smallBlind, expectedAction: .raise)
		testOneCall(cards: cards, position: .bigBlind, expectedAction: .raise)

		testTwoOrMoreCalls(cards: cards, position: .early, expectedAction: .raise)
		testTwoOrMoreCalls(cards: cards, position: .middle, expectedAction: .raise)
		testTwoOrMoreCalls(cards: cards, position: .late, expectedAction: .raise)
		testTwoOrMoreCalls(cards: cards, position: .smallBlind, expectedAction: .raise)
		testTwoOrMoreCalls(cards: cards, position: .bigBlind, expectedAction: .raise)

		testOneRaiseAndOtherFold(cards: cards, position: .early, expectedAction: .fold)
		testOneRaiseAndOtherFold(cards: cards, position: .middle, expectedAction: .raise)
		testOneRaiseAndOtherFold(cards: cards, position: .late, expectedAction: .raise)
		testOneRaiseAndOtherFold(cards: cards, position: .smallBlind, expectedAction: .raise)
		testOneRaiseAndOtherFold(cards: cards, position: .bigBlind, expectedAction: .raise)

		testOneRaiseAndAtLeastOneCall(cards: cards, position: .early, expectedAction: .call)
		testOneRaiseAndAtLeastOneCall(cards: cards, position: .middle, expectedAction: .call)
		testOneRaiseAndAtLeastOneCall(cards: cards, position: .late, expectedAction: .call)
		testOneRaiseAndAtLeastOneCall(cards: cards, position: .smallBlind, expectedAction: .call)
		testOneRaiseAndAtLeastOneCall(cards: cards, position: .bigBlind, expectedAction: .call)

		testMoreThanOneRaise(cards: cards, position: .early, expectedAction: .fold)
		testMoreThanOneRaise(cards: cards, position: .middle, expectedAction: .fold)
		testMoreThanOneRaise(cards: cards, position: .late, expectedAction: .fold)
		testMoreThanOneRaise(cards: cards, position: .smallBlind, expectedAction: .fold)
		testMoreThanOneRaise(cards: cards, position: .bigBlind, expectedAction: .fold)

		testOneRaise_afterFirstRound(cards: cards, expectedAction: .call)
		testMoreThanOneRaise_afterFirstRound(cards: cards, expectedAction: .call)
	}

	// MARK: - Help Methods

	func randomHand() -> [Card] {
		guard let hand = hands.randomElement() else {
			XCTFail()
			return []
		}

		return hand
	}
}
