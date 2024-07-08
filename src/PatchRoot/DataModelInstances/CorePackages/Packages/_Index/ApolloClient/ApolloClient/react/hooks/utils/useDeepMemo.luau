local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_useRef_0 = require(l_Parent_0.Parent.React).useRef;
local v3 = require(l_Parent_0.jsutils.equal);
v0.useDeepMemo = function(v4, v5)
    local v6 = l_useRef_0(nil);
    if not (v6.current and v3(v5, v6.current.key)) then
        v6.current = {
            key = v5, 
            value = v4()
        };
    end;
    return v6.current.value;
end;
return v0;
