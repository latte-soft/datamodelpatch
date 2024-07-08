local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.Rodux);
return v1.Store.new(require(l_Parent_0.Reducers.GameInviteReducer), nil, {
    v1.thunkMiddleware
});
