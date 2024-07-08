local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Utils.InputUtilities);
return function()
    local v3, v4 = v1.useState(false);
    return v3, v1.useCallback(function(_, v6)
        if v2.isPointerInput(v6) then
            v4(true);
        end;
    end, {
        v4
    }), (v1.useCallback(function(_, v8)
        if v2.isPointerInput(v8) then
            v4(false);
        end;
    end, {
        v4
    }));
end;
