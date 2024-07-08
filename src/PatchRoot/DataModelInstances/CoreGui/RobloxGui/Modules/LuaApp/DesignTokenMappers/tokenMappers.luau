local l_CorePackages_0 = game:GetService("CorePackages");
return {
    App = require(script.Parent.appTokenMapper), 
    HomeOmniFeed = require(script.Parent.homeOmniFeedTokenMapper), 
    Search = require(script.Parent.searchTokenMapper), 
    SeeAll = require(script.Parent.seeAllTokenMapper), 
    ExperienceDetails = require(script.Parent.experienceDetailsTokenMapper), 
    EngagementScreen = require(l_CorePackages_0.Workspace.Packages.TenFootUiEngagementScreen).engagementScreenTokenMapper, 
    LoginView = require(script.Parent.loginViewTokenMapper), 
    SignUpView = require(script.Parent.signUpPageViewTokenMapper), 
    AuthCompliance = require(script.Parent.complianceTokenMapper), 
    LandingPage = require(script.Parent.landingPageTokenMapper), 
    Layout = require(script.Parent.layoutTokenMapper), 
    AbuseReporting = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAbuseReport10ft() then nil else require(l_CorePackages_0.Workspace.Packages.AbuseReporting).abuseReportingTokenMapper, 
    More = require(script.Parent.moreTokenMappers), 
    CrossDeviceLogin = require(script.Parent.crossDeviceLoginTokenMapper), 
    FriendsLanding = require(script.Parent.friendsLandingTokenMapper), 
    GamepadDisconnect = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadDisconnectTokenMapper, 
    Banner = require(script.Parent.bannerTokenMapper)
};
