local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_UIBlox_0 = v3.UIBlox;
local l_t_0 = v3.t;
local l_Cryo_0 = v3.Cryo;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v13 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v14 = require(script.Parent.Parent.Connection.FocusHandler);
local v15 = require(l_Parent_0.Resources.Assets);
local v16 = require(l_Parent_0.Actions.CloseReportDialog);
local v17 = require(l_Parent_0.Localization.withLocalization);
local v18 = require(l_Parent_0.Components.ThemedTextLabel);
local v19 = require(script.Parent.TextEntryField);
local v20 = require(l_Parent_0.Components.DropDownSelection);
local v21 = require(l_Parent_0.Resources.Constants);
local v22 = require(l_Parent_0.Utility.SendAnalytics);
local v23 = require(l_Parent_0.Thunks.SendReport);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v25 = l_Roact_0.PureComponent:extend("ReportDialog");
local v26 = {
    "Swearing", 
    "Inappropriate Username", 
    "Bullying", 
    "Scamming", 
    "Dating", 
    "Cheating/Exploiting", 
    "Personal Question", 
    "Offsite Links"
};
local v27 = {
    "CoreScripts.InGameMenu.Report.AbuseSwearing", 
    "CoreScripts.InGameMenu.Report.AbuseUsername", 
    "CoreScripts.InGameMenu.Report.AbuseBullying", 
    "CoreScripts.InGameMenu.Report.AbuseScamming", 
    "CoreScripts.InGameMenu.Report.AbuseDating", 
    "CoreScripts.InGameMenu.Report.AbuseExploiting", 
    "CoreScripts.InGameMenu.Report.AbusePersonalQuestion", 
    "CoreScripts.InGameMenu.Report.AbuseOffsiteLink"
};
v25.validateProps = l_t_0.strictInterface({
    isOpen = l_t_0.boolean, 
    userId = l_t_0.optional(l_t_0.integer), 
    userName = l_t_0.optional(l_t_0.string), 
    placeName = l_t_0.string, 
    dispatchCloseReportDialog = l_t_0.callback, 
    dispatchSendReport = l_t_0.callback, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isGamepadLastInput = l_t_0.optional(l_t_0.boolean)
});
v25.init = function(v28)
    v28.state = {
        abuseDescription = "", 
        typeOfAbuseIndex = 0
    };
    v28.selectionGroupRef = l_Roact_0.createRef();
    v28.reportTextEntryRef = l_Roact_0.createRef();
    v28.reportDropDownRef = l_Roact_0.createRef();
end;
v25.renderReportTitle = function(_, v30, v31, v32)
    v31.Title = l_Roact_0.createElement(v18, {
        fontKey = "Header1", 
        themeKey = "TextEmphasis", 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 48), 
        Text = v32
    });
    v31.Divider = l_Roact_0.createElement("Frame", {
        BackgroundColor3 = v30.Theme.Divider.Color, 
        BackgroundTransparency = v30.Theme.Divider.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = 2, 
        Size = UDim2.new(0.8, 0, 0, 1)
    });
end;
v25.renderTextEntryField = function(v33, v34, v35, v36)
    v35.ReportDescription = l_Roact_0.createElement(v19, {
        enabled = v33.props.isOpen, 
        text = v33.state.abuseDescription, 
        textChanged = function(v37)
            v33:setState({
                abuseDescription = v37
            });
        end, 
        maxTextLength = 160, 
        autoFocusOnEnabled = not v33.props.isGamepadLastInput, 
        PlaceholderText = v34.textboxPlaceHolder, 
        LayoutOrder = 5, 
        Size = v36, 
        [l_Roact_0.Ref] = v33.reportTextEntryRef
    });
end;
v25.renderButtons = function(v38, _, v40, v41)
    local v42 = utf8.len(utf8.nfcnormalize(v38.state.abuseDescription));
    local v43 = false;
    if v42 >= 0 then
        v43 = v42 <= 160;
    end;
    local v44 = true;
    if v38.state.typeOfAbuseIndex <= 0 then
        v44 = v38.props.userId == nil;
    end;
    v41.ButtonContainer = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 6, 
        Size = UDim2.new(1, 0, 0, 60)
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        CancelButton = l_Roact_0.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            layoutOrder = 1, 
            size = UDim2.fromOffset(144, 36), 
            text = v40.cancel, 
            onActivated = v38.props.dispatchCloseReportDialog
        }), 
        ConfirmButton = l_Roact_0.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            layoutOrder = 2, 
            size = UDim2.fromOffset(144, 36), 
            isDisabled = not (v43 and v44), 
            text = v40.report, 
            onActivated = function()
                local v45 = "Inappropriate Content";
                if v38.props.userId ~= nil then
                    v45 = v26[v38.state.typeOfAbuseIndex];
                end;
                v38.props.dispatchSendReport(v45, v38.state.abuseDescription, v38.props.userId);
                v38.props.dispatchCloseReportDialog();
            end
        })
    });
