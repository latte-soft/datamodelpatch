local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_IconButton_0 = v1.App.Button.IconButton;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_Images_0 = v1.App.ImageSet.Images;
local l_withStyle_0 = v1.Style.withStyle;
local _ = function(v8, _, _)
    return function()
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v8
            })
        });
    end;
end;
local function _(v12)
    return function()
        return l_withStyle_0(function(v13)
            local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
            local v15 = 300;
            if l_CurrentCamera_0 ~= nil then
                v15 = l_CurrentCamera_0.ViewportSize.X - 150;
            end;
            local l_Theme_0 = v13.Theme;
            return v2.createElement("TextLabel", {
                Text = v12, 
                Font = v13.Font.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v15, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local _ = function(_, v19, v20, v21, v22)
    return function()
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 60, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UndoButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v21, 
                layoutOrder = 1, 
                onActivated = v19
            }), 
            RedoButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v22, 
                layoutOrder = 2, 
                onActivated = v20
            })
        });
    end;
end;
return function(v24)
    local v25 = v24.isRedoEnabled or v24.isUndoEnabled;
    local l_createElement_0 = v2.createElement;
    local v27 = "Frame";
    local v28 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 48), 
        ZIndex = 2
    };
    local v29 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v32 = {
        backgroundTransparency = 1, 
        barHeight = 48, 
        margin = 12
    };
    local l_backAction_0 = v24.backAction;
    local l_isRedoEnabled_0 = v24.isRedoEnabled;
    local l_isUndoEnabled_0 = v24.isUndoEnabled;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 10 -> 15 ]];
    v32.renderLeft = function()
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = l_l_backAction_0_0
            })
        });
    end;
    local v37;
    if not v25 then
        v37 = function()
        end;
    else
        l_backAction_0 = v24.annotationPoints;
        l_isRedoEnabled_0 = v24.undoAnnotationPoints;
        l_isUndoEnabled_0 = v24.redoAnnotationPoints;
        local l_isUndoEnabled_1 = v24.isUndoEnabled;
        local l_isRedoEnabled_1 = v24.isRedoEnabled;
        v37 = function()
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 60, 1, 0)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                UndoButton = v2.createElement(l_IconButton_0, {
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/actions/edit/undo"], 
                    isDisabled = not l_isUndoEnabled_1, 
                    layoutOrder = 1, 
                    onActivated = l_isRedoEnabled_0
                }), 
                RedoButton = v2.createElement(l_IconButton_0, {
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/actions/edit/redo"], 
                    isDisabled = not l_isRedoEnabled_1, 
                    layoutOrder = 2, 
                    onActivated = l_isUndoEnabled_0
                })
            });
        end;
    end;
    v32.renderRight = v37;
    l_backAction_0 = v24.titleText;
    v32.renderCenter = function()
        return l_withStyle_0(function(v40)
            local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
            local v42 = 300;
            if l_CurrentCamera_1 ~= nil then
                v42 = l_CurrentCamera_1.ViewportSize.X - 150;
            end;
            local l_Theme_1 = v40.Theme;
            return v2.createElement("TextLabel", {
                Text = l_backAction_0, 
                Font = v40.Font.Header2.Font, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v42, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
    v32.isSecondary = true;
    v29.Bar = l_createElement_1(l_l_HeaderBar_0_0, v32);
    return l_createElement_0(v27, v28, v29);
end;
