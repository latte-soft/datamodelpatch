local v0 = require(script:FindFirstAncestor("Responsive").Parent.React);
local v1 = require(script.Parent.Parent.Responsive);
local v2 = require(script.Parent.Parent.Context.ContainerRef);
local v3 = game:DefineFastFlag("LuaAppResponsiveUseLayoutEffect", false);
id = function(v4)
    return v4;
end;
useResponsiveImpl = function(v5, v6, v7)
    local v8 = if typeof(v5) == "function" then v5 else id;
    local v9 = v0.useContext(v2);
    local v10, v11 = v0.useState(v8(v1.DefaultKey));
    local v12 = v0.useRef("");
    local v13 = v0.useRef({
        Key = v1.DefaultKey
    });
    local v14 = nil;
    if typeof(v5) == "table" then
        v14 = {};
        for _, v16 in v5, nil, nil do
            v14[v16] = true;
        end;
    end;
    local _ = nil;
    (if not v3 then v0.useEffect else v0.useLayoutEffect)(function()
        if not v9 or not v9.current then
            return function()
            end;
        else
            local v18 = v1.bindContainer(v9.current, v6);
            local v20 = v18:connect(function()
                local v19 = v18:currentKey(v7);
                if not v14 then
                    v13.current = v18:currentRule(v7);
                    v11(v8(v19));
                elseif not (not v14[v19] and (not v12.current or not v14[v12.current])) then
                    v13.current = v18:currentRule(v7);
                    v11(v19);
                end;
                v12.current = v19;
            end);
            v13.current = v18:currentRule(v7);
            local v21 = v18:currentKey(v7);
            v11(v8(v21));
            v12.current = v21;
            return function()
                v20:disconnect();
                v18:destroy();
            end;
        end;
    end, {
        v9, 
        not not v9 and (v9.current or false)
    });
    return v10, v13.current;
end;
return useResponsiveImpl;
