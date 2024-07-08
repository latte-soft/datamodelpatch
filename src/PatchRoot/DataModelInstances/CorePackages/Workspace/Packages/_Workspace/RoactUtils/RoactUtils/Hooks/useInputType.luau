local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useExternalEvent);
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
return function(v5)
    local v6 = v5 or l_UserInputService_0;
    local function v7()
        return l_getInputGroup_0((v6:GetLastInputType()));
    end;
    local v8, v9 = v2.useState(v7);
    v3(v6.LastInputTypeChanged, (v2.useCallback(function(v10)
        local v11 = l_getInputGroup_0(v10);
        if v11 ~= nil then
            v9(v11);
        end;
    end)));
    v2.useEffect(function()
        v9(v7());
    end, {});
    return v8;
end;
