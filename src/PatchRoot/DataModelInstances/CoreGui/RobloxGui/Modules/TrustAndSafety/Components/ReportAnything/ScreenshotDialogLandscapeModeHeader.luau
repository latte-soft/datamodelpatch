local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v5 = require(script.Parent.Parent.Parent.Flags.GetFFlagReportAnythingLocalizationEnabled);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_withStyle_0 = v2.Style.withStyle;
local function _(v13)
    return function()
        return l_withStyle_0(function(v14)
            local l_Theme_0 = v14.Theme;
            return v3.createElement("TextLabel", {
                Text = v13, 
                Font = v14.Font.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local function _(v17, v18, v19, v20, v21)
    local v22 = v20 or v21;
    return function()
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v17
            }), 
            UndoButton = v22 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v21, 
                layoutOrder = 2, 
                onActivated = v18
            }), 
            RedoButton = v22 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v20, 
                layoutOrder = 3, 
                onActivated = v19
            })
        });
    end;
end;
local function _(v24, v25)
    return function()
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v3.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function()
                                v24(v25);
                            end, 
                            text = not v5() and "Next" or v4:FormatByKey("Feature.ReportAbuse.Action.Next")
                        }
                    }
                }
            })
        });
    end;
end;
return function(v27)
    local l_createElement_0 = v3.createElement;
    local v29 = "Frame";
    local v30 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 47), 
        ZIndex = 2
    };
    local v31 = {};
    local l_createElement_1 = v3.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v34 = {
        backgroundTransparency = 1, 
        barHeight = 48
    };
    local l_backAction_0 = v27.backAction;
    local l_undoAnnotationPoints_0 = v27.undoAnnotationPoints;
    local l_redoAnnotationPoints_0 = v27.redoAnnotationPoints;
    local l_isRedoEnabled_0 = v27.isRedoEnabled;
    local l_isUndoEnabled_0 = v27.isUndoEnabled;
    local v40 = l_isRedoEnabled_0 or l_isUndoEnabled_0;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 15 ]];
    local l_l_undoAnnotationPoints_0_0 = l_undoAnnotationPoints_0 --[[ copy: 10 -> 16 ]];
    v34.renderLeft = function()
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = l_l_backAction_0_0
            }), 
            UndoButton = v40 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not l_isUndoEnabled_0, 
                layoutOrder = 2, 
                onActivated = l_l_undoAnnotationPoints_0_0
            }), 
            RedoButton = v40 and v3.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not l_isRedoEnabled_0, 
                layoutOrder = 3, 
                onActivated = l_redoAnnotationPoints_0
            })
        });
    end;
    l_backAction_0 = v27.reportAction;
    l_undoAnnotationPoints_0 = v27.annotationPoints;
    local l_l_backAction_0_1 = l_backAction_0 --[[ copy: 9 -> 17 ]];
    v34.renderRight = function()
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v3.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function()
                                l_l_backAction_0_1(l_undoAnnotationPoints_0);
                            end, 
                            text = not v5() and "Next" or v4:FormatByKey("Feature.ReportAbuse.Action.Next")
                        }
                    }
                }
            })
        });
    end;
    v34.title = if not v5() then v27.titleText else nil;
    local v44;
    if not v5() then
        v44 = nil;
    else
        l_backAction_0 = v27.titleText;
        v44 = function()
            return l_withStyle_0(function(v45)
                local l_Theme_1 = v45.Theme;
                return v3.createElement("TextLabel", {
                    Text = l_backAction_0, 
                    Font = v45.Font.Header2.Font, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                    TextSize = 20, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                });
            end);
        end;
    end;
    v34.renderCenter = v44;
    v31.Bar = l_createElement_1(l_l_HeaderBar_0_0, v34);
    return l_createElement_0(v29, v30, v31);
end;
