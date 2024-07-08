local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Resources.FTUXSlideshowData);
local v6 = require(l_CorePackages_0.Packages.LuauPolyfill);
local _ = require(l_Parent_0.Enums.PlatformEnum);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
return function(v9)
    local v10 = l_useStyle_0();
    local l_Theme_0 = v10.Theme;
    local l_Font_0 = v10.Font;
    local l_text_0 = v5[v9.platform][v9.currentIndex].text;
    return l_withLocalization_0(l_text_0)(function(v14)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0.4, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), v6.Array.map(l_text_0, function(_, v16)
            return (v1.createElement(v2.App.Text.StyledTextLabel, {
                text = v14[v16], 
                fontStyle = l_Font_0.CaptionBody, 
                colorStyle = l_Theme_0.TextDefault, 
                textXAlignment = Enum.TextXAlignment.Left, 
                size = UDim2.new(1, 0, 1 / #l_text_0, 0), 
                layoutOrder = v16
            }));
        end));
    end);
end;
