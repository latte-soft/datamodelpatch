local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v9 = require(l_CorePackages_0.Workspace.Packages.GameVotesRodux);
local l_ReasonForNotVoteable_0 = v9.Enums.ReasonForNotVoteable;
local l_VoteStatus_0 = v9.Enums.VoteStatus;
local l_FetchGameVotes_0 = v9.GameVotes.FetchGameVotes;
local l_FetchUserGameVotes_0 = v9.UserGameVotes.FetchUserGameVotes;
local l_PatchUserVotes_0 = v9.UserGameVotes.PatchUserVotes;
local v15 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v16 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v17 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v18 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v19 = require(l_Modules_0.LuaApp.Components.GenericIconButton);
local v20 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v21 = require(l_Modules_0.LuaApp.Components.PrimaryStatWidget);
local l_Vote_0 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents).Vote;
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v24 = Rect.new(9, 9, 9, 9);
local v25 = v2.PureComponent:extend("GameRatings");
v25.init = function(v26)
    v26.isMounted = false;
    v26.onVoteButtonActivated = function(v27)
        local l_universeId_0 = v26.props.universeId;
        local l_networking_0 = v26.props.networking;
        local l_rootPlaceId_0 = v26.props.rootPlaceId;
        if v26.isMounted and l_rootPlaceId_0 then
            if v26.props.dataLoadSucceed then
                local l_userGameVotes_0 = v26.props.userGameVotes;
                local l_reasonForNotVoteable_0 = l_userGameVotes_0.reasonForNotVoteable;
                if not l_userGameVotes_0.canVote then
                    if l_reasonForNotVoteable_0 == l_ReasonForNotVoteable_0.PlayGame then
                        v26.props.setCurrentToastMessage({
                            toastType = v16.NetworkingError, 
                            toastMessage = "Feature.Toast.VoteError.PlayGame"
                        });
                        return ;
                    elseif l_reasonForNotVoteable_0 == l_ReasonForNotVoteable_0.FloodCheckThresholdMet then
                        v26.props.setCurrentToastMessage({
                            toastType = v16.NetworkingError, 
                            toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet"
                        });
                        return ;
                    elseif l_reasonForNotVoteable_0 == l_ReasonForNotVoteable_0.AssetNotVoteable then
                        v26.props.setCurrentToastMessage({
                            toastType = v16.NetworkingError, 
                            toastMessage = "Feature.Toast.VoteError.AssetNotVoteable"
                        });
                        return ;
                    else
                        v26.props.setCurrentToastMessage({
                            toastType = v16.NetworkingError, 
                            toastMessage = "Feature.Toast.VoteError.Default"
                        });
                        return ;
                    end;
                else
                    local l_eventIngest_0 = v26.props.eventIngest;
                    local l_userVote_0 = l_userGameVotes_0.userVote;
                    if l_userVote_0 == v27 then
                        v27 = l_VoteStatus_0.NotVoted;
                    end;
                    v26.props.patchUserVotes(l_networking_0, l_universeId_0, v27, l_userVote_0);
                    l_Vote_0(l_eventIngest_0, "GameRatings", l_rootPlaceId_0, v27, l_userVote_0);
                    return ;
                end;
            elseif v26.props.gameVotesFetchingStatus == v15.Failed then
                v26.props.dispatchFetchGameVotes(l_networking_0, l_universeId_0);
                return ;
            else
                local l_eventIngest_1 = v26.props.eventIngest;
                v26.props.patchUserVotes(l_networking_0, l_universeId_0, v27, l_VoteStatus_0.NotVoted);
                l_Vote_0(l_eventIngest_1, "GameRatings", l_rootPlaceId_0, v27, l_VoteStatus_0.NotVoted);
                return ;
            end;
        else
            return ;
        end;
    end;
    v26.onVoteUpActivated = function()
        v26.onVoteButtonActivated(l_VoteStatus_0.VotedUp);
    end;
    v26.onVoteDownActivated = function()
        v26.onVoteButtonActivated(l_VoteStatus_0.VotedDown);
    end;
