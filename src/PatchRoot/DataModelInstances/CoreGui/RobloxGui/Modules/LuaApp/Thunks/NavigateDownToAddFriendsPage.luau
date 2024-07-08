local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function()
    return v2({
        name = v1.AddFriendsPage, 
        extraProps = {
            titleKey = "Feature.Friends.Feature.Friends.Heading.AddFriends"
        }
    });
end;
