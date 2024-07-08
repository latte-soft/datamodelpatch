local _ = require(script.gameInviteModalType);
return {
    renderCoreScriptGameInviteModalContainer = require(script.renderCoreScriptGameInviteModalContainer), 
    GetCustomizedInvitePromptTrigger = require(script.utils.getCustomizedInvitePromptTrigger), 
    GameInviteModalManager = require(script.GameInviteModalManager), 
    GameInviteModal = require(script.Components.GameInviteModal), 
    GameInviteInviteExperimentVariant = require(script.GameInviteConstants).GameInviteInviteExperimentVariant, 
    GameInviteConstants = require(script.GameInviteConstants), 
    GameInviteAnalytics = require(script.analytics.GameInviteAnalytics), 
    GameInviteEvents = require(script.analytics.GameInviteEvents), 
    GameInviteAnalyticsManager = require(script.analytics.GameInviteAnalyticsManager), 
    GameInvitesStatusReducer = require(script.State.Reducers.Invites), 
    GetCanSendAndCanCustomizeInvites = require(script.Requests.GetCanSendAndCanCustomizeInvites), 
    PostSendExperienceInvite = require(script.Requests.PostSendExperienceInvite), 
    ["jest.config"] = script["jest.config"]
};
