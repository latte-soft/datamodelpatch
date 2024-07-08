local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v4 = require(l_Modules_0.LuaApp.AppPage);
return function(v5, v6)
    return function(v7)
        if not v6 then
            v7:dispatch(v2(v1.AccountSelector, v5));
            return ;
        else
            v7:dispatch(v3({
                name = v4.AccountSelectorPeekView, 
                extraProps = v5
            }));
            return ;
        end;
    end;
end;
