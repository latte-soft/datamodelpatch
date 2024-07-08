local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
return function()
    return l_HttpService_0:GenerateGUID(true);
end;
