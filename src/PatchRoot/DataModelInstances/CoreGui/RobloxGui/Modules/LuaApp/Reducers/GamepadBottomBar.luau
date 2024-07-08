local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_CorePackages_0.Rodux).createReducer({
    boundInputs = {}, 
    focusController = nil
}, {
    [require(l_Modules_0.LuaApp.Actions.SetBoundInputs).name] = function(_, v3)
        return {
            boundInputs = v3.boundInputs or {}, 
            focusController = v3.focusController
        };
    end, 
    [require(l_Modules_0.LuaApp.Actions.MaybeClearBoundInputs).name] = function(v4, v5)
        if v4.focusController ~= v5.focusController then
            return v4;
        else
            return {
                boundInputs = {}, 
                focusController = nil
            };
        end;
    end
});
