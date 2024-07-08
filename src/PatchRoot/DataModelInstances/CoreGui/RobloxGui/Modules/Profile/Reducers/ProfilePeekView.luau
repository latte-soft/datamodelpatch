local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Dash_0 = v0.Dash;
return v0.Rodux.createReducer({
    viewState = nil
}, {
    [require(script.Parent.Actions.SetProfilePeekViewState).name] = function(v2, v3)
        return l_Dash_0.join(v2, {
            viewState = v3.viewState
        });
    end
});
