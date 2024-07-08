local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(script.Parent.Parent.Roact);
local v2 = require(script.Parent.AdsEuDsaPromptHandler);
return function()
    v1.mount(v1.createElement(v2), l_CoreGui_0, "AdsEuDsaPromptHandler");
end;
