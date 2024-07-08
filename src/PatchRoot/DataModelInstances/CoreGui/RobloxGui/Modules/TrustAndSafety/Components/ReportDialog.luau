local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Dependencies);
local v8 = require(v7.GameIcon);
local v9 = require(v7.PlayerCell);
local v10 = require(v7.ThemedTextLabel);
local v11 = require(v7.withLocalization);
local v12 = require(v7.playerInterface);
local v13 = require(l_Parent_0.Actions.NavigateBack);
local v14 = require(l_Parent_0.Actions.EndReportFlow);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = require(l_Parent_0.Thunks.SendReport);
local v17 = require(l_Parent_0.Components.TextEntryField);
local v18 = require(l_Parent_0.Components.ModalDialog);
local v19 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialog);
local v20 = require(l_Parent_0.Components.ReportAnything.ScreenshotFlowStepHandler);
local v21 = require(l_Parent_0.Utility.SendAnalytics);
local v22 = require(l_Parent_0.Utility.SessionUtility);
local v23 = require(l_Parent_0.Utility.ScreenshotHelper);
local v24 = require(l_Parent_0.Flags.GetFFlagReportAnythingScreenshot);
local v25 = require(l_Parent_0.Flags.GetFFlagReportAnythingMultistepScreenshot);
local v26 = require(l_Parent_0.Actions.ScreenshotAnnotated);
local v27 = require(l_Parent_0.Thunks.FilterIdentifiedAvatars);
local l_Provider_0 = v5.Core.Style.Provider;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ButtonStack_0 = v5.App.Button.ButtonStack;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Colors_0 = v5.App.Style.Colors;
local l_DropdownMenu_0 = v5.App.Menu.DropdownMenu;
local l_isPlayerVerified_0 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges).isPlayerVerified;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v37 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v38 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v39 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v40 = require(l_CorePackages_0.Packages.React);
local function v42(v41)
    if v40.useContext(v38.Context).voiceEnabled then
        return v40.createElement(v37, v1.Dictionary.join(v41, {}));
    else
        return nil;
    end;
end;
local v43 = {
    "Swearing", 
    "Inappropriate Username", 
    "Bullying", 
    "Scamming", 
    "Dating", 
    "Cheating/Exploiting", 
    "Personal Question", 
    "Offsite Links"
};
local v44 = {
    BackgroundDefault = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnHover = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }, 
    BackgroundOnPress = {
        Color = l_Colors_0.Flint, 
        Transparency = 1
    }
};
local v45 = v2.PureComponent:extend("ReportDialog");
v45.validateProps = v4.strictInterface({
    isReportDialogOpen = v4.boolean, 
    reportType = v4.optional(v4.valueOf(v15.ReportType)), 
    targetPlayer = v4.optional(v12), 
    placeName = v4.string, 
    screenSize = v4.Vector2, 
    screenshotAnnotationPoints = v4.array(v4.Vector2), 
    navigateBack = v4.optional(v4.callback), 
    canNavigateBack = v4.optional(v4.boolean), 
    sendReport = v4.callback, 
    closeDialog = v4.optional(v4.callback), 
    screenshotAnnotated = v4.optional(v4.callback), 
    reportCategory = v4.optional(v4.string), 
    currentPage = v4.string
});
v45.init = function(v46)
    v46.state = {
        reasonText = nil, 
        descriptionText = ""
    };
    v46.onReasonChanged = function(v47)
        v46:setState({
            reasonText = v47
        });
    end;
    v46.onTextChanged = function(v48)
        v46:setState({
            descriptionText = v48
        });
    end;
    v46.onReport = function(v49, v50)
        v46.props.sendReport(v46.props.reportType, v46.props.targetPlayer, v46:getReason(), v46.state.descriptionText, v46.props.reportCategory, v49, v50);
    end;
    v46.navigateBack = function()
        v46.props.navigateBack(v46.state.reasonText, v46.state.descriptionText ~= "");
    end;
    v46.onCancel = function()
        v46.props.closeDialog(v46.state.reasonText, v46.state.descriptionText ~= "");
    end;
    v46.onScreenshotAnnotated = function(v51)
        v46.props.screenshotAnnotated(v46.props.reportCategory, v46.props.reportType, v51);
    end;
end;
v45.getReason = function(v52)
    if v52.props.reportType == v15.ReportType.Player then
        return v52.state.reasonText;
    elseif v52.props.reportType == v15.ReportType.Place then
        return "Inappropriate Content";
    else
        return nil;
    end;
end;
v45.canReport = function(v53)
    local v54 = v53:getReason() ~= nil;
    local v55 = utf8.len(utf8.nfcnormalize(v53.state.descriptionText));
    local v56 = false;
    if v55 >= 0 then
        v56 = v55 <= 160;
    end;
    return v54 and v56;
