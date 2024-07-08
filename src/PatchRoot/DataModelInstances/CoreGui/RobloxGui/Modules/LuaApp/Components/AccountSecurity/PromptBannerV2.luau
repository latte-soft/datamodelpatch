local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.DisplayType);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugShowAccountSecurityPromptBanner);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptRollout);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEmail2SVUpsellPopUpEnabled);
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled);
local v13 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSeconds);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPollingIntervalSeconds);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsVisible);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPopUpSpawnDelay);
local v17 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Helpers.GetDaysRemainingToForceResetString);
local v18 = game:DefineFastFlag("PromptBannerWaitInSmallIntervals", false);
local v19 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v20 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.GetPromptAssignments);
local v21 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v23 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v24 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v25 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v26 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.PromptConstants);
local v27 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v28 = require(l_Modules_0.Common.Roact);
local v29 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v30 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v31 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v33 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v34 = require(l_Modules_0.LuaApp.Components.Generic.TouchFriendlyIconButton);
local v35 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v36 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptTypeWithEvent);
local v37 = require(l_Modules_0.LuaApp.withLocalization);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_withStyle_0 = v4.Style.withStyle;
local v46 = nil;
local v47 = l_Images_0["icons/status/alert"];
local v48 = l_Images_0["icons/navigation/close"];
local l_Red_0 = v4.App.Style.Colors.Red;
local v50 = {
    [v27.ChangePasswordSuspectedCompromise] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.UnusualActivityDetected", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordClickHereStyled", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity"
    }, 
    [v27.ChangePasswordBreachedCredential] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.YourPasswordMightBeStolen", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.NoChangeForceReset", 
        descriptionEndSingular = "Feature.AccountSecurityPrompt.Description.NoChangeForceResetSingular", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordClickHereStyled"
    }, 
    [v27.AccountRestoresPolicyUpdate] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpdate", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.AuthenticatorSetupPromptClickHere", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyWithDate", 
        settingsTitle = "CommonUI.Features.Label.Settings"
    }, 
    [v27.AccountRestoresPolicyUpdateV2] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.KeepYourAccountSafeShort", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.AuthenticatorSetupPromptNewShort", 
        settingsTitle = "CommonUI.Features.Label.Help"
    }, 
    [v27.AccountRestoresPolicyUpdateV3] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpdateV3", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyUpdateV3Short", 
        settingsTitle = "CommonUI.Features.Label.Settings"
    }, 
    [v27.Email2SVUpsell] = {
        bannerHeader = "Feature.AccountSecurityPrompt.Header.Email2SVUpsell", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.Email2SVUpsellMessageBody", 
        settingsTitle = "CommonUI.Features.Label.Settings"
    }
};
local v51 = v28.PureComponent:extend(script.Name);
v51.defaultProps = {
    isInteractive = true
};
v51.init = function(v52)
    v52:setState({
        requestInFlightForDismissButton = false, 
        forceRenderValue = 0
    });
    v52.refreshPromptState = function()
        v52.props.getPromptAssignments(v52.props.networking):andThen(function(v53)
            local v54 = nil;
            local v55 = nil;
            local v56 = nil;
            if #v53 > 0 then
                v54 = v53[1].isGeneric;
                v55 = v27.fromRawValue(v53[1].promptType);
                if v55 ~= nil then
                    v56 = v53[1].metadata;
                elseif (v55 == nil and typeof(v53[1].metadata) == "table") and v5.fromRawValue(v53[1].metadata.displayType) ~= nil then
                    v55 = v53[1].promptType;
                    v56 = v53[1].metadata;
                    local _ = {
                        v56.headerResource, 
                        v56.bodyResource
                    };
                else
                    v54 = nil;
                end;
            end;
            if v55 ~= v52.props.promptType then
                v46 = nil;
            end;
            local v58 = v13();
            if (v58 >= 0 and v46 ~= nil) and v58 <= DateTime.now().UnixTimestamp - v46.UnixTimestamp then
                v46 = nil;
                if v52.isMounted then
                    v52:setState({
                        forceRenderValue = v52.state.forceRenderValue + 1
                    });
                end;
            end;
            v52.props.updatePromptType(v52.props.analytics, v54, v55, v56);
        end):catch(function(_)
        end):await();
    end;
    v52.disablePromptAssignment = function(v60)
        v52:setState({
            requestInFlightForDismissButton = true
        });
        v52.props.updatePromptAssignment(v52.props.networking, v52.props.promptType, not not v60 and v25.DismissPrompt or v25.DisablePrompt):andThen(function()
            v52.props.updatePromptType(v52.props.analytics, nil, nil, nil);
            v52.refreshPromptState();
            spawn(function()
                if v52.isMounted then
                    v52:setState({
                        requestInFlightForDismissButton = false
                    });
                    return ;
                else
                    return ;
                end;
            end);
        end):catch(function(_)
            if v52.isMounted then
                v52:setState({
                    requestInFlightForDismissButton = false
                });
                return ;
            else
                return ;
            end;
        end);
    end;
    v52.handlePrimary = function(v62)
        return function()
            if v52.props.promptType == v27.AccountRestoresPolicyUpdate then
                task.spawn(v52.disablePromptAssignment);
                v52.props.openWebView(v26.getWebViewUrlAccountSettings(), v62);
                return ;
            elseif v52.props.promptType == v27.AccountRestoresPolicyUpdateV2 then
                task.spawn(v52.disablePromptAssignment);
                v52.props.openWebView(v26.getWebViewUrlHelpPage(), v62);
                return ;
            elseif v52.props.promptType == v27.AccountRestoresPolicyUpdateV3 then
                v52.props.navigateToSecuritySettings();
                return ;
            elseif v52.props.promptType == v27.Email2SVUpsell then
                v52.props.openWebView(v26.getWebViewUrlEmailHighlight(), v62);
                return ;
            elseif not v52.props.isGeneric then
                v52.props.openOverlayWithModalState(v21.ChangePasswordIntro);
                return ;
            else
                return ;
            end;
        end;
    end;
    v52.handleDismissOrDisable = function()
        if ((v52.props.promptType ~= v27.AccountRestoresPolicyUpdate and v52.props.promptType ~= v27.AccountRestoresPolicyUpdateV2) and v52.props.promptType ~= v27.AccountRestoresPolicyUpdateV3) and not v52.props.isGeneric then
            if v52.props.promptType == v27.Email2SVUpsell then
                v52.disablePromptAssignment(true);
                return ;
            else
                v52.props.openOverlayWithModalState(v21.ChangePasswordDismissConfirmation);
                return ;
            end;
        else
            v52.disablePromptAssignment();
            return ;
        end;
    end;
