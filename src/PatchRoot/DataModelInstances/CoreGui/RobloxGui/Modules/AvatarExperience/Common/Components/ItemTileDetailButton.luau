local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagFixLooksTileDetailButton);
local l_useStyle_0 = v2.Core.Style.useStyle;
return function(v6)
    local v7 = l_useStyle_0();
    local l_Theme_0 = v7.Theme;
    local l_Font_0 = v7.Font;
    return v1.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 28), 
        Position = UDim2.new(0, 0, 1, -28), 
        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        [v1.Event.Activated] = v6.activateButton, 
        ZIndex = 10, 
        BackgroundTransparency = 1
    }, {
        BoundingFrame = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }), 
            Text = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                Text = l_useLocalization_0({
                    detail = if not not v4() and v6.itemsCount then {
                        "Feature.Avatar.Label.Details"; 
                        quantity = v6.itemsCount
                    } else "Feature.Avatar.Label.Detail"
                }).detail, 
                TextColor3 = l_Theme_0.SystemPrimaryContent.Color
            })
        })
    });
end;
