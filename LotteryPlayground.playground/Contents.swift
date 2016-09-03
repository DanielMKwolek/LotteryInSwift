//: Playground - noun: a place where people can play

import GameplayKit

typealias Guess = (Int, Int, Int, Int, Int, powerball: Int)
typealias compareGuessReturn = (Int, Bool)

let randomNumberMaker = GKRandomDistribution.init(lowestValue: 0, highestValue: 99)

let winningNumbers = (randomNumberMaker.nextInt(),randomNumberMaker.nextInt(),randomNumberMaker.nextInt(),randomNumberMaker.nextInt(),randomNumberMaker.nextInt(),randomNumberMaker.nextInt())

func play(thingOne: Guess, thingTwo: Guess) -> compareGuessReturn
{
    var numberCorrect = 0
    var gotPowerball = false
    
    if thingOne.0 == thingTwo.0
    {
        numberCorrect += 1
    }
    if thingOne.1 == thingTwo.1
    {
        numberCorrect += 1
    }
    if thingOne.2 == thingTwo.2
    {
        numberCorrect += 1
    }
    if thingOne.3 == thingTwo.3
    {
        numberCorrect += 1
    }
    if thingOne.4 == thingTwo.4
    {
        numberCorrect += 1
    }
    if thingOne.powerball == thingTwo.powerball
    {
        numberCorrect += 1
        gotPowerball = true
    }
    return (numberCorrect, gotPowerball)
}

func returnWinnings(tenthWinningsPot: Int, winningCheck: compareGuessReturn) -> Int
{
    if winningCheck.1 == true
    {
        if winningCheck.0 == 1
        {
            return tenthWinningsPot
        } else
        {
            return 2 * (tenthWinningsPot) * (winningCheck.0 - 1)
        }
        
    } else
    {
        return (tenthWinningsPot) * winningCheck.0
    }
}

var userGuess = Guess(0,1,2,3,4,5)
let tenthWinningsPot = 1
let result = play(thingOne: userGuess, thingTwo: winningNumbers)
let winnings = returnWinnings(tenthWinningsPot: tenthWinningsPot, winningCheck: result)