local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_0.Types);
return v2.createReducer({
    IsOpen = false, 
    SelectedCaptures = {}
}, {
    [require(l_Parent_0.Actions.CaptureManagerClosed).name] = function(v5, _)
        return v3.Dictionary.join(v5, {
            IsOpen = false, 
            SelectedCaptures = {}
        });
    end, 
    [require(l_Parent_0.Actions.CaptureManagerOpened).name] = function(v7, _)
        return v3.Dictionary.join(v7, {
            IsOpen = true
        });
    end, 
    [require(l_Parent_0.Actions.CapturesRetrieved).name] = function(v9, v10)
        return v3.Dictionary.join(v9, {
            IsOpen = v9.IsOpen and #v10.captures > 0, 
            SelectedCaptures = {}
        });
    end, 
    [require(l_Parent_0.Actions.UpdateSelectedCaptures).name] = function(v11, v12)
        return v3.Dictionary.join(v11, {
            SelectedCaptures = v12.selectedCaptures
        });
    end
});
