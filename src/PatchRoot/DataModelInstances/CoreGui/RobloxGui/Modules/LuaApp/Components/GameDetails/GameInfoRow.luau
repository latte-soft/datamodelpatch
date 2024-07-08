local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v7 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local v8 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents);
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v12 = require(l_CorePackages_0.UIBlox);
local l_ImageSetLabel_0 = v12.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v12.Style.withStyle;
local v15 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v16 = require(l_Modules_0.LuaApp.Thunks.OpenExperienceGuidelinesExplained);
local v17 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v18 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v19 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_GameDetailsSubpage_0 = v8.GameDetailsSubpage;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseVoiceExitBetaLanguage;
local l_GetFFlagEnableDetailsPageCommunityLinks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableDetailsPageCommunityLinks;
local l_GetFFlagEnableCommunityLinksClickLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityLinksClickLogging;
local v26 = v2.PureComponent:extend("GameInfoRow");
v26.defaultProps = {
    leftPadding = 0, 
    rightPadding = 0
};
v26.init = function(v27)
    v27.infoNameTextLabelRef = v2.createRef();
    v27.state = {
        buttonPressed = false
    };
    v27.onInputBegan = function(_, v29)
        if not (not (v29.UserInputState == Enum.UserInputState.Begin and (not (v29.UserInputType ~= Enum.UserInputType.Touch) or v29.UserInputType == Enum.UserInputType.MouseButton1)) or v27.state.buttonPressed) then
            v27:setState({
                buttonPressed = true
            });
        end;
    end;
    v27.onInputEnded = function()
        if v27.state.buttonPressed then
            v27:setState({
                buttonPressed = false
            });
        end;
    end;
    v27.onActivated = function()
        local l_linkPage_0 = v27.props.linkPage;
        local l_linkView_0 = v27.props.linkView;
        local l_linkUrl_0 = v27.props.linkUrl;
        if (l_linkPage_0 or l_linkView_0) or l_linkUrl_0 then
            local l_eventIngest_0 = v27.props.eventIngest;
            local l_universeId_0 = v27.props.universeId;
            if not l_linkUrl_0 then
                l_GameDetailsSubpage_0(l_eventIngest_0, "GameInfoRow", v27.props.placeId, v27.props.analyticsSubPage);
                local l_Text_0 = v27.infoNameTextLabelRef.current.Text;
                if l_linkView_0 == v9.ExperienceGuidelinesExplained then
                    v27.props.openExperienceGuidelinesExplained(l_universeId_0);
                    return ;
                elseif l_linkView_0 == v9.PassesPage then
                    v27.props.navigateDown({
                        name = v9.PassesPage, 
                        detail = l_universeId_0
                    });
                    return ;
                else
                    v27.props.navigateDown({
                        name = v9.GenericWebPage, 
                        detail = l_linkPage_0, 
                        extraProps = {
                            title = l_Text_0, 
                            transitionAnimation = v11.SlideInFromRight
                        }
                    });
                    return ;
                end;
            else
                v27.props.openLeaveRobloxAlert(function()
                    v27.props.linking:openURL(l_linkUrl_0);
                    v27.props.closeAlert();
                    if l_GetFFlagEnableCommunityLinksClickLogging_0() then
                        local l_linkClickCallback_0 = v27.props.linkClickCallback;
                        if l_linkClickCallback_0 then
                            l_linkClickCallback_0();
                        end;
                    end;
                end);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v26.render = function(v37)
    local l_GameDetails_0 = v37.props.appTheme.GameDetails;
    local l_Cells_0 = l_GameDetails_0.GameInfoList.Cells;
    local l_Size_0 = v37.props.Size;
    local l_Position_0 = v37.props.Position;
    local l_LayoutOrder_0 = v37.props.LayoutOrder;
    local l_buttonPressed_0 = v37.state.buttonPressed;
    local l_infoName_0 = v37.props.infoName;
    local l_infoData_0 = v37.props.infoData;
    local l_infoIcon_0 = v37.props.infoIcon;
    local v47 = false;
    if not l_GetFFlagUseVoiceExitBetaLanguage_0() then
        if l_GetFFlagEnableDetailsPageCommunityLinks_0() and l_infoIcon_0 == l_GuildedLogoWhiteAsset_0 then
            v47 = true;
        end;
    else
        v47 = v37.props.infoIcon ~= nil;
    end;
    local v48 = true;
    if v37.props.linkPage == nil then
        v48 = v37.props.linkView or v37.props.linkUrl;
    end;
    local l_leftPadding_0 = v37.props.leftPadding;
    local l_rightPadding_0 = v37.props.rightPadding;
    if not v48 then
        l_buttonPressed_0 = false;
    end;
    local l_withNewThemeProvider_0 = v37.props.withNewThemeProvider;
    local function v54(v52, v53)
        if not l_withNewThemeProvider_0 then
            return v2.createElement("TextLabel", {
                Size = if not v52 then UDim2.new(0.5, 0, 1, 0) else UDim2.fromScale(0, 1), 
                Position = if not v52 then UDim2.new(0.5, (v48 or v47) and -25 or 0, 0, 0) else nil, 
                TextTruncate = if not v52 then nil else Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_GameDetails_0.Text.Font, 
                TextColor3 = l_GameDetails_0.Text.Color.Main, 
                Text = l_infoData_0, 
                TextSize = 22, 
                TextXAlignment = if not v52 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                AutomaticSize = if not v52 then nil else Enum.AutomaticSize.X
            });
        else
            return v2.createElement("TextLabel", {
                Size = if not v52 then UDim2.new(0.5, 0, 1, 0) else UDim2.fromScale(0, 1), 
                Position = if not v52 then UDim2.new(0.5, (v48 or v47) and -25 or 0, 0, 0) else nil, 
                TextTruncate = if not v52 then nil else Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = v53.Font.Header2.Font, 
                TextSize = v53.Font.BaseSize * v53.Font.Header2.RelativeSize, 
                TextColor3 = v53.Theme.TextEmphasis.Color, 
                TextTransparency = v53.Theme.TextEmphasis.Transparency, 
                Text = l_infoData_0, 
                TextXAlignment = if not v52 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                AutomaticSize = if not v52 then nil else Enum.AutomaticSize.X
            });
        end;
    end;
    local v55 = 0;
    if not ((not l_GetFFlagEnableDetailsPageCommunityLinks_0() or not v47) or not v48) then
        v55 = -25;
    end;
    return l_withStyle_0(function(v56)
        return v2.createElement("ImageButton", {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AutoButtonColor = false, 
            LayoutOrder = l_LayoutOrder_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = not not l_buttonPressed_0 and l_Cells_0.Background.Transparency.Pressed or l_Cells_0.Background.Transparency.Default, 
            BackgroundColor3 = l_Cells_0.Background.Color, 
            [v2.Event.InputBegan] = v37.onInputBegan, 
            [v2.Event.InputEnded] = v37.onInputEnded, 
            [v2.Event.Activated] = v37.onActivated
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_leftPadding_0), 
                PaddingRight = UDim.new(0, l_rightPadding_0)
            }), 
            InfoIcon = v47 and (l_withNewThemeProvider_0 and v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 20, 0, 20), 
                Position = UDim2.new(1, -17 + v55, 0.5, -10), 
                Image = v37.props.infoIcon, 
                ImageColor3 = v56.Theme.IconEmphasis.Color, 
                ImageTransparency = v56.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }) or v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 20, 0, 20), 
                Position = UDim2.new(1, -20 + v55, 0.5, -10), 
                Image = v37.props.infoIcon, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            })), 
            InfoNameTextLabel = not not l_withNewThemeProvider_0 and v2.createElement(v7, {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = v56.Font.Body.Font, 
                TextSize = v56.Font.BaseSize * v56.Font.Body.RelativeSize, 
                TextColor3 = v56.Theme.TextDefault.Color, 
                TextTransparency = v56.Theme.TextDefault.Transparency, 
                Text = l_infoName_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [v2.Ref] = v37.infoNameTextLabelRef
            }) or v2.createElement(v7, {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_GameDetails_0.Text.Font, 
                TextColor3 = l_GameDetails_0.Text.Color.Secondary, 
                Text = l_infoName_0, 
                TextSize = 22, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [v2.Ref] = v37.infoNameTextLabelRef
            }), 
            InfoDataTextLabelVerifiedBadge = v37.props.useVerifiedBadgeEmojiWrapper and v2.createElement(v19.EmojiWrapper, {
                emoji = not v37.props.useVerifiedBadgeEmojiWrapper and "" or v19.emoji.verified, 
                size = UDim2.new(0.5, 0, 1, 0), 
                position = UDim2.new(1, not v48 and 0 or -25, 0, 0), 
                anchorPoint = Vector2.new(1, 0), 
                automaticSize = Enum.AutomaticSize.None, 
                horizontalAlignment = Enum.HorizontalAlignment.Right, 
                verticalAlignment = Enum.VerticalAlignment.Center
            }, {
                InfoDataTextLabel = v54(true, v56)
            }), 
            InfoDataTextLabel = not v37.props.useVerifiedBadgeEmojiWrapper and v54(false, v56), 
            LinkArrow = v48 and (l_withNewThemeProvider_0 and v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 14, 0, 14), 
                Position = UDim2.new(1, -14, 0.5, -7), 
                Image = l_GetImageData_0("LuaApp/icons/navigation/pushRight_small") or "LuaApp/icons/navigation/pushRight_small", 
                ImageColor3 = v56.Theme.IconEmphasis.Color, 
                ImageTransparency = v56.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }) or v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 14, 0, 14), 
                Position = UDim2.new(1, -14, 0.5, -7), 
                Image = l_GetImageData_0("LuaApp/icons/navigation/pushRight_small") or "LuaApp/icons/navigation/pushRight_small", 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }))
        });
    end);
end;
return l_RoactServices_0.connect({
    eventIngest = v5, 
    linking = l_AppLinking_0
})((v3.connect(nil, function(v57)
    return {
        navigateDown = function(v58)
            return v57(v10(v58));
        end, 
        openExperienceGuidelinesExplained = function(v59)
            v57(v16(v59));
        end, 
        openLeaveRobloxAlert = function(v60)
            v57(v17(v60));
        end, 
        closeAlert = function()
            v57(v18());
        end
    };
end)((v15(v26)))));
