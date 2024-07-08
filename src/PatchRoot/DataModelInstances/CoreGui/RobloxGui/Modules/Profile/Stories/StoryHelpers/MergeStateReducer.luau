local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Dash_0 = v1.Dash;
return v1.Rodux.createReducer({}, {
    [require(l_script_FirstAncestor_0.Stories.StoryHelpers.MergeStateAction).name] = function(v3, v4)
        return l_Dash_0.join(v3, v4.state, {
            Profile = l_Dash_0.join(v3.Profile, v4.state.Profile or {})
        });
    end
});