end;
v25.renderReportPlayer = function(v46, v47, v48, v49)
    v46:renderReportTitle(v47, v49, v48.reportPlayerTitle);
    local v50 = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0.5, -140, 0.5, 0), 
        Size = UDim2.new(0, 44, 0, 44)
    };
    local l_userId_0 = v46.props.userId;
    v49.ReportPlayerTextContainer = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 3, 
        Size = UDim2.new(1, 0, 0, 68)
    }, {
        PlayerCutout = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v50, {
            BackgroundTransparency = 1, 
            Image = v15.Images.CircleCutout, 
            ImageColor3 = v47.Theme.BackgroundUIDefault.Color, 
            ZIndex = 2
        })), 
        PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v50, {
            BackgroundTransparency = 1, 
            Image = l_userId_0 > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_userId_0 .. "&w=48&h=48" or ""
        })), 
        PlayerBackground = l_Roact_0.createElement("Frame", l_Cryo_0.Dictionary.join(v50, {
            BackgroundColor3 = v47.Theme.UIDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            ZIndex = 0
        })), 
        PlayerName = l_Roact_0.createElement(v18, {
            fontKey = "Body", 
            themeKey = "TextEmphasis", 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0.5, -76, 0.5, 0), 
            Size = UDim2.new(0.5, 76, 0, 44), 
            Text = v46.props.userName, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
    v49.AbuseTypeDropDown = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Size = UDim2.new(1, 0, 0, 68)
    }, {
        DropDown = l_Roact_0.createElement(v20, {
            Size = UDim2.new(1, 0, 0, 44), 
            placeHolderText = v48.selectTypeOfAbuse, 
            selections = v27, 
            localize = true, 
            selectedIndex = v46.state.typeOfAbuseIndex, 
            enabled = true, 
            selectionParentName = "abuseTypeDropDown", 
            canOpen = v46.props.canCaptureFocus, 
            canCaptureFocus = v46.props.isGamepadLastInput, 
            selectionChanged = function(v52)
                v46:setState({
                    typeOfAbuseIndex = v52
                });
            end, 
            ButtonRef = v46.reportDropDownRef
        })
    });
    v46:renderTextEntryField(v48, v49, UDim2.new(1, 0, 0, 180));
    v46:renderButtons(v47, v48, v49);
end;
v25.renderReportGame = function(v53, v54, v55, v56)
    v53:renderReportTitle(v54, v56, "Report " .. v53.props.placeName);
    local l_PlaceholderGameIcon_0 = v15.Images.PlaceholderGameIcon;
    if game.GameId > 0 then
        l_PlaceholderGameIcon_0 = "rbxthumb://type=GameIcon&id=" .. game.GameId .. "&w=150&h=150";
    end;
    v56.ReportGameTextContainer = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 3, 
        Size = UDim2.new(1, 0, 0, 126)
    }, {
        GameIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 17, 0.5, 0), 
            Size = UDim2.new(0, 64, 0, 64), 
            BackgroundTransparency = 1, 
            Image = l_PlaceholderGameIcon_0
        }), 
        GameName = l_Roact_0.createElement(v18, {
            fontKey = "Body", 
            themeKey = "TextEmphasis", 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 104, 0.5, 0), 
            Size = UDim2.new(1, -104, 0, 44), 
            Text = v55.flagingGame, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })
    });
    v53:renderTextEntryField(v55, v56, UDim2.new(1, 0, 0, 191));
    v53:renderButtons(v54, v55, v56);
