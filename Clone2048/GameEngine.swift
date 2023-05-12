//
//  GameEngine.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 10/05/23.
//

typealias Board = [[Int]]

import Foundation

class GameEngine {
    
    func moveBoard(direction: Direction, board: Board) -> Board {
        var resultBoard = Board()
        
        switch direction {
        case .up:
            // move all non-zero cells upwards
            resultBoard = moveColumns(direction: .up, board: board)
            
            // sum all adjacent equal tiles
            for col in 0..<resultBoard[0].count {
                for row in 1..<resultBoard.count {
                    if resultBoard[row][col] == 0 {
                        continue
                    }
                    if resultBoard[row][col] == resultBoard[row-1][col] {
                        resultBoard[row-1][col] += resultBoard[row][col]
                        resultBoard[row][col] = 0
                    }
                }
            }
            
            //move all non-zero cells upwards
            resultBoard = moveColumns(direction: .up, board: resultBoard)
            
        case .down:
            //move all non-zero cells downwards
            resultBoard = moveColumns(direction: .down, board: board)
            
            // sum all adjacent equal tiles
            for col in 0..<resultBoard[0].count {
                for row in stride(from: resultBoard.count-2, through: 0, by: -1) {
                    if resultBoard[row][col] == 0 {
                        continue
                    }
                    if resultBoard[row][col] == resultBoard[row+1][col] {
                        resultBoard[row+1][col] += resultBoard[row][col]
                        resultBoard[row][col] = 0
                    }
                }
            }
            
            //move all non-zero cells downwards
            resultBoard = moveColumns(direction: .down, board: resultBoard)
            
        case .left:
            for row in board {
                var resultRow = [Int]()
                
                // move all non-zero cells to the left
                resultRow = moveRow(direction: .left, row: row)
                
                // sum all adjacent equal tiles
                for i in 1..<resultRow.count {
                    if resultRow[i] == 0 {
                        continue
                    }
                    if resultRow[i] == resultRow [i-1] {
                        resultRow[i-1] += resultRow[i]
                        resultRow[i] = 0
                    }
                }
                
                //move all non-zero cells to the left
                resultRow = moveRow(direction: .left, row: resultRow)
                
                resultBoard.append(resultRow)
            }
            
        case .right:
            for row in board {
                var resultRow = [Int]()
                
                // move all non-zero cells to the right
                resultRow = moveRow(direction: .right, row: row)
                
                // sum all adjacent equal tiles
                for i in stride(from: resultRow.count-2, through: 0, by: -1) {
                    if resultRow[i] == 0 {
                        continue
                    }
                    if resultRow[i] == resultRow [i+1] {
                        resultRow[i+1] += resultRow[i]
                        resultRow[i] = 0
                    }
                }
                
                //move all non-zero cells to the right
                resultRow = moveRow(direction: .right, row: resultRow)
                resultBoard.append(resultRow)
            }
        default:
            resultBoard = board
        }
        return resultBoard
    }
    
    
    private func moveRow(direction: Direction, row: [Int]) -> [Int] {
        var newRow = [Int]()
        
        if direction == .left {
            for i in 0..<row.count {
                if row[i] != 0 {
                    newRow.append(row[i])
                }
            }
        } else if direction == .right {
            for i in stride(from: row.count-1, through: 0, by: -1) {
                if row[i] != 0 {
                    newRow.append(row[i])
                }
            }
        }
        
        while newRow.count < row.count {
            newRow.append(0)
        }
        
        return direction == .right ? newRow.reversed() : newRow
    }
    
    private func moveColumns(direction: Direction, board: Board) -> Board {
        var newBoard = board
        
        if direction == .up {
            for col in 0..<board[0].count {
                var newCol = [Int]()
                
                for row in 0..<board.count {
                    if board[row][col] != 0 {
                        newCol.append(board[row][col])
                    }
                }
                
                while newCol.count < board[0].count {
                    newCol.append(0)
                }
                
                for row in 0..<board.count {
                    newBoard[row][col] = newCol[row]
                }
            }
        } else if direction == .down {
            for col in 0..<board[0].count {
                var newCol = [Int]()
                
                for row in stride(from: board.count-1, through: 0, by: -1) {
                    if board[row][col] != 0 {
                        newCol.append(board[row][col])
                    }
                }
                
                while newCol.count < board[0].count {
                    newCol.append(0)
                }
                
                newCol = newCol.reversed()
                
                for row in stride(from: board.count-1, through: 0, by: -1) {
                    newBoard[row][col] = newCol[row]
                }
            }
        }
        
        
        return newBoard
    }
}
