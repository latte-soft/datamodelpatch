local l_Parent_0 = script.Parent.Parent;
local l_REACT_PORTAL_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_PORTAL_TYPE;
local _ = require(l_Parent_0.Shared);
return {
    createPortal = function(v3, v4, v5, v6)
        if v6 ~= nil then
            v6 = tostring(v6);
        end;
        return {
            ["$$typeof"] = l_REACT_PORTAL_TYPE_0, 
            key = v6, 
            children = v3, 
            containerInfo = v4, 
            implementation = v5
        };
    end
};
