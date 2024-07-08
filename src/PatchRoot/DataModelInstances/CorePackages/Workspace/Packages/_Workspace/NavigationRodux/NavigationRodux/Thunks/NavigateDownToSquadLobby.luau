local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Thunks.NavigateDown);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return function(v4)
    return v2({
        name = l_AppPage_0.SquadPage, 
        conversationId = v4
    });
end;
