local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_withStyle_0 = v2.Style.withStyle;
local function _(v10)
    return function()
        return l_withStyle_0(function(v11)
            local l_Theme_0 = v11.Theme;
            return v1.createElement("TextLabel", {
                Text = v10, 
                Font = v11.Font.Header2.Font, 
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
local function _(v14, v15, v16, v17, v18)
    local v19 = v17 or v18;
    return function()
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v14
            }), 
            UndoButton = v19 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v18, 
                layoutOrder = 2, 
                onActivated = v15
            }), 
            RedoButton = v19 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v17, 
                layoutOrder = 3, 
                onActivated = v16
            })
        });
    end;
end;
local _ = function(v21, _, v23)
    return function()
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v1.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v21, 
                            text = v23
                        }
                    }
                }
            })
        });
    end;
end;
return function(v25)
    local l_createElement_0 = v1.createElement;
    local v27 = "Frame";
    local v28 = {
        BorderSizePixel = 0, 
        BackgroundTransparency = 0.1, 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 71), 
        ZIndex = 2
    };
    local v29 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v32 = {
        backgroundTransparency = 1, 
        barHeight = 72
    };
    local l_backAction_0 = v25.backAction;
    local l_undoAnnotationPoints_0 = v25.undoAnnotationPoints;
    local l_redoAnnotationPoints_0 = v25.redoAnnotationPoints;
    local l_isRedoEnabled_0 = v25.isRedoEnabled;
    local l_isUndoEnabled_0 = v25.isUndoEnabled;
    local v38 = l_isRedoEnabled_0 or l_isUndoEnabled_0;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 15 ]];
    local l_l_undoAnnotationPoints_0_0 = l_undoAnnotationPoints_0 --[[ copy: 10 -> 16 ]];
    local l_l_redoAnnotationPoints_0_0 = l_redoAnnotationPoints_0 --[[ copy: 11 -> 17 ]];
    v32.renderLeft = function()
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = l_l_backAction_0_0
            }), 
            UndoButton = v38 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not l_isUndoEnabled_0, 
                layoutOrder = 2, 
                onActivated = l_l_undoAnnotationPoints_0_0
            }), 
            RedoButton = v38 and v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not l_isRedoEnabled_0, 
                layoutOrder = 3, 
                onActivated = l_l_redoAnnotationPoints_0_0
            })
        });
    end;
    l_backAction_0 = v25.nextAction;
    l_undoAnnotationPoints_0 = v25.annotationPoints;
    l_redoAnnotationPoints_0 = v25.nextText;
    local l_l_backAction_0_1 = l_backAction_0 --[[ copy: 9 -> 18 ]];
    v32.renderRight = function()
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v1.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_l_backAction_0_1, 
                            text = l_redoAnnotationPoints_0
                        }
                    }
                }
            })
        });
    end;
    l_backAction_0 = v25.titleText;
    v32.renderCenter = function()
        return l_withStyle_0(function(v43)
            local l_Theme_1 = v43.Theme;
            return v1.createElement("TextLabel", {
                Text = l_backAction_0, 
                Font = v43.Font.Header2.Font, 
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
    v29.Bar = l_createElement_1(l_l_HeaderBar_0_0, v32);
    return l_createElement_0(v27, v28, v29);
end;
