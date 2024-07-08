local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
local v2 = require(script.Parent.useExternalEvent);
local v3 = require(script.Parent.Parent.isGamepadInput);
return function(v4)
    local v5 = v4 or l_UserInputService_0;
    local function v6()
        return v3((v5:GetLastInputType()));
    end;
    local v7, v8 = v1.useState(v6);
    v2(v5.LastInputTypeChanged, (v1.useCallback(function(v9)
        local v10 = v3(v9);
        if v10 ~= nil then
            v8(v10);
        end;
    end)));
    v1.useEffect(function()
        v8(v6());
    end, {});
    return v7;
end;
