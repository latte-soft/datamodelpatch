local v0 = {};
local v1 = nil;
v0.setExtraStackFrame = function(v2)
    if _G.__DEV__ then
        v1 = v2;
    end;
end;
if _G.__DEV__ then
    v0.getCurrentStack = nil;
    v0.getStackAddendum = function()
        local v3 = "";
        if v1 then
            v3 = v3 .. v1;
        end;
        local l_getCurrentStack_0 = v0.getCurrentStack;
        if l_getCurrentStack_0 then
            v3 = v3 .. (l_getCurrentStack_0() or "");
        end;
        return v3;
    end;
end;
return v0;