end;
v45.renderPlayerInfo = function(v57)
    local v58 = v57.props.reportCategory == v15.Category.Voice;
    return l_withStyle_0(function(v59)
        local v60 = v1.Dictionary.join(v59, {
            Theme = v1.Dictionary.join(v59.Theme, v44)
        });
        local v61 = 0;
        if not (not v58 or not v57.props.isReportDialogOpen) then
            v61 = v61 + 1;
        end;
        return v2.createElement(l_Provider_0, {
            style = v60
        }, {
            v2.createElement(v9, {
                userId = v57.props.targetPlayer.UserId, 
                username = v57.props.targetPlayer.Name, 
                displayName = v57.props.targetPlayer.DisplayName, 
                hasVerifiedBadge = l_isPlayerVerified_0(v57.props.targetPlayer), 
                isOnline = true, 
                isSelected = false, 
                LayoutOrder = 1, 
                key = tostring(v57.props.targetPlayer.UserId), 
                memoKey = v61
            }, {
                VoiceIndicator = (not not v58 and v57.props.isReportDialogOpen) and v2.createElement(v42, {
                    userId = tostring(v57.props.targetPlayer.UserId), 
                    hideOnError = true, 
                    iconStyle = "SpeakerLight", 
                    size = UDim2.fromOffset(36, 36), 
                    onClicked = function()
                        l_default_0:ToggleMutePlayer(v57.props.targetPlayer.UserId, v39.VOICE_CONTEXT_TYPE.REPORT_MENU);
                    end
                }) or nil
            })
        });
    end);
end;
v45.renderDropDownMenu = function(v62)
    if v62.props.isReportDialogOpen then
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, 72), 
            Size = UDim2.new(1, 0, 0, 48), 
            ZIndex = 10
        }, {
            DropDown = v11({
                menu1 = "CoreScripts.InGameMenu.Report.AbuseSwearing", 
                menu2 = "CoreScripts.InGameMenu.Report.AbuseUsername", 
                menu3 = "CoreScripts.InGameMenu.Report.AbuseBullying", 
                menu4 = "CoreScripts.InGameMenu.Report.AbuseScamming", 
                menu5 = "CoreScripts.InGameMenu.Report.AbuseDating", 
                menu6 = "CoreScripts.InGameMenu.Report.AbuseExploiting", 
                menu7 = "CoreScripts.InGameMenu.Report.AbusePersonalQuestion", 
                menu8 = "CoreScripts.InGameMenu.Report.AbuseOffsiteLink", 
                placeHolderText = "CoreScripts.InGameMenu.Report.AbuseTypePlaceHolder"
            })(function(v63)
                local v64 = {};
                local v65 = {};
                for v66, v67 in ipairs(v43) do
                    local v68 = v63["menu" .. tostring(v66)];
                    table.insert(v64, {
                        text = v68
                    });
                    v65[v68] = v67;
                end;
                return v2.createElement(l_DropdownMenu_0, {
                    placeholder = v63.placeHolderText, 
                    onChange = function(v69)
                        v62.onReasonChanged(v65[v69]);
                    end, 
                    height = UDim.new(0, 48), 
                    screenSize = v62.props.screenSize, 
                    cellDatas = v64, 
                    showDropShadow = true, 
                    fixedListHeight = 171
                });
            end)
        });
    else
        return nil;
    end;
end;
v45.renderPlayerContents = function(v70)
    return v11({
        placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
    })(function(v71)
        return v2.createFragment({
            PlayerInfo = v70:renderPlayerInfo(), 
            DropDownMenu = v70:renderDropDownMenu(), 
            TextField = v2.createElement(v17, {
                enabled = v70.props.isReportDialogOpen, 
                text = v70.state.descriptionText, 
                textChanged = v70.onTextChanged, 
                maxTextLength = 160, 
                autoFocusOnEnabled = false, 
                PlaceholderText = v71.placeHolderText, 
                Position = UDim2.fromOffset(0, 132), 
                Size = UDim2.new(1, 0, 1, -132)
            })
        });
    end);
