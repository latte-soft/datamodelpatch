local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v4)
    return function(v5)
        v5:dispatch(v3({
            name = v1.PhoneVerification, 
            extraProps = {
                onSuccessCallback = v4.onSuccessCallback, 
                closeCallback = v4.closeCallback, 
                origin = "contactImport"
            }
        }, nil));
    end;
end;
