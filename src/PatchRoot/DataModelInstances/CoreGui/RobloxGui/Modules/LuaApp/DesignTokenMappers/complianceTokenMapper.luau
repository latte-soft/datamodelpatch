local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function(_, v5)
    return {
        xButtonSize = v5.Global.Size_450, 
        xLeftPadding = v5.Global.Size_100, 
        paddingTop = v5.Global.Size_700, 
        paddingBottom = v5.Global.Size_600, 
        paddingRight = v5.Global.Size_300, 
        paddingLeft = v5.Global.Size_300, 
        titleSize = v5.Global.FontSize_700, 
        messageSize = v5.Global.FontSize_100, 
        messagePaddingTop = v5.Global.Size_600, 
        messagePaddingTopExtended = v5.Global.Size_900, 
        messagePaddingBottomReduced = v5.Global.Size_300, 
        messagePaddingBottom = v5.Global.Size_600, 
        messagePaddingTopWideView = v5.Global.Size_300, 
        messagePaddingTopWideViewExtended = v5.Global.Size_900, 
        messagePaddingBottomWideView = v5.Global.Size_150, 
        dividerPaddingTop = v5.Global.Size_600, 
        listPaddingBottom = v5.Global.Size_300, 
        checkboxSize = v5.Global.Size_300, 
        checkboxPadding = v5.Global.Size_200, 
        checkboxPaddingBottom = v5.Global.Size_250, 
        agreeButtonHeight = v5.Global.Size_600, 
        agreeButtonPaddingBottom = v5.Global.Size_100
    };
end;