end;
v51.didMount = function(v63)
    v63.isMounted = true;
    spawn(function()
        while not ((not v63.isMounted or not v7()) or not v8(v63.props.userId)) do
            local l_lastUpdatedPromptTypeAt_0 = v63.props.lastUpdatedPromptTypeAt;
            local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
            local v66 = nil;
            v66 = if v63.props.promptType == nil then v14() else v15();
            if not (l_lastUpdatedPromptTypeAt_0 ~= nil) or v66 * 1000 < l_UnixTimestampMillis_0 - l_lastUpdatedPromptTypeAt_0.UnixTimestampMillis then
                v63.refreshPromptState();
            end;
            if not v18 then
                wait(v66);
            else
                local v67 = os.clock() + v66;
                while not (not (os.clock() < v67) or not v63.isMounted) do
                    wait(1);
                end;
            end;
        end;
        if v63.isMounted then
            v63.props.updatePromptType(v63.props.analytics, nil, nil, nil);
        end;
    end);
end;
v51.willUnmount = function(v68)
    v68.isMounted = false;
end;
v51.wrapInFrame = function(v69, v70)
    return v28.createElement("Frame", {
        [v28.Change.AbsoluteSize] = v69.props[v28.Change.AbsoluteSize], 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = v69.props.Position, 
        Size = v69.props.Size or UDim2.fromScale(1, 0)
    }, v70);
