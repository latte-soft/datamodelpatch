local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Reducers/" .. script.Name);
return v1.createReducer(1, {
    [require(l_script_FirstAncestor_0.Actions.AvatarContextMenuWhisperSelected).name] = function(v3, _)
        v2:trace("AvatarContextMenuWhisperSelected dispatched");
        return v3 * -1;
    end
});
