local l_script_FirstAncestor_0 = script:FindFirstAncestor("Responsive");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.InputMode);
return function()
    local v3, v4 = v1.useState(v2.last);
    v1.useEffect(function()
        v4(v2.last);
        local v5 = v2.connect(function()
            v4(v2.last);
        end);
        return function()
            v5:disconnect();
        end;
    end, {});
    return v3 or "";
end;
