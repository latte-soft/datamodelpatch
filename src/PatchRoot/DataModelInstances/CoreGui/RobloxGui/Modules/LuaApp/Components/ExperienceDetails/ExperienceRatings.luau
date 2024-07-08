local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = require(l_Modules_0.Common.memoize);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local v18 = require(l_CorePackages_0.Workspace.Packages.GameVotesRodux);
local l_FetchGameVotes_0 = v18.GameVotes.FetchGameVotes;
local l_FetchUserGameVotes_0 = v18.UserGameVotes.FetchUserGameVotes;
local l_PatchUserVotes_0 = v18.UserGameVotes.PatchUserVotes;
local l_ReasonForNotVoteable_0 = v18.Enums.ReasonForNotVoteable;
local l_VoteStatus_0 = v18.Enums.VoteStatus;
local v24 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v25 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_VoteStates_0 = v6.App.Indicator.Enum.VoteStates;
local v27 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_Vote_0 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents).Vote;
local l_RateCount_0 = v6.App.Indicator.RateCount;
local v30 = require(script.Parent.Flags.FFlagEDPAddRatingTitle10ft);
local v31 = v3.PureComponent:extend("ExperienceRatings");
v31.validateProps = v5.interface({
    universeId = v5.string, 
    uiMode = if not v30 then nil else v5.optional(v5.string)
});
local v32 = {
    [l_VoteStatus_0.NotVoted] = l_VoteStates_0.notVoted, 
    [l_VoteStatus_0.VotedDown] = l_VoteStates_0.votedDown, 
    [l_VoteStatus_0.VotedUp] = l_VoteStates_0.votedUp
};
v31.init = function(v33)
    v33.isMounted = false;
    local v34 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v33.getVoteTexts = v11(function(v35, v36, v37)
        local v38 = nil;
        if not (not v35 or not v36) then
            v38 = v35 + v36;
        end;
        return {
            votePercentageText = (not not v38 and v38 > 0) and tostring((math.floor((v35 / v38) * 100))) .. "%" or "--", 
            totalVotesText = if not v37 then string.upper(v34:Format("Feature.GameDetails.Label.VotesNoTotal")) else string.upper(v34:Format("Feature.GameDetails.Label.Votes", {
                votes = not not v38 and l_abbreviateCount_0(v38, v34:GetLocale()) or "--"
            }))
        };
    end);
    local v39 = {
        [l_ReasonForNotVoteable_0.PlayGame] = "Feature.Toast.VoteError.PlayGame", 
        [l_ReasonForNotVoteable_0.FloodCheckThresholdMet] = "Feature.Toast.VoteError.FloodCheckThresholdMet", 
        [l_ReasonForNotVoteable_0.AssetNotVoteable] = "Feature.Toast.VoteError.AssetNotVoteable", 
        Default = "Feature.Toast.VoteError.Default"
    };
    v33.onVoteButtonActivated = function(v40)
        local l_universeId_0 = v33.props.universeId;
        local l_networking_0 = v33.props.networking;
        local l_rootPlaceId_0 = v33.props.rootPlaceId;
        if not v33.props.voteDataIsLoading then
            if v33.isMounted and l_rootPlaceId_0 then
                if v33.props.voteDataLoadSucceed then
                    local l_userGameVotes_0 = v33.props.userGameVotes;
                    local l_reasonForNotVoteable_0 = l_userGameVotes_0.reasonForNotVoteable;
                    if not l_userGameVotes_0.canVote then
                        v33.props.setCurrentToastMessage({
                            toastType = v25.NetworkingError, 
                            toastMessage = v39[l_reasonForNotVoteable_0] or v39.Default
                        });
                        return ;
                    else
                        local l_eventIngest_0 = v33.props.eventIngest;
                        local l_userVote_0 = l_userGameVotes_0.userVote;
                        if l_userVote_0 == v40 then
                            v40 = l_VoteStatus_0.NotVoted;
                        end;
                        v33.props.patchUserVotes(l_networking_0, l_universeId_0, v40, l_userVote_0);
                        l_Vote_0(l_eventIngest_0, "GameRatings", l_rootPlaceId_0, v40, l_userVote_0);
                        return ;
                    end;
                elseif v33.props.gameVotesFetchingStatus == v24.Failed then
                    v33.props.dispatchFetchGameVotes(l_networking_0, l_universeId_0);
                    return ;
                else
                    local l_eventIngest_1 = v33.props.eventIngest;
                    v33.props.patchUserVotes(l_networking_0, l_universeId_0, v40, l_VoteStatus_0.NotVoted);
                    l_Vote_0(l_eventIngest_1, "GameRatings", l_rootPlaceId_0, v40, l_VoteStatus_0.NotVoted);
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v33.onVoteUpActivated = function()
        v33.onVoteButtonActivated(l_VoteStatus_0.VotedUp);
    end;
    v33.onVoteDownActivated = function()
        v33.onVoteButtonActivated(l_VoteStatus_0.VotedDown);
    end;
