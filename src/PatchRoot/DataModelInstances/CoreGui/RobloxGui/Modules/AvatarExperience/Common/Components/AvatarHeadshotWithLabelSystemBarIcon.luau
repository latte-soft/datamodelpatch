local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v5 = require(l_Modules_0.LuaApp.Util.SystemBarLabelTextSizeBinding);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotLocalIcon);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
return function(v8)
    local l_selected_0 = v8.selected;
    local l_pressed_0 = v8.pressed;
    local v11 = v5.default:getBinding();
    local v12 = l_useStyle_0();
    local v13 = l_useLocalization_0({
        label = v8.label
    }).label or "";
    v3.useEffect(function()
        v5.default:getMinTextSize(v13, v12.Font.Header2.Font, Vector2.new(62, 12));
    end, {
        v13, 
        v11, 
        v12
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 4)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        AvatarCanvasGroup = v3.createElement("CanvasGroup", {
            Size = UDim2.fromOffset(28, 28), 
            GroupTransparency = not l_pressed_0 and 0 or 0.5
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            Icon = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.fromOffset(28, 28)
            }, {
                AvatarHeadshotLocalIcon = v3.createElement(v6, {
                    ZIndex = 2, 
                    Size = 28
                })
            })
        }), 
        IconText = v3.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = v13, 
            Size = UDim2.new(1, 0, 0, 12), 
            TextColor3 = not not l_selected_0 and v12.Theme.TextEmphasis.Color or v12.Theme.TextDefault.Color, 
            Font = v12.Font.Header2.Font, 
            BackgroundTransparency = 1, 
            TextSize = v11, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextTransparency = v12.Theme.TextDefault.Transparency, 
            BorderSizePixel = 0
        })
    });
end;
