local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local v2 = nil;
local v3 = nil;
if l_Shell_0 then
    v2 = require(l_Modules_0.Shell.Actions.RemoveScreen);
    v3 = require(l_Modules_0.Shell.EventHub);
end;
return function(_)
    return function(v5)
        if l_Shell_0 then
            local l_ScreenList_0 = v5:getState().ScreenList;
            if l_ScreenList_0 then
                spawn(function()
                    v5:dispatch(v2(l_ScreenList_0[1]));
                    v3:dispatchEvent(v3.Notifications.NavigateToRobuxScreen);
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
