local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppHooks");
local l_AppSystemInfo_0 = require(l_script_FirstAncestor_0.Parent.RoactServiceTags).AppSystemInfo;
local v2 = require(l_script_FirstAncestor_0.useRoactService);
return function()
    return v2(l_AppSystemInfo_0);
end;
