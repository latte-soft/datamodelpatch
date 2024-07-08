local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_PlayerMenuActions_0 = v1.PlayerMenuActions;
return function(v4, v5)
    local v6 = table.clone(v4);
    if v5.type == l_PlayerMenuActions_0.UpdateComment then
        v6.comment = v5.comment;
    end;
    return v6;
end;
