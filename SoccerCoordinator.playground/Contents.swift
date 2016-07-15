import Foundation

// create initial array of dictionaries containing each player's information
let players: [Dictionary<String, AnyObject>] = [
    ["Name": "Joe Smith", "Height": 42, "Soccer Experience": true, "Guardian Names": "Jim and Jan Smith"],
    ["Name": "Jill Tanner", "Height": 36, "Soccer Experience": true, "Guardian Names": "Clara Tanner"],
    ["Name": "Bill Bon", "Height": 43, "Soccer Experience": true,"Guardian Names": "Sara and Jenny Bon"],
    ["Name": "Eva Gordon", "Height": 45, "Soccer Experience": false, "Guardian Names": "Wendy and Mike Gordon"],
    ["Name": "Matt Gill", "Height": 40, "Soccer Experience": false, "Guardian Names": "Charles and Sylvia Gill"],
    ["Name": "Kimmy Stein", "Height": 41, "Soccer Experience": false, "Guardian Names": "Bill and Hillary Stein"],
    ["Name": "Sammy Adams", "Height": 45, "Soccer Experience": false, "Guardian Names": "Jeff Adams"],
    ["Name": "Karl Saygan", "Height": 42, "Soccer Experience": true, "Guardian Names": "Heather Bledsoe"],
    ["Name": "Suzane Greenberg", "Height": 44, "Soccer Experience": true, "Guardian Names": "Henrietta Dumas"],
    ["Name": "Sal Dali", "Height": 41, "Soccer Experience": false, "Guardian Names": "Gala Dali"],
    ["Name": "Joe Kavalier", "Height": 39, "Soccer Experience": false, "Guardian Names": "Sam and Elaine Kavalier"],
    ["Name": "Ben Finkelstein", "Height": 44, "Soccer Experience": false, "Guardian Names": "Aaron and Jill Finkelstein"],
    ["Name": "Diego Soto", "Height": 41, "Soccer Experience": true, "Guardian Names": "Robin and Sarika Soto"],
    ["Name": "Chloe Alaska", "Height": 47, "Soccer Experience": false, "Guardian Names": "David and Jamie Alaska"],
    ["Name": "Arnold Willis", "Height": 43, "Soccer Experience": false, "Guardian Names": "Claire Willis"],
    ["Name": "Phillip Helm", "Height": 44, "Soccer Experience": true, "Guardian Names": "Thomas Helm and Eva Jones"],
    ["Name": "Les Clay", "Height": 42, "Soccer Experience": true, "Guardian Names": "Wynonna Brown"],
    ["Name": "Herschel Krustofski", "Height": 45, "Soccer Experience": true, "Guardian Names": "Hyman and Rachel Krustofski"]
]

// create 3 arrays of dictionaries for 3 teams
var dragons: [Dictionary<String, AnyObject>] = []
var sharks: [Dictionary<String, AnyObject>] = []
var raptors: [Dictionary<String, AnyObject>] = []

var teams: [[Dictionary<String, AnyObject>]] = [dragons,sharks,raptors]

// create constant for practice time
let dragonsPracticeTime = "March 17 at 1pm"
let sharksPracticeTime = "March 17 at 3pm"
let raptorsPracticeTime = "March 18 at 1pm"

// return count of experienced players allocated to each team
func experiencedPlayerPerTeam(players: [Dictionary<String, AnyObject>]) -> Int
{
    var experiencedCount = 0
    for player in players
    {
        if(player["Soccer Experience"] as! Bool == true)
        {
            experiencedCount += 1
        }
    }
    return experiencedCount / 3
}

// get height average of each team
func getAvergeHeightOfPlayers(players: [Dictionary<String, AnyObject>]) -> Float
{
    var sum: Float = 0
    for player in players {
        sum += player["Height"] as! Float
    }
    if sum == 0 {
        return 0
    }
    return sum / Float(players.count)
}