end;
v51.renderInternal = function(v71)
    local l_isGeneric_0 = v71.props.isGeneric;
    local l_promptType_0 = v71.props.promptType;
    local l_metadata_0 = v71.props.metadata;
    local v75 = false;
    if l_metadata_0 ~= nil then
        v75 = true;
        if l_metadata_0.showBanner ~= nil then
            v75 = l_metadata_0.showBanner == false;
        end;
    end;
    local l_isInteractive_0 = v71.props.isInteractive;
    local l_designTokens_0 = v71.props.designTokens;
    local v78 = if not l_designTokens_0 then nil else l_designTokens_0.strokeColor;
    local v79 = if not l_designTokens_0 then nil else l_designTokens_0.cornerRadius;
    local l_requestInFlightForDismissButton_0 = v71.state.requestInFlightForDismissButton;
    if not (not v6() or l_promptType_0) then
        l_promptType_0 = v27.ChangePasswordSuspectedCompromise;
    end;
    local v81 = v50[l_promptType_0];
    local v82 = v10() and l_promptType_0 == v27.AuthenticatorUpsell;
    local v83 = v12() and l_promptType_0 == v27.BroaderAuthenticatorUpsell;
    local v84 = v9() and l_promptType_0 == v27.AccountRestoresPolicyUpsell;
    local v85 = v11() and l_promptType_0 == v27.Email2SVUpsell;
    if not l_isGeneric_0 then
        if not ((((not (v81 == nil) or v82) or v83) or v84) or v85 and not v75) then
            return nil;
        end;
    else
        v81 = if (l_metadata_0 ~= nil and l_metadata_0.bodyResource ~= nil) and l_metadata_0.headerResource ~= nil then {
            descriptionStart = "Feature.AccountSecurityPrompt." .. l_metadata_0.bodyResource, 
            bannerHeader = "Feature.AccountSecurityPrompt." .. l_metadata_0.headerResource
        } else {};
    end;
    local v86 = true;
    if l_isGeneric_0 then
        v86 = false;
    end;
    local v87 = l_promptType_0 ~= v27.ChangePasswordBreachedCredential;
    if (l_isGeneric_0 and typeof(l_metadata_0) == "table") and l_metadata_0.showXButtonForDisable == false then
        v87 = false;
    end;
    if not l_isInteractive_0 then
        v87 = false;
    end;
    local v88 = UDim2.new(0, 65, 0, 0);
    local v89 = UDim2.new(1, -65, 0, 0);
    local v90 = l_promptType_0 ~= v27.AccountRestoresPolicyUpdateV3;
    if (l_isGeneric_0 and typeof(l_metadata_0) == "table") and l_metadata_0.showAlertIcon == false then
        v90 = false;
    end;
    if not v90 then
        v88 = UDim2.new(0, 0, 0, 0);
        v89 = UDim2.new(1, not v87 and 0 or -15, 0, 0);
    end;
    return v28.createElement(v19.Consumer, {
        render = function(v91)
            local v92 = v91 == "Home";
            local v93 = false;
            if l_metadata_0 ~= nil then
                v93 = false;
                if l_metadata_0.pageRestriction == "PAGE_RESTRICTION_HOME_PAGE" then
                    v93 = v92 ~= true;
                end;
            end;
            if not v93 then
                local v94 = nil;
                if not v82 and not v83 then
                    if not v84 then
                        if not (not v85 or not v75) then
                            v94 = v21.Email2SVUpsell;
                        end;
                    else
                        v94 = v21.AccountRestoresPolicyUpsell;
                    end;
                else
                    v94 = v21.AuthenticatorUpsellIntro;
                end;
                if v94 ~= nil then
                    if v46 == nil then
                        local v95 = v16();
                        if v95 >= 0 then
                            task.delay(v95, function()
                                v71.props.openOverlayWithModalState(v94);
                            end);
                        else
                            v71.props.openOverlayWithModalState(v94);
                        end;
                        v46 = DateTime.now();
                    end;
                    return nil;
                else
                    return l_withStyle_0(function(v96)
                        local l_Color_0 = v96.Theme.TextLink.Color;
                        local v98 = string.format("rgb(%d, %d, %d)", math.round(l_Color_0.R * 255), math.round(l_Color_0.G * 255), (math.round(l_Color_0.B * 255)));
                        return v37(v81)(function(v99)
                            if not (((v99 ~= nil and v99.bannerHeader ~= nil) and v99.bannerHeader ~= "") and v99.descriptionStart ~= nil) or v99.descriptionStart == "" then
                                return nil;
                            else
                                local v100 = v99.descriptionStart:gsub("{styleTagStart}", "<font color=\"" .. v98 .. "\">"):gsub("{styleTagEnd}", "</font>"):gsub("{linkStart}", "<font color=\"" .. v98 .. "\">"):gsub("{linkEnd}", "</font>");
                                local v101 = v99.descriptionEnd ~= nil and v99.descriptionEnd:gsub("{styleTagStart}", "<font color=\"" .. v98 .. "\">"):gsub("{styleTagEnd}", "</font>") or nil;
                                local v102 = false;
                                if l_promptType_0 == v27.ChangePasswordBreachedCredential then
                                    v101 = v17(v99.descriptionEndSingular, v99.descriptionEnd, l_metadata_0.forceResetTimestamp);
                                elseif l_promptType_0 == v27.AccountRestoresPolicyUpdate then
                                    v102 = true;
                                    v100 = v100:gsub("{date}", DateTime.fromIsoDate(l_metadata_0.accountRestoresPolicyEffectiveTimestamp):FormatUniversalTime("D MMM YYYY", l_LocalizationService_0.RobloxLocaleId or "en-us"));
                                end;
                                return not not l_promptType_0 and {
                                    BannerFrame = v28.createElement("TextButton", {
                                        [v28.Event.Activated] = if not v86 then nil else v71.handlePrimary(v99.settingsTitle), 
                                        AutoButtonColor = l_isInteractive_0, 
                                        AutomaticSize = Enum.AutomaticSize.Y, 
                                        BackgroundColor3 = v96.Theme.SystemPrimaryContent.Color, 
                                        BackgroundTransparency = v96.Theme.SystemPrimaryContent.Transparency, 
                                        BorderSizePixel = 0, 
                                        Size = UDim2.fromScale(1, 0), 
                                        Text = "", 
                                        SelectionImageObject = v71.props.selectionCursor
                                    }, {
                                        Padding = v28.createElement("UIPadding", {
                                            PaddingLeft = UDim.new(0, 15), 
                                            PaddingRight = UDim.new(0, 15), 
                                            PaddingTop = UDim.new(0, 15), 
                                            PaddingBottom = UDim.new(0, 15)
                                        }), 
                                        BannerLeftFrame = v28.createElement("Frame", {
                                            AutomaticSize = Enum.AutomaticSize.Y, 
                                            BackgroundTransparency = 1, 
                                            BorderSizePixel = 0, 
                                            Size = UDim2.fromScale(not v87 and 1 or 0.9, 0)
                                        }, {
                                            IconFrame = v90 and v28.createElement("Frame", {
                                                BackgroundTransparency = 0, 
                                                BackgroundColor3 = l_Red_0, 
                                                BorderSizePixel = 0, 
                                                Size = UDim2.fromOffset(50, 50)
                                            }, {
                                                UICorner = v28.createElement("UICorner", {
                                                    CornerRadius = UDim.new(0, 10)
                                                }), 
                                                Icon = v28.createElement(l_ImageSetLabel_0, {
                                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                                    BackgroundTransparency = 1, 
                                                    Image = v47, 
                                                    Position = UDim2.fromScale(0.5, 0.5), 
                                                    Size = UDim2.fromOffset(36, 36)
                                                })
                                            }), 
                                            HeaderContentFrame = v28.createElement("Frame", {
                                                AutomaticSize = Enum.AutomaticSize.Y, 
                                                BackgroundTransparency = 1, 
                                                BorderSizePixel = 0, 
                                                Position = v88, 
                                                Size = v89
                                            }, {
                                                ListLayout = v28.createElement("UIListLayout", {
                                                    FillDirection = Enum.FillDirection.Vertical, 
                                                    SortOrder = Enum.SortOrder.LayoutOrder
                                                }), 
                                                Header = v28.createElement(l_StyledTextLabel_0, {
                                                    layoutOrder = 1, 
                                                    automaticSize = Enum.AutomaticSize.Y, 
                                                    colorStyle = v96.Theme.SystemPrimaryDefault, 
                                                    fontStyle = v96.Font.Header1, 
                                                    lineHeight = 1, 
                                                    size = UDim2.new(1, 0, 0, 0), 
                                                    text = v99.bannerHeader, 
                                                    textXAlignment = Enum.TextXAlignment.Left, 
                                                    textYAlignment = Enum.TextYAlignment.Top
                                                }), 
                                                Spacer = v28.createElement("Frame", {
                                                    LayoutOrder = 2, 
                                                    BackgroundTransparency = 1, 
                                                    BorderSizePixel = 0, 
                                                    Size = UDim2.fromOffset(0, 15)
                                                }), 
                                                ContentDescriptionLabel = v28.createElement(l_StyledTextLabel_0, {
                                                    layoutOrder = 3, 
                                                    automaticSize = Enum.AutomaticSize.Y, 
                                                    colorStyle = v96.Theme.TextDefault, 
                                                    fontStyle = v96.Font.Body, 
                                                    lineHeight = 1, 
                                                    size = UDim2.new(1, 0, 0, 0), 
                                                    text = (v102 or v101 == nil) and v100 or v100 .. " " .. v101, 
                                                    textXAlignment = Enum.TextXAlignment.Left, 
                                                    textYAlignment = Enum.TextYAlignment.Bottom
                                                }), 
                                                Spacer2 = not not v102 and v28.createElement("Frame", {
                                                    LayoutOrder = 4, 
                                                    BackgroundTransparency = 1, 
                                                    BorderSizePixel = 0, 
                                                    Size = UDim2.fromOffset(0, 15)
                                                }) or nil, 
                                                ContentDescriptionLabel2 = not not v102 and v28.createElement(l_StyledTextLabel_0, {
                                                    layoutOrder = 5, 
                                                    automaticSize = Enum.AutomaticSize.Y, 
                                                    colorStyle = v96.Theme.TextDefault, 
                                                    fontStyle = v96.Font.Body, 
                                                    lineHeight = 1, 
                                                    size = UDim2.new(1, 0, 0, 0), 
                                                    text = v101, 
                                                    textXAlignment = Enum.TextXAlignment.Left, 
                                                    textYAlignment = Enum.TextYAlignment.Bottom
                                                }) or nil
                                            })
                                        }), 
                                        DismissButton = not not v87 and (l_requestInFlightForDismissButton_0 and v28.createElement(l_LoadingSpinner_0, {
                                            position = UDim2.new(1, -15, 0, 15), 
                                            size = UDim2.new(0, 28, 0, 28), 
                                            anchorPoint = Vector2.new(0.5, 0.5)
                                        }) or v28.createElement(v34, {
                                            icon = v48, 
                                            iconColor = v96.Theme.TextDefault.Color, 
                                            iconPosition = UDim2.new(1, -15, 0, 15), 
                                            iconSize = 28, 
                                            iconTransparency = v96.Theme.TextDefault.Transparency, 
                                            onActivated = v71.handleDismissOrDisable, 
                                            Position = UDim2.fromScale(0.9, 0), 
                                            Size = UDim2.new(0.1, 0, 0.5, 0), 
                                            useUIBloxImageSet = true
                                        })) or nil, 
                                        UIStroke = if not v78 then nil else v28.createElement("UIStroke", {
                                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                                            Color = v78.Color3, 
                                            Transparency = v78.Transparency, 
                                            Thickness = 1
                                        }), 
                                        UICorner = if not v79 then nil else v28.createElement("UICorner", {
                                            CornerRadius = v79
                                        })
                                    })
                                } or nil;
                            end;
                        end);
                    end);
                end;
            else
                return nil;
            end;
        end
    });
