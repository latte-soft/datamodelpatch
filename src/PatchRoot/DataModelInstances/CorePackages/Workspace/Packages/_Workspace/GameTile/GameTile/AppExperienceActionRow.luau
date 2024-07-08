local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v3 = require(l_Parent_0.RoactServiceTags);
local l_AppSessionService_0 = v3.AppSessionService;
local l_RoactNetworking_0 = v3.RoactNetworking;
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.RoactRodux);
local v8 = require(l_Parent_0.t);
local v9 = require(l_Parent_0.DiscoveryUiBloxApi);
local l_ExperienceActionRow_0 = v9.ExperienceActionRow;
local l_Images_0 = v9.Images;
local v12 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v12.SetGamePlaySession;
local l_SessionType_0 = v12.SessionType;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v16 = require(l_Parent_0.GamePlayButton);
local l_PlayButtonStates_0 = v16.PlayButtonStates;
local l_usePlayButtonState_0 = v16.usePlayButtonState;
local l_useOnPlayButtonCallback_0 = v16.useOnPlayButtonCallback;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local v23 = v6.PureComponent:extend("AppExperienceActionRow");
v23.validateProps = v8.strictInterface({
    universeId = v8.string, 
    launchExperienceEventContext = v8.optional(v8.string), 
    referralSource = v8.optional(v8.string), 
    launchSource = v8.string, 
    reportExperienceLaunched = v8.optional(v8.callback), 
    entry = v8.table, 
    openGameDetails = v8.callback, 
    horizontalPadding = v8.optional(v8.number), 
    verticalPadding = v8.optional(v8.number), 
    height = v8.optional(v8.number), 
    fetchDelayInSeconds = v8.optional(v8.number), 
    price = v8.optional(v8.number), 
    playButtonState = v8.string, 
    playabilityStatus = v8.optional(v8.table), 
    onPlayButtonActivated = v8.callback, 
    sessionService = v8.optional(v8.union(v8.Instance, v8.table)), 
    feedbackType = v8.optional(v8.string)
});
local function _(v24)
    if v24 == l_PlayButtonStates_0.Loading then
        return l_PlayButtonStates_0.Playable;
    else
        return v24;
    end;
end;
v23.init = function(v26)
    v26.onPlayPressed = function()
        if not v26:requiresPurchase() then
            if v26:isButtonEnabled() then
                l_SetGamePlaySession_0(v26.props.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
                v26.props.onPlayButtonActivated(v26.props.playButtonState, if not v26.props.reportExperienceLaunched then nil else v26.reportExperienceLaunched);
            end;
            return ;
        else
            v26.props.openGameDetails();
            return ;
        end;
    end;
    v26.reportExperienceLaunched = function()
        v26.props.reportExperienceLaunched(v26.props.entry, v26.props.referralSource, v26.props.launchSource);
    end;
end;
v23.render = function(v27)
    return l_withLocalization_0({
        privateText = "Feature.ExperienceDetails.PlayButtonText.Private"
    })(function(v28)
        return v6.createElement(l_ExperienceActionRow_0, {
            isActionable = v27:isButtonEnabled(), 
            text = v27:getButtonText(v28), 
            icon = v27:getButtonIcon(), 
            onPlayPressed = v27.onPlayPressed, 
            horizontalPadding = v27.props.horizontalPadding, 
            verticalPadding = v27.props.verticalPadding, 
            height = v27.props.height, 
            feedbackType = if not l_GetFFlagEnableUISoundAndHaptics_0() then nil else "PlayExperienceButton"
        });
    end);
end;
v23.isButtonEnabled = function(v29)
    local v30 = true;
    if v29.props.playabilityStatus ~= nil then
        v30 = true;
        if v29.props.playButtonState ~= l_PlayButtonStates_0.Playable then
            v30 = true;
            if v29.props.playButtonState ~= l_PlayButtonStates_0.Loading then
                v30 = v29:requiresPurchase();
            end;
        end;
    end;
    return v30;
end;
v23.requiresPurchase = function(v31)
    return v31.props.playButtonState == l_PlayButtonStates_0.PaidAccess;
end;
v23.isPrivate = function(v32)
    return v32.props.playButtonState == l_PlayButtonStates_0.Private;
end;
v23.getButtonText = function(v33, v34)
    if not v33:isPrivate() then
        if not v33:requiresPurchase() then
            return nil;
        else
            return (tostring(v33.props.price or "--"));
        end;
    else
        return v34.privateText;
    end;
end;
v23.getButtonIcon = function(v35)
    if not v35:isPrivate() then
        if not v35:requiresPurchase() then
            if v35:isButtonEnabled() then
                return l_Images_0["icons/common/play"];
            else
                return l_Images_0["icons/status/unavailable"];
            end;
        else
            return l_Images_0["icons/common/robux"];
        end;
    else
        return l_Images_0["icons/status/private"];
    end;
end;
local l_v23_0 = v23;
return (l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0
})((v7.connect(function(v37, v38)
    local v39 = if not v37[l_GamesProductInfoReducer_0.key] then nil else v37[l_GamesProductInfoReducer_0.key][v38.universeId];
    return {
        price = if v39 ~= nil then v39.price else nil
    };
end)(function(v40)
    local v41 = l_usePlayButtonState_0(l_useRoactService_0(l_RoactNetworking_0), v40.universeId, v40.fetchDelayInSeconds);
    local v42 = l_useOnPlayButtonCallback_0(v40.universeId, v40.referralSource, v40.launchExperienceEventContext or "PlayButton", nil, v40.launchSource or "UnknownLaunchSource");
    local l_join_0 = v1.Dictionary.join;
    local l_v40_0 = v40;
    local v45 = {
        playabilityStatus = v41.playabilityStatus, 
        onPlayButtonActivated = v42
    };
    local l_playButtonState_0 = v41.playButtonState;
    v45.playButtonState = if l_playButtonState_0 == l_PlayButtonStates_0.Loading then l_PlayButtonStates_0.Playable else l_playButtonState_0;
    return v6.createElement(l_v23_0, (l_join_0(l_v40_0, v45)));
end))));