// perform sorting and printing via several for-in loop and if-stmt iterating through arrays of dictionaries
func sortAndPrintLetters(players: [Dictionary<String, AnyObject>])
{
    var experiencedPlayers: [Dictionary<String, AnyObject>] = []
    var inexperiencedPlayers: [Dictionary<String, AnyObject>] = []
    let totalNumPerTeam: Int = players.count / 3
    let numExpPerTeam = experiencedPlayerPerTeam(players)
    
    // sort the players into 2 lists, experienced and inexperienced
    for player in players
    {
        if(player["Soccer Experience"] as! Bool == true)
        {
            experiencedPlayers.append(player)
        }
        else
        {
            inexperiencedPlayers.append(player)
        }
    }
    
    // sort same number of experienced players in all teams
    for player in experiencedPlayers {
        if (dragons.count < numExpPerTeam) {
            dragons.append(player)
        } else if (sharks.count < numExpPerTeam) {
            sharks.append(player)
        } else {
            raptors.append(player)
        }
    }
    
    // sort remaining number of players
    for player in inexperiencedPlayers {
        if (dragons.count < totalNumPerTeam) {
            dragons.append(player)
        } else if (sharks.count < totalNumPerTeam) {
            sharks.append(player)
        } else {
            raptors.append(player)
        }
    }
    
    // check for heights average
    getAvergeHeightOfPlayers(dragons)
    getAvergeHeightOfPlayers(sharks)
    getAvergeHeightOfPlayers(raptors)
    
    //check for difference in heights average between every 2 teams
    func checkForDiffInAvgHeight(team1 team1: [Dictionary<String, AnyObject>], team2: [Dictionary<String, AnyObject>]) -> String
    {
        if( abs(getAvergeHeightOfPlayers(team1) - getAvergeHeightOfPlayers(team2)) < 1.5)
        {
            return "\(abs(getAvergeHeightOfPlayers(team1) - getAvergeHeightOfPlayers(team2)))"
        }
        else
        {
            dragons.removeAll()
            sharks.removeAll()
            raptors.removeAll()
            
            // sort same number of experienced players in all teams
            for player in experiencedPlayers {
                if (dragons.count < numExpPerTeam) {
                    dragons.append(player)
                }
                else if (sharks.count < numExpPerTeam) {
                    sharks.append(player)
                } else {
                    raptors.append(player)
                }
            }
            
            // sort remaining number of players
            for player in inexperiencedPlayers {
                if (dragons.count < totalNumPerTeam) {
                    dragons.append(player)
                } else if (raptors.count < totalNumPerTeam) {
                    raptors.append(player)
                    
                } else {
                    sharks.append(player)
                }
            }
        }
        return "\(abs(getAvergeHeightOfPlayers(team1) - getAvergeHeightOfPlayers(team2)))"
    }
    
    //difference in heights average between teams
    checkForDiffInAvgHeight(team1: dragons,team2: sharks)
    checkForDiffInAvgHeight(team1: sharks,team2: raptors)
    checkForDiffInAvgHeight(team1: raptors,team2: dragons)
    
    //print letters to player's guardians
    for player in dragons {
        "Dear \(player["Guardian Names"] as! String), \n Your child, \(player["Name"] as! String), has been selected to play on the Dragons team in our league. Please be at practice on \(dragonsPracticeTime). \n Thank you and congratulations on making the Dragons team!"
        
    }
    for player in sharks {
        "Dear \(player["Guardian Names"] as! String), \n Your child, \(player["Name"] as! String), has been selected to play on the Sharks team in our league. Please be at practice on \(sharksPracticeTime). \n Thank you and congratulations on making the Sharks team!"
        
        
    }
    for player in raptors {
        "Dear \(player["Guardian Names"] as! String), \n Your child, \(player["Name"] as! String), has been selected to play on the Raptors team in our league. Please be at practice on \(raptorsPracticeTime). \n Thank you and congratulations on making the Raptors team!"
    }
    
}

//call function to sort and send letters
sortAndPrintLetters(players)

// 3 teams
dragons
sharks
raptors