end;
v51.render = function(v103)
    return v103:wrapInFrame(v103:renderInternal());
end;
v51 = l_RoactServices_0.connect({
    analytics = v29, 
    networking = v30
})((v31.connect(function(v104, _)
    return {
        lastUpdatedPromptTypeAt = v104.AccountSecurityPrompt.lastUpdatedPromptTypeAt, 
        isGeneric = v104.AccountSecurityPrompt.isGeneric, 
        promptType = v104.AccountSecurityPrompt.promptType, 
        metadata = v104.AccountSecurityPrompt.metadata, 
        userId = v104.LocalUserId
    };
end, function(v106)
    return {
        getPromptAssignments = function(v107)
            return v106(v20(v107));
        end, 
        openOverlayWithModalState = function(v108)
            return v106(v33(v24.AccountSecurityPromptOverlay, {
                modalState = v108
            }));
        end, 
        openWebView = function(v109, v110)
            return v106(v23(v109, v110));
        end, 
        navigateToSecuritySettings = function()
            v106(v22());
        end, 
        updatePromptType = function(v111, v112, v113, v114)
            return v106(v36(v111, v112, v113, v114));
        end, 
        updatePromptAssignment = function(v115, v116, v117)
            return v106(v35(v115, v116, v117));
        end
    };
end)(v51)));
return function(v118)
    return v28.createElement(v51, v3.Dictionary.join(v118, {
        designTokens = l_useDesignTokens_0().LuaApps.Banner.securityBanner, 
        selectionCursor = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect)
    }));
end;