end;
v25.render = function(v36)
    local l_appTheme_0 = v36.props.appTheme;
    local l_Position_0 = v36.props.Position;
    local l_LayoutOrder_0 = v36.props.LayoutOrder;
    local l_width_0 = v36.props.width;
    local l_gameVotes_0 = v36.props.gameVotes;
    local l_userGameVotes_1 = v36.props.userGameVotes;
    local l_gameVotesFetchingStatus_0 = v36.props.gameVotesFetchingStatus;
    local l_isLoading_0 = v36.props.isLoading;
    local l_dataLoadSucceed_0 = v36.props.dataLoadSucceed;
    local l_showGlobalCounters_0 = v36.props.showGlobalCounters;
    local l_localization_0 = v36.props.localization;
    local v48 = not not l_gameVotes_0 and l_gameVotes_0.upVotes or 0;
    local v49 = v48 + (not not l_gameVotes_0 and l_gameVotes_0.downVotes or 0);
    local v50 = if not l_showGlobalCounters_0 then string.upper(l_localization_0:Format("Feature.GameDetails.Label.VotesNoTotal")) else string.upper(l_localization_0:Format("Feature.GameDetails.Label.Votes", {
        votes = l_gameVotesFetchingStatus_0 == v15.Done and l_abbreviateCount_0(v49, l_localization_0:GetLocale()) or "--"
    }));
    local v51 = v49 > 0 and tostring((math.floor((v48 / v49) * 100))) .. "%" or "--";
    local v52 = (l_dataLoadSucceed_0 and l_userGameVotes_1) and l_userGameVotes_1.userVote;
    local l_withNewThemeProvider_0 = v36.props.withNewThemeProvider;
    return l_withStyle_0(function(v54)
        return v2.createElement(v20, {
            Size = UDim2.new(0, l_width_0, 0, 70), 
            Position = l_Position_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = not not l_withNewThemeProvider_0 and v54.Theme.UIEmphasis.Color or l_appTheme_0.GameDetails.Rating.Background.Color, 
            ImageTransparency = not not l_withNewThemeProvider_0 and v54.Theme.UIEmphasis.Transparency or l_appTheme_0.GameDetails.Rating.Background.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v24
        }, {
            RatingsStat = v2.createElement(v21, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                icon = "LuaApp/icons/GameDetails/rating_large", 
                number = v51, 
                label = v50, 
                font = l_appTheme_0.GameDetails.Text.BoldFont, 
                color = l_appTheme_0.GameDetails.Text.Color.Main, 
                width = (l_width_0 - 88) - 30, 
                withNewThemeProvider = l_withNewThemeProvider_0
            }), 
            VoteUp = v2.createElement(v19, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -10, 0.5, 0), 
                Size = UDim2.new(0, 44, 0, 44), 
                iconImage = v52 == l_VoteStatus_0.VotedUp and "LuaApp/icons/GameDetails/voteUpOn" or "LuaApp/icons/GameDetails/voteUpOff", 
                iconSize = UDim2.new(0, 36, 0, 36), 
                isChecked = v52 == l_VoteStatus_0.VotedUp, 
                isLoading = l_isLoading_0, 
                onActivated = v36.onVoteUpActivated, 
                withNewThemeProvider = l_withNewThemeProvider_0
            }), 
            VoteDown = v2.createElement(v19, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -64, 0.5, 0), 
                Size = UDim2.new(0, 44, 0, 44), 
                iconImage = v52 == l_VoteStatus_0.VotedDown and "LuaApp/icons/GameDetails/voteDownOn" or "LuaApp/icons/GameDetails/voteDownOff", 
                iconSize = UDim2.new(0, 36, 0, 36), 
                isChecked = v52 == l_VoteStatus_0.VotedDown, 
                isLoading = l_isLoading_0, 
                onActivated = v36.onVoteDownActivated, 
                withNewThemeProvider = l_withNewThemeProvider_0
            })
        });
    end);
end;
v25.didMount = function(v55)
    v55.isMounted = true;
end;
v25.willUnmount = function(v56)
    v56.isMounted = false;
end;
return l_RoactServices_0.connect({
    localization = v6, 
    networking = v7, 
    eventIngest = v8
})((v3.connect(function(v57, v58)
    local v59 = l_FetchGameVotes_0.GetFetchingStatus(v57, v58.universeId);
    local v60 = l_FetchUserGameVotes_0.GetFetchingStatus(v57, v58.universeId);
    local v61 = l_PatchUserVotes_0.GetPatchingStatus(v57, v58.universeId);
    local v62 = v57.GameVotes[v58.universeId];
    local v63 = v57.UserGameVotes[v58.universeId];
    local _ = nil;
    local v65 = {
        gameVotes = v62, 
        userGameVotes = v63, 
        rootPlaceId = if not not v57.GameDetails and v57.GameDetails[v58.universeId] then v57.GameDetails[v58.universeId].rootPlaceId else (v57.Games and v57.Games[v58.universeId]) and v57.Games[v58.universeId].placeId, 
        gameVotesFetchingStatus = v59
    };
    local v66 = true;
    if v59 ~= v15.Fetching then
        v66 = true;
        if v60 ~= v15.Fetching then
            v66 = v61 == v15.Fetching;
        end;
    end;
    v65.isLoading = v66;
    v65.dataLoadSucceed = v62 and v63;
    return v65;
end, function(v67)
    return {
        setCurrentToastMessage = function(v68)
            return v67(v18(v68));
        end, 
        dispatchFetchGameVotes = function(v69, v70)
            return v67(l_FetchGameVotes_0.Fetch(v69, v70));
        end, 
        patchUserVotes = function(v71, v72, v73, v74)
            return v67(l_PatchUserVotes_0.Patch(v71, v72, v73, v74));
        end
    };
end)((v17(v25)))));
