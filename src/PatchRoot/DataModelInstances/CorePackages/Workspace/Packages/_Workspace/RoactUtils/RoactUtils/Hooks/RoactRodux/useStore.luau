local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local l_StoreContext_0 = require(l_Parent_0.RoactRodux).StoreContext;
return function()
    local v3 = v1.useContext(l_StoreContext_0);
    assert(v3, "useDispatch and useSelector can only be called from a descendant of the Rodux Store Provider");
    return v3;
end;
