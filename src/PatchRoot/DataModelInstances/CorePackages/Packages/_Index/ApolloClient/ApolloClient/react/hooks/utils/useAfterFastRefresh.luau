local v0 = {};
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.React);
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
v0.useAfterFastRefresh = function(v4)
    if _G.__DEV__ then
        local v5 = l_useRef_0(false);
        l_useEffect_0(function()
            return function()
                v5.current = true;
            end;
        end, {});
        l_useEffect_0(function()
            if v5.current == true then
                v5.current = false;
                v4();
            end;
        end, {});
    end;
end;
return v0;
