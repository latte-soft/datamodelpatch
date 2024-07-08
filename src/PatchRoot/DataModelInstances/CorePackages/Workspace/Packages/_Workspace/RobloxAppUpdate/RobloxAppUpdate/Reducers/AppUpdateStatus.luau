local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppUpdate");
local v1 = require(l_script_FirstAncestor_0.Actions.SetAppUpdateStatus);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.Cryo);
return v3.createReducer({
    status = Enum.AppUpdateStatus.Unknown
}, {
    [v1.name] = function(v5, v6)
        return v4.Dictionary.join(v5, {
            status = v6.status
        });
    end
});
