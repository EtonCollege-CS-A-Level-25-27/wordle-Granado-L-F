//
//  Solution.swift
//  WordleTeacher
//
//  Created by Bersey, Henry - HTB on 28/09/2025.
//


struct Solution {
    
    /// 1️⃣ Return an array of Bools where each value is `true`
    /// if the letter in the guess is correct and in the correct position
    ///
    /// - Example:
    ///   - guess:  ["A", "B", "C", "D", "E"]
    ///   - answer: ["A", "X", "C", "Y", "E"]
    ///   - return: [true, false, true, false, true]
    func exactMatches(guess: [Character], answer: [Character]) -> [Bool] {
        var green: [Bool] = []
        let guessLength = guess.count
        for i in 0...guessLength - 1 {
            if guess[i] == answer[i] {
                green.append(true)
            } else {
                green.append(false)
            }
            return green
        }
        
        /// 2️⃣ Return an array of Bools where each value is `true`
        /// if the letter in the guess exists somewhere in the answer
        /// but NOT in the correct position
        ///
        /// - Only mark true if the letter is in the word AND not an exact match
        /// - Example:
        ///   - guess:  ["F", "B", "C", "D", "E"]
        ///   - answer: ["A", "C", "B", "D", "E"]
        ///   - return: [false, true, true, false, false]
        func partialMatches(guess: [Character], answer: [Character]) -> [Bool] {
            var yellow: [Bool] = []
            var partial = false
            let guessLength = guess.count
            for i in 0...guessLength - 1 {
                for j in 0...guessLength - 1 {
                    if guess[i] == answer[j] && i != j {
                        partial = true
                if j == guessLength - 1 {
                    yellow.append(partial)
                        }
                    }
                }
            }
            return yellow
        }
        
        /// 3️⃣ Return an array of emoji strings (["✅", "⚠️", "🛑"]) that show
        /// feedback for each letter in the guess:
        /// - ✅ if the letter is correct and in the correct place
        /// - ⚠️ if the letter is in the word but wrong place
        /// - 🛑 if the letter is not in the word at all
        func generateFeedback(guess: [Character], answer: [Character]) -> [String] {
            var feedback:[Character] = []
            let green = exactMatches(guess:guess, answer:answer)
            let yellow = partialMatches(guess:guess, answer:answer)
            for i in 0...guess.count - 1{
                if green[i] {
                    feedback.append("✅")
                }
                if yellow[i] {
                    feedback.append("⚠️")
                } else {
                    feedback.append("🛑")
                }
            }
            return feedback
        }
        
        /// 4️⃣ Convert an array of emoji strings into a single display string
        ///
        /// - Example:
        ///   - input: ["✅", "⚠️", "🛑"]
        ///   - return: "✅ ⚠️ 🛑"
        func arrayToDisplayString(_ arr: [String]) -> String {
            let feedback = generateFeedback
        }
        
        /// 5️⃣ Return true if ALL characters in the guess match the answer exactly
        /// (i.e., the player has guessed the full word)
        ///
        /// - Tip: Use exactMatches and check if all values are `true`
        func isWinningGuess(guess: [Character], answer: [Character]) -> Bool {
            // TODO: Check if the player has guessed all characters correctly
        }
    }

