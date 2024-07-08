return {
    Container = require(script.Parent.TopBarContainer), 
    PageContent = require(script.Parent.TopBarPageContent), 
    PageWrapper = require(script.Parent.TopBarPageWrapper), 
    makeBackButton = require(script.Parent.Buttons.makeBackButton), 
    BackButton = require(script.Parent.Buttons.BackButton), 
    BuyRobuxButton = require(script.Parent.Buttons.BuyRobuxButton), 
    NotificationsButton = require(script.Parent.Buttons.NotificationsButton), 
    SearchButton = require(script.Parent.Buttons.SearchButton), 
    AddFriendsPageButton = if not require(game:GetService("CorePackages").Workspace.Packages.SocialCommon).Experiments.NewChatTabExperimentation.default.isEnabled() then nil else require(script.Parent.Buttons.AddFriendsPageButton), 
    selectTopBarHeight = require(script.Parent.Utils.selectTopBarHeight), 
    selectTopBarHeightNoBanners = require(script.Parent.Utils.selectTopBarHeightNoBanners), 
    Constants = require(script.Parent.TopBarConstants), 
    getIconButtonSize = require(script.Parent.Utils.getIconButtonSize), 
    GridConfig = require(script.Parent.Utils.TopBarGridConfig)
};
