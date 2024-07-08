local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Resources.FTUXSlideshowData);
local _ = require(l_Parent_0.Enums.PlatformEnum);
return function(v8)
    local v9 = l_useStyle_0();
    local l_Theme_0 = v9.Theme;
    local l_Font_0 = v9.Font;
    return l_withLocalization_0({
        titleText = v6[v8.platform][v8.currentIndex].title
    })(function(v12)
        return v1.createElement(v2.App.Text.StyledTextLabel, {
            text = v12.titleText, 
            fontStyle = l_Font_0.SubHeader1, 
            colorStyle = l_Theme_0.TextEmphasis, 
            textXAlignment = Enum.TextXAlignment.Left, 
            size = UDim2.new(1, 0, 0.031, 0), 
            layoutOrder = 1
        });
    end);
end;
