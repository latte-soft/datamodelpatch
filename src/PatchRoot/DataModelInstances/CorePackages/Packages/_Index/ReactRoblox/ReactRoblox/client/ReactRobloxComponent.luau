local l_Object_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Object;
local v1 = require(script.Parent.roblox.RobloxComponentProps);
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
return {
    setInitialProperties = v1.setInitialProperties, 
    diffProperties = function(_, _, v5, v6, _)
        local v8 = nil;
        for v9, _ in v5, nil, nil do
            if v6[v9] == nil then
                v8 = v8 or table.create(2);
                table.insert(v8, v9);
                table.insert(v8, l_Object_0.None);
            end;
        end;
        for v11, v12 in v6, nil, nil do
            if v12 ~= if v5 ~= nil then v5[v11] else nil then
                v8 = v8 or table.create(2);
                table.insert(v8, v11);
                table.insert(v8, v12);
            end;
        end;
        return v8;
    end, 
    updateProperties = v1.updateProperties, 
    cleanupHostComponent = v1.cleanupHostComponent
};
