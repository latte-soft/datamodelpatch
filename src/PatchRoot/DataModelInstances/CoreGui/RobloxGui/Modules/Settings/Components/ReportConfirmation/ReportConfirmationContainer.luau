local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Promise);
local v5 = require(l_CorePackages_0.enumerate);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.withStyle;
local v7 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v10 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v11 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceARUnblockingUnmutingEnabled);
local v12 = require(script.Parent.ReportActionSelection);
local v13 = require(script.Parent.ReportActionAreYouSure);
local v14 = v5("ReportPages", {
    SelectActions = 1, 
    ConfirmAction = 2
});
local v15 = v2.PureComponent:extend("ReportConfirmationContainer");
v15.defaultProps = {
    blockingUtility = v7, 
    voiceChatServiceManager = l_default_0, 
    isVoiceReport = false, 
    closeMenu = function()
    end
};
v15.validateProps = v3.interface({
    player = v3.strictInterface({
        UserId = v3.number, 
        Name = v3.string, 
        DisplayName = v3.string
    }), 
    isVoiceReport = v3.boolean, 
    closeMenu = v3.callback, 
    blockingAnalytics = v3.optional(v3.table), 
    reportAbuseAnalytics = v3.optional(v3.table)
});
local _ = function(v16, v17)
    return v4.new(function(v18, _)
        v18(v16:IsPlayerBlockedByUserId(v17));
    end);
end;
v15.init = function(v21)
    local l_player_0 = v21.props.player;
    local l_participants_0 = v21.props.voiceChatServiceManager.participants;
    v21:setState({
        absoluteWidth = 0
    });
    if v21.props.onSizeChanged then
        v21.props.onSizeChanged:Connect(function(v24)
            v21:setState({
                absoluteWidth = v24.X
            });
        end);
    end;
    local v25 = l_participants_0[tostring(l_player_0.UserId)];
    v21.userFullName = l_player_0.DisplayName .. "(@" .. l_player_0.Name .. ")";
    v21.onMuteCheckboxActivated = function(v26)
        v21:setState({
            muteFlipped = v26
        });
    end;
    v21.onBlockCheckboxActivated = function(v27)
        v21:setState({
            blockFlipped = v27
        });
    end;
    v21.processMuteAndBlocking = function()
        local l_blockFlipped_0 = v21.state.blockFlipped;
        local l_muteFlipped_0 = v21.state.muteFlipped;
        if not l_blockFlipped_0 or v21.state.targetInitiallyBlocked then
            if not (((l_blockFlipped_0 or not v21.state.targetInitiallyBlocked) or not v11()) or not v21.props.blockingUtility:UnblockPlayerAsync(l_player_0)) then
                v21.props.blockingAnalytics:action("SettingsHub", "unblockUser", {
                    blockeeUserId = l_player_0.UserId
                });
            end;
        elseif v21.props.blockingUtility:BlockPlayerAsync(l_player_0) then
            v21.props.blockingAnalytics:action("SettingsHub", "blockUser", {
                blockeeUserId = l_player_0.UserId
            });
        end;
        local v30 = v21.props.voiceChatServiceManager.participants[tostring(l_player_0.UserId)];
        if not l_muteFlipped_0 or v21.state.targetInitiallyVoiceMuted then
            if not ((l_muteFlipped_0 or not v21.state.targetInitiallyVoiceMuted) or not v11()) then
                v21.props.blockingUtility:UnmutePlayer(l_player_0);
                v21.props.reportAbuseAnalytics:reportEventAndIncrement("unmuteUser");
                if not (not v30 or not v30.isMutedLocally) then
                    v21.props.voiceChatServiceManager:ToggleMutePlayer(l_player_0.UserId, v10.VOICE_CONTEXT_TYPE.REPORT_MENU);
                end;
            end;
        else
            v21.props.blockingUtility:MutePlayer(l_player_0);
            v21.props.reportAbuseAnalytics:reportEventAndIncrement("muteUser");
            if not (not v30 or v30.isMutedLocally) then
                v21.props.voiceChatServiceManager:ToggleMutePlayer(l_player_0.UserId, v10.VOICE_CONTEXT_TYPE.REPORT_MENU);
            end;
        end;
        v21.props.closeMenu();
    end;
    v21.onActionSelectionDoneActivated = function(v31, v32)
        v21:setState({
            blockFlipped = v31, 
            muteFlipped = v32
        });
        if not v31 and not v32 or v32 == v21.state.targetInitiallyVoiceMuted and v31 == v21.state.targetInitiallyBlocked then
            v21.processMuteAndBlocking();
            return ;
        else
            v21:setState({
                currentPage = v14.ConfirmAction
            });
            return ;
        end;
    end;
    v21.onYesOrNoConfirmation = function()
        v21.processMuteAndBlocking();
    end;
    v21.onYesOrNoCancel = function()
        v21:setState({
            currentPage = v14.SelectActions
        });
    end;
    v21:setState({
        currentPage = v14.SelectActions
    });
    if not v25 then
        v21:setState({
            targetInitiallyVoiceMuted = false, 
            muteFlipped = false
        });
    else
        v21:setState({
            targetInitiallyVoiceMuted = v25.isMutedLocally, 
            muteFlipped = v25.isMutedLocally
        });
    end;
    local l_blockingUtility_0 = v21.props.blockingUtility;
    local l_UserId_0 = l_player_0.UserId;
    v4.new(function(v35, _)
        v35(l_blockingUtility_0:IsPlayerBlockedByUserId(l_UserId_0));
    end):andThen(function(v37)
        v21:setState({
            targetInitiallyBlocked = v37, 
            blockFlipped = v37
        });
    end);
