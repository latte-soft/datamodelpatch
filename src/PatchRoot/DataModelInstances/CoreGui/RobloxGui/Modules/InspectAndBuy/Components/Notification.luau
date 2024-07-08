local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v6 = require(l_Parent_0.Colors);
local v7 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v8 = v3.PureComponent:extend("Notification");
v8.render = function(v9)
    return v3.createElement("Frame", {
        Size = UDim2.new(1, -10, 0, 45), 
        LayoutOrder = 0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, 10), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        ExclamationPoint = v3.createElement("ImageLabel", {
            Size = UDim2.new(0, 16, 0, 16), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/InspectMenu/ico_alert_tilt.png", 
            ImageColor3 = v6.White, 
            LayoutOrder = 1
        }), 
        PartOfBundleText = v3.createElement("TextLabel", {
            Size = UDim2.new(1, -30, 1, 0), 
            TextColor3 = v6.White, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            TextWrapped = true, 
            TextScaled = true, 
            TextSize = 12, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v7:FormatByKeyForLocale(v9.props.noticeKey, v9.props.locale)
        }, {
            UITextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            })
        })
    });
end;
return v4.UNSTABLE_connect2(function(v10, _)
    return {
        locale = v10.locale
    };
end)(v8);
