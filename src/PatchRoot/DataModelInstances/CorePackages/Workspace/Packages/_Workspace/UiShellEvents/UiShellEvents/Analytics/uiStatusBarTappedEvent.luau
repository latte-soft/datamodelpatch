local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.t);
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = v1.strictInterface({
    page = v1.string
});
return function(v4, v5, v6)
    local v7, v8 = v3(v6);
    if not v7 then
        v2:error(v8);
    end;
    v4:sendEventDeferred(v5, "uiShellStatusBarTapped", v6);
end;
