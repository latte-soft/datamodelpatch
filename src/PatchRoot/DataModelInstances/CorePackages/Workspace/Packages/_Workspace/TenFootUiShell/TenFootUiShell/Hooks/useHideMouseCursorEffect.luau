local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = require(script:FindFirstAncestor("TenFootUiShell").Parent.React);
return function()
    v1.useEffect(function()
        l_UserInputService_0.MouseIconEnabled = false;
    end, {});
end;
