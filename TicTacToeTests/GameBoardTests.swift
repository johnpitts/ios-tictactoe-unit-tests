//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by John Pitts on 6/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

// There's 8 ways to win tic-tac-toe.  3 up-downs, 3 left-rifhts, 2 diagonals
    
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }
    
    func testPlacingMarks() {
        
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 0)))
        XCTAssertEqual(board[(1, 0)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 0)))
        XCTAssertEqual(board[(2, 0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 1)))
        XCTAssertEqual(board[(0, 1)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 1)))
        XCTAssertEqual(board[(1, 1)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 1)))
        XCTAssertEqual(board[(2, 1)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
        XCTAssertEqual(board[(0, 2)], .o)
        
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 2)))
        XCTAssertEqual(board[(1, 2)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .o)
        
        XCTAssertThrowsError(try board.place(mark: .x, on: (0,0))) { error in
            XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
        
    }
    
    func testIsFull() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
    }

}
