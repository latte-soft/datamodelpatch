local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Dependencies);
local v9 = require(v8.BarOnTopScrollingFrame);
local v10 = require(v8.Divider);
local v11 = require(v8.PlayerCell);
local v12 = require(v8.PlayerSearchPredicate);
local v13 = require(v8.SearchBar);
local _ = require(v8.ThemedTextLabel);
local v15 = require(v8.withLocalization);
local v16 = require(l_Parent_0.Actions.NavigateBack);
local v17 = require(l_Parent_0.Actions.EndReportFlow);
local v18 = require(l_Parent_0.Actions.SelectReportListing);
local _ = require(l_Parent_0.Resources.Assets);
local v20 = require(l_Parent_0.Resources.Constants);
local v21 = require(l_Parent_0.Components.ModalDialog);
local v22 = require(l_Parent_0.Components.GameCell);
local v23 = require(l_Parent_0.Utility.SendAnalytics);
local v24 = require(l_Parent_0.Utility.SessionUtility);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v27 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v28 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v29 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v30 = require(l_CorePackages_0.Packages.React);
local l_Colors_0 = v5.App.Style.Colors;
local l_HeaderBar_0 = v5.App.Bar.HeaderBar;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_Provider_0 = v5.Core.Style.Provider;
local l_Images_0 = v5.App.ImageSet.Images;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_isPlayerVerified_0 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges).isPlayerVerified;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local v41 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }
};
local v42 = v3.PureComponent:extend("ReportMenu");
local function v44(v43)
    if v30.useContext(v28.Context).voiceEnabled then
        return v30.createElement(v27, v2.Dictionary.join(v43, {}));
    else
        return nil;
    end;
end;
v42.validateProps = v6.strictInterface({
    isReportMenuOpen = v6.boolean, 
    screenSize = v6.Vector2, 
    closeDialog = v6.callback, 
    openReportDialog = v6.callback, 
    canNavigateBack = v6.boolean, 
    reportCategory = v6.optional(v6.string), 
    navigateBack = v6.optional(v6.callback)
});
v42.init = function(v45)
    v45.scrollingFrameRef = v3.createRef();
    v45.state = {
        isFilterMode = false, 
        filterText = nil
    };
    v45.onSearch = function()
        v45:setState({
            isFilterMode = true, 
            filterText = ""
        });
    end;
    v45.onTextChanged = function(v46)
        v45:setState({
            filterText = v46
        });
    end;
    v45.onCancel = function()
        v45:setState({
            isFilterMode = false, 
            filterText = v3.None
        });
    end;
    v45.scrollToTop = function()
        local v47 = v45.scrollingFrameRef:getValue();
        if v47 then
            v47:scrollToTop();
        end;
    end;
    v45.navigateBack = function()
        v45.props.navigateBack(v45.state.filterText ~= nil);
    end;
    v45.closeDialog = function()
        v45.props.closeDialog(v45.state.filterText ~= nil);
    end;
    v45.layoutBindings = {};
    v45.getLayoutBinding = function(v48, v49)
        local v50 = v45.layoutBindings[v48];
        if not v50 then
            local v51, v52 = v3.createBinding(v49);
            v50 = {
                valueBinding = v51, 
                setValue = v52, 
                value = v49
            };
            v45.layoutBindings[v48] = v50;
        end;
        if v50.value ~= v49 then
            v50.value = v49;
            v50.setValue(v49);
        end;
        return v50.valueBinding;
    end;
    v45.playerIsVoiceActive = function(v53)
        return l_default_0.participants[tostring(v53)] ~= nil;
    end;
    v45.sortedUserIds = {};
end;
local function v56(v54, v55)
    return v54.DisplayName:lower() < v55.DisplayName:lower();
end;
v42.getPlayerList = function(v57)
    local v58 = {};
    for _, v60 in ipairs((v2.List.sort(l_Players_0:GetPlayers(), v56))) do
        if not (v60 == l_Players_0.LocalPlayer) then
            if v57.state.isFilterMode then
                if v12(v57.state.filterText, v60.Name, v60.DisplayName) then
                    table.insert(v58, v60);
                end;
            else
                table.insert(v58, v60);
            end;
        end;
    end;
    return (v2.List.sort(v58, function(v61, v62)
        return v61.DisplayName:lower() < v62.DisplayName:lower();
    end));
