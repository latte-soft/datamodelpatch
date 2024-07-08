local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_script_FirstAncestor_0.Thunks.NavigateDown);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return function(v5, v6)
    v2.isInTypes(v5, {
        "string", 
        "number"
    }, "userId");
    v2.isTypeOrNil(v6, "function", "onClose");
    return v3({
        name = l_AppPage_0.ViewUserProfile, 
        detail = v5, 
        extraProps = {
            onClose = v6
        }
    });
end;
