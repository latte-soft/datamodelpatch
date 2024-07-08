local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = require(script.Parent.isGamepadInput);
return function()
    return v1((l_UserInputService_0:GetLastInputType()));
end;
