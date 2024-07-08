local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Rodux);
local v2 = require(l_Parent_0.Actions.CapturesRetrieved);
local _ = require(l_Parent_0.Types);
return v1.createReducer({}, {
    [v2.name] = function(_, v5)
        return v5.captures;
    end
});