end;
v25.render = function(v58)
    return l_withStyle_0(function(v59)
        return v17({
            flagingGame = {
                "CoreScripts.InGameMenu.Report.FlagingGame"; 
                RBX_NAME = v58.props.placeName
            }, 
            reportGameTitle = {
                "CoreScripts.InGameMenu.Report.ReportGameTitle"; 
                RBX_NAME = v58.props.placeName
            }, 
            reportPlayerTitle = "CoreScripts.InGameMenu.Report.ReportPlayerTitle", 
            selectTypeOfAbuse = "CoreScripts.InGameMenu.Report.SelectAbuseType", 
            cancel = "CoreScripts.InGameMenu.Cancel", 
            report = "CoreScripts.InGameMenu.Report.SendReport", 
            textboxPlaceHolder = "CoreScripts.InGameMenu.Report.AdditionalDetails"
        })(function(v60)
            local v61 = {
                Padding = l_Roact_0.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            if v58.props.userId == nil then
                v58:renderReportGame(v59, v60, v61);
            else
                v58:renderReportPlayer(v59, v60, v61);
            end;
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 8, 
                Visible = v58.props.isOpen, 
                [l_Roact_0.Ref] = v58.selectionGroupRef
            }, {
                Overlay = l_Roact_0.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v59.Theme.Overlay.Color, 
                    BackgroundTransparency = v59.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = "", 
                    Selectable = false
                }), 
                DialogMainFrame = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v15.Images.RoundedRect.Image, 
                    ImageColor3 = v59.Theme.BackgroundUIDefault.Color, 
                    ImageTransparency = v59.Theme.BackgroundUIDefault.Transparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ScaleType = v15.Images.RoundedRect.ScaleType, 
                    Size = UDim2.new(0, 600, 0, 450), 
                    SliceCenter = v15.Images.RoundedRect.SliceCenter
                }, v61), 
                FocusHandler = not not v13() and l_Roact_0.createElement(v14, {
                    isFocused = v58.props.canCaptureFocus and v58.props.isGamepadLastInput, 
                    shouldForgetPreviousSelection = not v58.props.isOpen, 
                    didFocus = function(v62)
                        local _ = nil;
                        l_GuiService_0.SelectedCoreObject = v62 or if not v58.props.userId then v58.reportTextEntryRef:getValue() else v58.reportDropDownRef:getValue();
                    end
                }) or nil
            });
        end);
    end);
end;
v25.bindActions = function(v64)
    l_ContextActionService_0:BindCoreAction("InGameMenuReportModalClose", function(_, v66, _)
        if v66 == Enum.UserInputState.Begin then
            v64.props.dispatchCloseReportDialog();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v25.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("InGameMenuReportModalClose");
end;
v25.didMount = function(v69)
    l_GuiService_0:RemoveSelectionGroup("ReportDialogGroup");
    l_GuiService_0:AddSelectionParent("ReportDialogGroup", v69.selectionGroupRef:getValue());
    if v69.props.isOpen then
        v69:bindActions();
    end;
end;
v25.didUpdate = function(v70, v71)
    if not (not v71.isOpen or v70.props.isOpen) then
        v70:setState({
            typeOfAbuseIndex = 0, 
            abuseDescription = ""
        });
    end;
    if not (((v13() or v71.canCaptureFocus and v71.isGamepadLastInput) or not v70.props.canCaptureFocus) or not v70.props.isGamepadLastInput) then
        local _ = nil;
        l_GuiService_0.SelectedCoreObject = if not v70.props.userId then v70.reportTextEntryRef:getValue() else v70.reportDropDownRef:getValue();
    end;
    if not v70.props.isOpen then
        v70:unbindActions();
        return ;
    else
        v70:bindActions();
        return ;
    end;
end;
v25.willUnmount = function(v73)
    v73:unbindActions();
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v74, _)
    return {
        isOpen = v74.report.dialogOpen, 
        userId = v74.report.userId, 
        userName = v74.report.userName, 
        placeName = v74.gameInfo.name, 
        canCaptureFocus = v74.report.dialogOpen and not v74.respawn.dialogOpen, 
        isGamepadLastInput = v74.displayOptions.inputType == v21.InputType.Gamepad
    };
end, function(v76)
    return {
        dispatchCloseReportDialog = function()
            v76(v16());
        end, 
        dispatchSendReport = function(v77, v78, v79)
            v76(v23(v77, v78, v79));
            local v80 = {};
            if v77 == "Inappropriate Content" then
                table.insert(v80, "report_type=game");
                table.insert(v80, "reported_entity_id=" .. tostring(game.GameId));
            else
                table.insert(v80, "report_type=user");
                table.insert(v80, "reported_entity_id=" .. tostring(v79));
            end;
            table.insert(v80, "report_source=ingame");
            v22(v21.AnalyticsReportSubmittedName, table.concat(v80, "&"), {});
        end
    };
end)(v25);
