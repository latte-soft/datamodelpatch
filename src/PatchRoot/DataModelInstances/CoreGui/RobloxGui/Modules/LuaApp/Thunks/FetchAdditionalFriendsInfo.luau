local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ApiFetchUsersPresences_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Promise);
return function(v5, v6)
    return function(v7)
        return v4.all({
            v7:dispatch(l_ApiFetchUsersPresences_0(v5, (v3.List.map(v6, function(v8)
                return (tostring(v8.id));
            end))))
        });
    end;
end;