end;
v45.renderPlaceContents = function(v72)
    return v11({
        labelText = {
            "CoreScripts.InGameMenu.Report.ReportingGame"; 
            RBX_NAME = v72.props.placeName
        }, 
        placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
    })(function(v73)
        return v2.createFragment({
            PlaceInfo = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(0, 24), 
                Size = UDim2.new(1, 0, 0, 64)
            }, {
                GameIcon = v2.createElement(v8, {
                    gameId = game.GameId, 
                    iconSize = 64, 
                    cornerRadius = UDim.new(0, 8)
                }), 
                Label = v2.createElement(v10, {
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, -76, 0, 40), 
                    Text = v73.labelText, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            TextField = v2.createElement(v17, {
                enabled = v72.props.isReportDialogOpen, 
                text = v72.state.descriptionText, 
                textChanged = v72.onTextChanged, 
                maxTextLength = 160, 
                autoFocusOnEnabled = false, 
                PlaceholderText = v73.placeHolderText, 
                Position = UDim2.fromOffset(0, 112), 
                Size = UDim2.new(1, 0, 1, -112)
            })
        });
    end);
end;
v45.renderContents = function(v74)
    if v74.props.reportType == v15.ReportType.Player then
        return v74:renderPlayerContents();
    elseif v74.props.reportType == v15.ReportType.Place then
        return v74:renderPlaceContents();
    else
        return nil;
    end;
end;
local v75 = {
    [v15.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat", 
    [v15.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat", 
    [v15.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other", 
    [v15.Category.Experience] = "CoreScripts.InGameMenu.Report.Title.Experience"
};
v45.categoryTitle = function(v76)
    if v76.props.reportType == v15.ReportType.Place then
        return v75[v15.Category.Experience];
    else
        return v75[v76.props.reportCategory] or "CoreScripts.InGameMenu.Report.ReportTitle";
    end;
end;
v45.render = function(v77)
    return v11({
        titleText = v77:categoryTitle(), 
        cancelText = "CoreScripts.InGameMenu.Cancel", 
        reportText = "CoreScripts.InGameMenu.Report.SendReport", 
        toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport", 
        toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription"
    })(function(v78)
        if v24() and v77.props.currentPage == v15.Page.ScreenshotDialog then
            if not v25() then
                return v40.createElement(v19, {
                    screenshot = v23:GetScreenshotContentId(), 
                    titleText = "Highlight What's Wrong", 
                    backAction = if not v77.props.canNavigateBack then nil else v77.navigateBack, 
                    dismissAction = v77.onCancel, 
                    reportAction = v77.onScreenshotAnnotated, 
                    initialAnnotationPoints = v77.props.screenshotAnnotationPoints
                });
            else
                return v40.createElement(v20, {
                    dismissAction = v77.onCancel, 
                    titleText = "Highlight What's Wrong", 
                    entryPoint = "experience", 
                    screenshot = v23:GetScreenshotContentId(), 
                    skipAnnotationAction = function()
                    end, 
                    restartAction = function()
                    end, 
                    reportAction = function()
                    end
                });
            end;
        else
            return v2.createElement(v18, {
                visible = v77.props.isReportDialogOpen, 
                screenSize = v77.props.screenSize, 
                titleText = v78.titleText, 
                contents = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    Contents = v77:renderContents()
                }), 
                actionButtons = v2.createElement(l_ButtonStack_0, {
                    buttonHeight = 48, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v77.onCancel, 
                                text = v78.cancelText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isDisabled = not v77:canReport(), 
                                onActivated = function()
                                    return v77.onReport(v78.toastDefaultTitle, v78.toastDefaultDescription);
                                end, 
                                text = v78.reportText
                            }
                        }
                    }
                }), 
                onDismiss = v77.onCancel, 
                onBackButtonActivated = if not v77.props.canNavigateBack then nil else v77.navigateBack
            });
        end;
    end);
end;
v45.didUpdate = function(v79, v80)
    if not (not v80.isReportDialogOpen or v79.props.isReportDialogOpen) then
        v79:setState({
            reasonText = v2.None, 
            descriptionText = ""
        });
    end;
end;
return v3.UNSTABLE_connect2(function(v81, _)
    return {
        reportCategory = v81.report.reportCategory, 
        isReportDialogOpen = v81.report.currentPage == v15.Page.ReportForm, 
        currentPage = v81.report.currentPage, 
        reportType = v81.report.reportType, 
        targetPlayer = v81.report.targetPlayer, 
        canNavigateBack = #v81.report.history > 1, 
        placeName = v81.placeInfo.name, 
        screenSize = v81.displayOptions.screenSize, 
        screenshotAnnotationPoints = v81.report.screenshotAnnotationPoints
    };
end, function(v83)
    return {
        navigateBack = function(v84, v85)
            v83(v13());
            v21(v15.Page.ReportForm, v15.Analytics.ReportFlowBack, {
                source = v15.Page.ReportForm, 
                reason = v84, 
                descriptionTextChanged = v85
            });
        end, 
        closeDialog = function(v86, v87)
            v83(v14());
            v21(v15.Page.ReportForm, v15.Analytics.ReportFlowAbandoned, {
                source = v15.Page.ReportForm, 
                reason = v86, 
                descriptionTextChanged = v87
            });
            v22.endAbuseReportSession();
        end, 
        screenshotAnnotated = function(v88, v89, v90)
            v83(v27(v90));
            v83(v26(v88, v89, v90));
        end, 
        sendReport = function(v91, v92, v93, v94, v95, v96, v97)
            v83(v16(v91, v92, v93, v94, v95, v96, v97));
        end
    };
end)(v45);