end;
v31.render = function(v49)
    local l_gameVotes_0 = v49.props.gameVotes;
    local l_userGameVotes_1 = v49.props.userGameVotes;
    local l_gameVotesFetchingStatus_0 = v49.props.gameVotesFetchingStatus;
    local l_voteDataLoadSucceed_0 = v49.props.voteDataLoadSucceed;
    local v54 = l_gameVotes_0 and l_gameVotes_0.upVotes;
    local v55 = l_gameVotes_0 and l_gameVotes_0.downVotes;
    if l_gameVotesFetchingStatus_0 == v24.Done then
        v54 = v54 or 0;
        v55 = v55 or 0;
    end;
    local v56 = (l_voteDataLoadSucceed_0 and l_userGameVotes_1) and l_userGameVotes_1.userVote or l_VoteStatus_0.NotVoted;
    local v57 = v49.getVoteTexts(v54, v55, v49.props.showGlobalCounters);
    return v3.createElement(l_RateCount_0, {
        rateText = v57.votePercentageText, 
        rateLabel = v57.totalVotesText, 
        voteState = v32[v56], 
        onVoteDownActivated = v49.onVoteDownActivated, 
        onVoteUpActivated = v49.onVoteUpActivated
    });
end;
v31.didMount = function(v58)
    v58.isMounted = true;
end;
v31.willUnmount = function(v59)
    v59.isMounted = false;
end;
v31 = l_RoactAppPolicy_0.connect(function(v60)
    return {
        showGlobalCounters = v60.getShowGlobalCounters()
    };
end)((l_RoactServices_0.connect({
    networking = v8, 
    eventIngest = v9
})((v4.connect(function(v61, v62)
    local l_universeId_1 = v62.universeId;
    local v64 = l_FetchGameVotes_0.GetFetchingStatus(v61, l_universeId_1);
    local v65 = l_FetchUserGameVotes_0.GetFetchingStatus(v61, l_universeId_1);
    local v66 = l_PatchUserVotes_0.GetPatchingStatus(v61, l_universeId_1);
    local v67 = v61.GameVotes[v62.universeId];
    local v68 = v61.UserGameVotes[v62.universeId];
    local v69 = nil;
    v69 = if not not v61.GameDetails and v61.GameDetails[v62.universeId] then v61.GameDetails[v62.universeId].rootPlaceId else (v61.Games and v61.Games[v62.universeId]) and v61.Games[v62.universeId].placeId;
    local v70 = {
        gameVotesFetchingStatus = v64
    };
    local v71 = true;
    if v64 ~= v24.Fetching then
        v71 = true;
        if v65 ~= v24.Fetching then
            v71 = v66 == v24.Fetching;
        end;
    end;
    v70.voteDataIsLoading = v71;
    v70.voteDataLoadSucceed = v67 and v68;
    v70.gameVotes = v67;
    v70.userGameVotes = v68;
    v70.rootPlaceId = v69;
    return v70;
end, function(v72)
    return {
        dispatchFetchGameVotes = function(v73, v74)
            return v72(l_FetchGameVotes_0.Fetch(v73, v74));
        end, 
        patchUserVotes = function(v75, v76, v77, v78)
            return v72(l_PatchUserVotes_0.Patch(v75, v76, v77, v78));
        end, 
        setCurrentToastMessage = function(v79)
            return v72(v27(v79));
        end
    };
end)(v31)))));
local function v82(v80)
    if not (v80.uiMode == l_UiMode_0.TenFoot) then
        return v3.createElement(v31, v80);
    else
        local v81 = l_useDesignTokens_0();
        return v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v81.LuaApps.ExperienceDetails.SectionListPadding)
            }), 
            RatingsHeader = v3.createElement(l_StyledTextLabel_0, {
                text = l_useLocalization_0({
                    ratingTitle = "Feature.GameDetails.Label.Rating"
                }).ratingTitle, 
                size = UDim2.fromScale(1, 0), 
                fontStyle = v81.LuaApps.ExperienceDetails.TitleFontStyle, 
                colorStyle = v81.LuaApps.ExperienceDetails.TitleColorStyle, 
                automaticSize = Enum.AutomaticSize.Y, 
                richText = false, 
                fluidSizing = false, 
                layoutOrder = 1
            }), 
            RatingsContainer = v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ExperienceRatings = v3.createElement(v31, v80)
            })
        });
    end;
end;
if not v30 then
    return v31;
else
    return v82;
end;
