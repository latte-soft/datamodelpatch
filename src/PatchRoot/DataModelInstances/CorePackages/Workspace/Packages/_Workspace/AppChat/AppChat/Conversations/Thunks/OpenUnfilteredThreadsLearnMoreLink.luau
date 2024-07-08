local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v3 = game:DefineFastString("UnfilteredThreadsLearnMoreUrl", "https://en.help.roblox.com/");
return function()
    return function(v4)
        v4:dispatch(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v3, 
            extraProps = {
                title = ""
            }
        }, nil));
    end;
end;
