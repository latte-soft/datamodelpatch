local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Cryo);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v6 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local v7 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.ReportTextEntry);
local l_FullPageModal_0 = v3.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_DropdownMenu_0 = v3.App.Menu.DropdownMenu;
local l_useStyle_0 = v3.Core.Style.useStyle;
local function _(v13)
    return v4.List.map(v4.Dictionary.values(v13), function(v14)
        return {
            text = v14
        };
    end);
end;
return function(v16)
    local v17 = l_useStyle_0();
    local v18, v19 = v2.useState(false);
    local v21 = v4.List.map(v4.Dictionary.values(v6.AbuseTypes), function(v20)
        return {
            text = v20
        };
    end);
    local v22, v23 = v2.useState(nil);
    local v24, v25 = v2.useState("");
    local v26 = v2.useCallback(function()
        v16.onSubmit(v22, v24);
    end, {
        v16.onSubmit, 
        v22, 
        v24
    });
    return l_withLocalization_0({
        submitDialogTitle = "Feature.ReportAbuse.Title.SelectInSceneFinishYourReport", 
        submit = "Feature.ReportAbuse.Action.Submit", 
        submitDialogReasonSubheading = "Feature.ReportAbuse.Label.WhatWasWrong", 
        chooseOne = "Feature.ReportAbuse.Label.ChooseOne", 
        selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne", 
        submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappened", 
        submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment"
    })(function(v27)
        return v2.createElement("TextButton", {
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.3, 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 10
        }, {
            SubmitReportDialog = v2.createElement(l_FullPageModal_0, {
                screenSize = v16.screenSize, 
                title = v27.submitDialogTitle, 
                onCloseClicked = v16.onBack, 
                buttonStackProps = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = not v22 and function()
                                    v19(true);
                                end or v26, 
                                text = v27.submit
                            }
                        }
                    }
                }
            }, {
                SubmitReportFrame = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 28)
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 15)
                    }), 
                    ReportReasonFrame = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 0
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            Padding = UDim.new(0, 14)
                        }), 
                        ReportReasonSubheading = v2.createElement(l_StyledTextLabel_0, {
                            text = "1. " .. v27.submitDialogReasonSubheading, 
                            fontStyle = v17.Font.Header2, 
                            colorStyle = v17.Theme.TextEmphasis, 
                            layoutOrder = 0, 
                            automaticSize = Enum.AutomaticSize.XY
                        }), 
                        v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            LayoutOrder = 1
                        }, {
                            ReportReasonDropdown = v2.createElement(l_DropdownMenu_0, {
                                placeholder = v27.chooseOne, 
                                onChange = function(v28)
                                    v19(false);
                                    v23(v28);
                                    v16.analyticsDispatch({
                                        type = v6.AnalyticsActions.SetReasonSelection, 
                                        reason_selection = v28
                                    });
                                end, 
                                screenSize = v16.screenSize, 
                                height = UDim.new(0, 48), 
                                errorState = v18, 
                                showDropShadow = true, 
                                cellDatas = v21
                            })
                        }), 
                        ReportReasonError = if not v18 then nil else v2.createElement(l_StyledTextLabel_0, {
                            text = v27.selectOnePrompt, 
                            fontStyle = v17.Font.Body, 
                            colorStyle = v17.Theme.TextEmphasis, 
                            layoutOrder = 2, 
                            automaticSize = Enum.AutomaticSize.XY
                        })
                    }), 
                    ReportCommentFrame = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            Padding = UDim.new(0, 14)
                        }), 
                        Padding = v2.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 15)
                        }), 
                        ReportCommentSubheading = v2.createElement(l_StyledTextLabel_0, {
                            text = "2. " .. v27.submitDialogCommentSubheading, 
                            fontStyle = v17.Font.Header2, 
                            colorStyle = v17.Theme.TextEmphasis, 
                            layoutOrder = 0, 
                            automaticSize = Enum.AutomaticSize.XY
                        }), 
                        ReportCommentTextEntry = v2.createElement(v7, {
                            text = v24, 
                            placeholderText = v27.submitDialogTextBoxPlaceholder, 
                            onUpdate = function(v29)
                                v16.analyticsDispatch({
                                    type = v6.AnalyticsActions.SetCommentAdded, 
                                    comment_added = #v29 > 0
                                });
                                v25(v29);
                            end
                        })
                    })
                })
            })
        });
    end);
end;