end;
v15.render = function(v38)
    return l_withStyle_0(function(_)
        local l_currentPage_0 = v38.state.currentPage;
        local v41 = 1.3;
        if v38.props.onSizeChanged then
            local l_absoluteWidth_0 = v38.state.absoluteWidth;
            v41 = l_absoluteWidth_0 >= 800 and 1.3 or (l_absoluteWidth_0 > 600 and 1 or l_absoluteWidth_0 / 600);
        end;
        local v43 = v2.createElement(v12, {
            titleText = v8:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), 
            subtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.ThankYou"), 
            instructionText = v8:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), 
            muteText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", {
                Player = v38.userFullName
            }), 
            blockText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", {
                Player = v38.userFullName
            }), 
            doneText = v8:FormatByKey("Feature.SettingsHub.Action.Report.Done"), 
            showVoiceMuting = v38.props.isVoiceReport, 
            isVoiceMuted = if v38.state.muteFlipped ~= nil then v38.state.muteFlipped else false or v38.state.targetInitiallyVoiceMuted, 
            isBlocked = if v38.state.blockFlipped ~= nil then v38.state.blockFlipped else false or v38.state.targetInitiallyBlocked, 
            onMuteCheckboxActivated = v38.onMuteCheckboxActivated, 
            onBlockCheckboxActivated = v38.onBlockCheckboxActivated, 
            onDoneActivated = v38.onActionSelectionDoneActivated, 
            uiScale = v41, 
            ZIndex = v38.props.ZIndex
        });
        local v44 = v2.createElement(v13, {
            mutedTitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutePlayer", {
                Player = v38.userFullName
            }), 
            blockedTitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockPlayer", {
                Player = v38.userFullName
            }), 
            mutedAndBlockedTitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockPlayer", {
                DisplayName = v38.userFullName
            }), 
            mutedSubtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.MutedSubtitleText", {
                Player = v38.userFullName
            }), 
            blockedSubtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.BlockedSubtitleText", {
                Player = v38.userFullName
            }), 
            mutedAndBlockedSubtitleText = v8:FormatByKey("Feature.SettingsHub.ReportSubmitted.Label.MuteAndBlockWarning", {
                Player = v38.userFullName
            }), 
            cancelText = v8:FormatByKey("InGame.InspectMenu.Action.Cancel"), 
            confirmText = v8:FormatByKey("InGame.InspectMenu.Action.Confirm"), 
            isMuted = v38.state.muteFlipped, 
            isBlocked = v38.state.blockFlipped, 
            onCancelActivated = v38.onYesOrNoCancel, 
            onConfirmActivated = v38.onYesOrNoConfirmation, 
            uiScale = v41, 
            ZIndex = v38.props.ZIndex
        });
        local v45 = nil;
        if l_currentPage_0 == v14.SelectActions then
            return v43;
        else
            if l_currentPage_0 == v14.ConfirmAction then
                v45 = v44;
            end;
            return v45;
        end;
    end);
end;
return v15;
