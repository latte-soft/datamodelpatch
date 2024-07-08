_G.__TESTEZ_RUNNING_TEST__ = true;
local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.DiscoveryUtils)["jest.config"], 
        require(l_Parent_0.ExperienceAnalytics)["jest.config"], 
        require(l_Parent_0.GameCollectionViews)["jest.config"], 
        require(l_Parent_0.GameDetail)["jest.config"], 
        require(l_Parent_0.GameDetailRodux)["jest.config"], 
        require(l_Parent_0.GameIconRodux)["jest.config"], 
        require(l_Parent_0.GameLaunch)["jest.config"], 
        require(l_Parent_0.GamePlayButton)["jest.config"], 
        require(l_Parent_0.GameProductInfoRodux)["jest.config"], 
        require(l_Parent_0.GameTile)["jest.config"], 
        require(l_Parent_0.GameVotesRodux)["jest.config"], 
        require(l_Parent_0.NextDataExpirationTimeRodux)["jest.config"], 
        require(l_Parent_0.OtaPatchLoader)["jest.config"], 
        require(l_Parent_0.OtaPatchValidation)["jest.config"], 
        require(l_Parent_0.OtaPatchPackagesStatus)["jest.config"], 
        require(l_Parent_0.PlayabilityRodux)["jest.config"], 
        require(l_Parent_0.SocialContextToasts)["jest.config"]
    }
};
