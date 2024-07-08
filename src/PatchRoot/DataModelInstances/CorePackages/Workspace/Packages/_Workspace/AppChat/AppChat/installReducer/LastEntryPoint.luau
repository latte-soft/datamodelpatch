local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_Parent_0.SocialCommon);
return v2.createReducer("NotSet", {
    [require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint).name] = function(_, v5)
        return v5.entryPoint;
    end
});
