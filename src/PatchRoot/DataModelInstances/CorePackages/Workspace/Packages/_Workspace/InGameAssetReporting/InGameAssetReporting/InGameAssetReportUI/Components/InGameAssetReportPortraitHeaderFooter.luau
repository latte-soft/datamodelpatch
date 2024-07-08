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
local _ = function(v10, _, _)
    return function()
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 1, 0)
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
                onActivated = v10
            })
        });
    end;
end;
local function _(v14)
    return function()
        return l_withStyle_0(function(v15)
            local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
            local v17 = 300;
            if l_CurrentCamera_0 ~= nil then
                v17 = l_CurrentCamera_0.ViewportSize.X - 150;
            end;
            local l_Theme_0 = v15.Theme;
            return v1.createElement("TextLabel", {
                Text = v14, 
                Font = v15.Font.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v17, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local _ = function(_, v21, v22, v23, v24)
    return function()
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 60, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UndoButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v23, 
                layoutOrder = 1, 
                onActivated = v21
            }), 
            RedoButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v24, 
                layoutOrder = 2, 
                onActivated = v22
            })
        });
    end;
end;
return {
    PortraitModeHeader = function(v26)
        local v27 = v26.isRedoEnabled or v26.isUndoEnabled;
        local l_createElement_0 = v1.createElement;
        local v29 = "Frame";
        local v30 = {
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.1, 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 72), 
            ZIndex = 2
        };
        local v31 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_HeaderBar_0_0 = l_HeaderBar_0;
        local v34 = {
            backgroundTransparency = 1, 
            barHeight = 72, 
            margin = 12
        };
        local l_backAction_0 = v26.backAction;
        local l_isRedoEnabled_0 = v26.isRedoEnabled;
        local l_isUndoEnabled_0 = v26.isUndoEnabled;
        local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 10 -> 15 ]];
        v34.renderLeft = function()
            return v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 30, 1, 0)
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
                })
            });
        end;
        local v39;
        if not v27 then
            v39 = function()
            end;
        else
            l_backAction_0 = v26.annotationPoints;
            l_isRedoEnabled_0 = v26.undoAnnotationPoints;
            l_isUndoEnabled_0 = v26.redoAnnotationPoints;
            local l_isUndoEnabled_1 = v26.isUndoEnabled;
            local l_isRedoEnabled_1 = v26.isRedoEnabled;
            v39 = function()
                return v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 60, 1, 0)
                }, {
                    Layout = v1.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    UndoButton = v1.createElement(l_IconButton_0, {
                        iconSize = l_IconSize_0.Medium, 
                        icon = l_Images_0["icons/actions/edit/undo"], 
                        isDisabled = not l_isUndoEnabled_1, 
                        layoutOrder = 1, 
                        onActivated = l_isRedoEnabled_0
                    }), 
                    RedoButton = v1.createElement(l_IconButton_0, {
                        iconSize = l_IconSize_0.Medium, 
                        icon = l_Images_0["icons/actions/edit/redo"], 
                        isDisabled = not l_isRedoEnabled_1, 
                        layoutOrder = 2, 
                        onActivated = l_isUndoEnabled_0
                    })
                });
            end;
        end;
        v34.renderRight = v39;
        l_backAction_0 = v26.titleText;
        v34.renderCenter = function()
            return l_withStyle_0(function(v42)
                local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
                local v44 = 300;
                if l_CurrentCamera_1 ~= nil then
                    v44 = l_CurrentCamera_1.ViewportSize.X - 150;
                end;
                local l_Theme_1 = v42.Theme;
                return v1.createElement("TextLabel", {
                    Text = l_backAction_0, 
                    Font = v42.Font.Header2.Font, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                    TextSize = 20, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Size = UDim2.new(0, v44, 1, 0), 
                    BackgroundTransparency = 1
                });
            end);
        end;
        v34.isSecondary = true;
        v31.Bar = l_createElement_1(l_l_HeaderBar_0_0, v34);
        return l_createElement_0(v29, v30, v31);
    end, 
    PortraitModeFooter = function(v46)
        return v1.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.1, 
            Size = UDim2.new(1, 0, 0, 60), 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            LayoutOrder = 4
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            Container = v1.createElement("Frame", {
                Size = UDim2.new(0, 400, 1, 0), 
                BackgroundTransparency = 1
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 32), 
                    PaddingRight = UDim.new(0, 32)
                }), 
                ActionButtons = v1.createElement(l_ButtonStack_0, {
                    marginBetween = 8, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v46.nextAction, 
                                text = v46.nextText
                            }
                        }
                    }
                })
            })
        });
    end
};
