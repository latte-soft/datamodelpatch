return {
    ["jest.config"] = script.Parent["jest.config"], 
    UserSearchTile = require(script.Parent.Components.UserSearchTile), 
    ProfileInsightsContextFetchWrapper = require(script.Parent.Components.ProfileInsightsContextFetchWrapper), 
    Analytics = require(script.Parent.Analytics)
};
