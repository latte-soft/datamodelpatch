return {
    InAppAchievementManager = require(script.InAppAchievementManager), 
    InExpAchievementManager = require(script.InExpAchievementManager), 
    Reducers = {
        LocalUserGameVoteCounter = require(script.Reducers.LocalUserGameVoteCounter)
    }, 
    Requests = {
        GetUserRecentExperiences = require(script.Requests.GetUserRecentExperiences), 
        GetUserVoteCount = require(script.Requests.GetUserVoteCount), 
        GetXboxLoginConsecutiveDays = require(script.Requests.GetXboxLoginConsecutiveDays)
    }, 
    ["jest.config"] = script["jest.config"]
};
