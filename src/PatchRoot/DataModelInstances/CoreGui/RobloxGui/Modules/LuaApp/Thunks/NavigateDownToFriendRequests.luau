local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Http.Url);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v6)
    assert(v1.callback(v6) or v1.none(v6));
    return v5({
        name = v4.GenericWebPage, 
        detail = string.format("%susers/friends#/friend-requests", v3.BASE_URL), 
        extraProps = {
            titleKey = "CommonUI.Features.Label.Friends", 
            onClose = v6, 
            searchParams = {
                searchType = "Players"
            }
        }
    });
end;
