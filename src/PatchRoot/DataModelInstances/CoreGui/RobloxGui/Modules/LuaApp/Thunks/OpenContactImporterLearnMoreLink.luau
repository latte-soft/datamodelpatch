local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function()
    return function(v4)
        v4:dispatch(v3({
            name = v1.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/articles/7416652004884", 
            extraProps = {
                title = ""
            }
        }, nil));
    end;
end;
