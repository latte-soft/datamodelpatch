local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_withTooltip_0 = require(l_CorePackages_0.UIBlox).App.Dialog.TooltipV2.withTooltip;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
return function(v6)
    return l_withTooltip_0({
        bodyText = l_useLocalization_0({
            TooltipText = "Feature.GameFollows.TooltipNotificationsButtonDescription"
        }).TooltipText, 
        textAlignment = Enum.TextXAlignment.Left, 
        useLargeDropShadow = false
    }, {
        active = v6.isActive, 
        guiTarget = l_CoreGui_0, 
        DisplayOrder = 1, 
        preferredOrientation = v6.preferredOrientation
    }, function(v7)
        local function v9(v8)
            if v6.onPositionChanged then
                v6.onPositionChanged(v8);
            end;
            v7(v8);
        end;
        return v3.createElement("Frame", {
            Visible = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v3.Change.AbsolutePosition] = v9, 
            [v3.Change.AbsoluteSize] = v9
        });
    end);
end;
