local l_Parent_0 = script:FindFirstAncestor("TenFootUiCommon").Parent;
local _ = require(l_Parent_0.React);
local _ = require(l_Parent_0.Navigation);
return {
    ScreenKind = {
        Default = "Default", 
        FullScreen = "FullScreen"
    }, 
    AnimationStyleEnum = {
        XDirection = "XDirection", 
        ZDirection = "ZDirection", 
        None = "None"
    }, 
    GlobalNavDisplayOption = {
        ShowAll = "ShowAll", 
        TabGroupOnly = "TabGroupOnly", 
        OptionGroupOnly = "OptionGroupOnly", 
        HideAll = "HideAll"
    }
};
