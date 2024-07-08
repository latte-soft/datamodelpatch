local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(script.Parent.Parent.Parent.Flags.GetFFlagReportAnythingLocalizationEnabled);
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_IconButton_0 = v1.App.Button.IconButton;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_Images_0 = v1.App.ImageSet.Images;
local l_withStyle_0 = v1.Style.withStyle;
local _ = function(v9, _, _)
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
                onActivated = v9
            })
        });
    end;
end;
local function _(v13)
    return function()
        return l_withStyle_0(function(v14)
            local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
            local v16 = 300;
            if l_CurrentCamera_0 ~= nil then
                v16 = l_CurrentCamera_0.ViewportSize.X - 150;
            end;
            local l_Theme_0 = v14.Theme;
            return v2.createElement("TextLabel", {
                Text = v13, 
                Font = v14.Font.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v16, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local _ = function(_, v20, v21, v22, v23)
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
                isDisabled = not v22, 
                layoutOrder = 1, 
                onActivated = v20
            }), 
            RedoButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v23, 
                layoutOrder = 2, 
                onActivated = v21
            })
        });
    end;
end;
return function(v25)
    local v26 = v25.isRedoEnabled or v25.isUndoEnabled;
    local l_createElement_0 = v2.createElement;
    local v28 = "Frame";
    local v29 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 48), 
        ZIndex = 2
    };
    local v30 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v33 = {
        backgroundTransparency = 1, 
        barHeight = 48, 
        margin = 12
    };
    local l_backAction_0 = v25.backAction;
    local l_isRedoEnabled_0 = v25.isRedoEnabled;
    local l_isUndoEnabled_0 = v25.isUndoEnabled;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 10 -> 15 ]];
    v33.renderLeft = function()
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
    local v38;
    if not v26 then
        v38 = function()
        end;
    else
        l_backAction_0 = v25.annotationPoints;
        l_isRedoEnabled_0 = v25.undoAnnotationPoints;
        l_isUndoEnabled_0 = v25.redoAnnotationPoints;
        local l_isUndoEnabled_1 = v25.isUndoEnabled;
        local l_isRedoEnabled_1 = v25.isRedoEnabled;
        v38 = function()
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
    v33.renderRight = v38;
    v33.title = if not v3() then v25.titleText else nil;
    if not v3() then
        v38 = nil;
    else
        l_backAction_0 = v25.titleText;
        v38 = function()
            return l_withStyle_0(function(v41)
                local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
                local v43 = 300;
                if l_CurrentCamera_1 ~= nil then
                    v43 = l_CurrentCamera_1.ViewportSize.X - 150;
                end;
                local l_Theme_1 = v41.Theme;
                return v2.createElement("TextLabel", {
                    Text = l_backAction_0, 
                    Font = v41.Font.Header2.Font, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                    TextSize = 20, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Size = UDim2.new(0, v43, 1, 0), 
                    BackgroundTransparency = 1
                });
            end);
        end;
    end;
    v33.renderCenter = v38;
    v33.isSecondary = true;
    v30.Bar = l_createElement_1(l_l_HeaderBar_0_0, v33);
    return l_createElement_0(v28, v29, v30);
end;
