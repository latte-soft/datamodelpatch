local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.UpdateSelectedCaptures);
local v2 = require(l_Parent_0.Utils.getUpdatedSelectedCapturesArray);
local _ = require(l_Parent_0.Types);
return function(v4)
    return function(v5)
        v5:dispatch(v1(v2(v5:getState().Screenshots.CaptureManager.SelectedCaptures, v4)));
    end;
end;