end;
local v63 = {
    [v20.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat", 
    [v20.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat", 
    [v20.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other"
};
v42.categoryTitle = function(v64)
    return v63[v64.props.reportCategory] or "CoreScripts.InGameMenu.Report.MenuTitle";
end;
v42.renderHeaderBar = function(v65)
    local v66 = nil;
    v66 = not v65.props.canNavigateBack and function()
        return v3.createElement(l_IconButton_0, {
            iconSize = l_IconSize_0.Medium, 
            icon = l_Images_0["icons/navigation/close"], 
            onActivated = v65.closeDialog
        });
    end or if l_GetFFlagUIBloxUseNewHeaderBar_0() then l_makeBackButton_0(v65.navigateBack) else l_HeaderBar_0.renderLeft.backButton(v65.navigateBack);
    if v65.state.isFilterMode then
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(24, 6), 
            Size = UDim2.new(1, -48, 1, -12)
        }, {
            v3.createElement(v13, {
                size = UDim2.fromScale(1, 1), 
                text = v65.state.filterText, 
                autoCaptureFocus = true, 
                onTextChanged = v65.onTextChanged, 
                onCancelled = v65.onCancel
            })
        });
    else
        return v15({
            titleText = v65:categoryTitle()
        })(function(v67)
            return v3.createElement(l_HeaderBar_0, {
                backgroundTransparency = 1, 
                barHeight = 48, 
                renderLeft = v66, 
                renderRight = function()
                    return v3.createElement(l_IconButton_0, {
                        iconSize = l_IconSize_0.Medium, 
                        icon = l_Images_0["icons/common/search"], 
                        onActivated = v65.onSearch
                    });
                end, 
                onHeaderActivated = v65.scrollToTop, 
                title = v67.titleText
            });
        end);
    end;
end;
v42.renderContents = function(v68)
    local l_props_0 = v68.props;
    local v70 = v68.props.reportCategory == v20.Category.Voice;
    local v71 = 0;
    local v72 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    if not v68.state.isFilterMode and v68.props.reportCategory == v20.Category.None then
        v72.GameCell = v3.createElement(v22, {
            gameId = game.GameId, 
            layoutOrder = v68.getLayoutBinding("GameCell", v71), 
            onActivated = function()
                l_props_0.openReportDialog(v20.ReportType.Place, nil);
            end
        });
    end;
    v71 = v71 + 1;
    local v73 = 72;
    local v74 = v68:getPlayerList();
    local v75 = {};
    if v70 then
        v75 = l_default_0:getRecentUsersInteractionData();
    end;
    v68.sortedUserIds = {};
    for _, v77 in pairs(v74) do
        local v78 = tostring(v77.UserId);
        if not (v70 and not v75[tostring(v77.UserId)]) then
            table.insert(v68.sortedUserIds, v77.UserId);
            local v79 = 0;
            if v70 then
                v79 = v79 + 1;
            end;
            if v68.props.isReportMenuOpen then
                v79 = v79 + 2;
            end;
            v72["Divider" .. v78] = v3.createElement(v10, {
                LayoutOrder = v68.getLayoutBinding("Divider" .. v78, v71), 
                Size = UDim2.new(1, 0, 0, 1)
            });
            v71 = v71 + 1;
            v72["PlayerCell" .. v78] = v3.createElement(v11, {
                userId = v77.UserId, 
                username = v77.Name, 
                displayName = v77.DisplayName, 
                hasVerifiedBadge = l_isPlayerVerified_0(v77), 
                isOnline = true, 
                isSelected = false, 
                LayoutOrder = v68.getLayoutBinding("PlayerCell" .. v78, v71), 
                onActivated = function()
                    l_props_0.openReportDialog(v20.ReportType.Player, v77);
                end, 
                memoKey = v79
            }, {
                VoiceIndicator = (not not v70 and v68.props.isReportMenuOpen) and v3.createElement(v44, {
                    userId = tostring(v77.UserId), 
                    hideOnError = true, 
                    iconStyle = "SpeakerLight", 
                    size = UDim2.fromOffset(36, 36), 
                    onClicked = function()
                        l_default_0:ToggleMutePlayer(v77.UserId, v29.VOICE_CONTEXT_TYPE.REPORT_MENU);
                    end
                }) or nil
            });
            v71 = v71 + 1;
            v73 = v73 + 73;
        end;
    end;
    v72.DividerEnd = v3.createElement(v10, {
        LayoutOrder = v68.getLayoutBinding("DividerEnd", v71), 
        Size = UDim2.new(1, 0, 0, 1)
    });
    v71 = v71 + 1;
    return l_withStyle_0(function(v80)
        return v3.createElement(l_Provider_0, {
            style = v2.Dictionary.join(v80, {
                Theme = v2.Dictionary.join(v80.Theme, v41)
            })
        }, {
            v3.createElement(v9, {
                Size = UDim2.fromScale(1, 1), 
                CanvasSize = UDim2.new(1, 0, 0, v73), 
                scrollingFrameRef = v68.scrollingFrameRef
            }, v72)
        });
    end);
end;
v42.render = function(v81)
    return v3.createFragment({
        ModalDialog = v3.createElement(v21, {
            visible = v81.props.isReportMenuOpen, 
            screenSize = v81.props.screenSize, 
            headerBar = v81:renderHeaderBar(), 
            showCloseButton = not (v81.props.reportCategory ~= nil), 
            contents = v81:renderContents(), 
            onDismiss = v81.closeDialog
        })
    });
end;
v42.didUpdate = function(v82, v83)
    if not (not v83.isReportMenuOpen or v82.props.isReportMenuOpen) then
        v82:setState({
            isFilterMode = false, 
            filterText = v3.None
        });
        local v84 = v82.scrollingFrameRef:getValue();
        if v84 and v84.CanvasPosition.Y > 0 then
            v84.CanvasPosition = Vector2.new(0, 0);
        end;
    end;
end;
return v4.UNSTABLE_connect2(function(v85, _)
    return {
        isReportMenuOpen = v85.report.currentPage == v20.Page.Listing, 
        screenSize = v85.displayOptions.screenSize, 
        reportCategory = v85.report.reportCategory, 
        canNavigateBack = #v85.report.history > 1
    };
end, function(v87)
    return {
        navigateBack = function(v88)
            v87(v16());
            v23(v20.Page.Listing, v20.Analytics.ReportFlowBack, {
                source = v20.Page.Listing, 
                filterTextChanged = v88
            });
        end, 
        closeDialog = function(v89)
            v87(v17());
            v23(v20.Page.Listing, v20.Analytics.ReportFlowAbandoned, {
                source = v20.Page.Listing, 
                filterTextChanged = v89
            });
            v24.endAbuseReportSession();
        end, 
        openReportDialog = function(v90, v91, v92)
            v87(v18(v90, v91, v92));
            v23(v20.Page.Listing, v20.Analytics.ReportFlowAdvance, {
                source = v20.Page.Listing, 
                reportType = v90
            });
        end
    };
end)(v42);
