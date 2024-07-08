local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.PolicyService);
local v2 = require(l_Modules_0.LoadingScreen.Actions.SetIsSubjectToChinaPolicies);
return function()
    return function(v3)
        coroutine.wrap(function()
            v3:dispatch(v2((v1:IsSubjectToChinaPolicies())));
        end)();
    end;
end;
