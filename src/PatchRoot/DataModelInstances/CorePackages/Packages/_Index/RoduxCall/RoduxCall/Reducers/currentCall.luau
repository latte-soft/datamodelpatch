local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxCall");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local l_CallStateModel_0 = require(l_script_FirstAncestor_0.Models).CallStateModel;
local l_UpdateCall_0 = require(l_script_FirstAncestor_0.Actions).UpdateCall;
local _ = require(script.Parent.Parent.roduxCallTypes);
return function()
    return v1.createReducer(nil, {
        [l_UpdateCall_0.name] = function(_, v6)
            return l_CallStateModel_0.format(v6.payload.call);
        end
    });
end;
