local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.TenFootUiCommon);
return function(v3)
    local v4, v5 = v1.useState({});
    local v6 = v3.keepVisitedScreensMounted == nil and true or v3.keepVisitedScreensMounted;
    v1.useLayoutEffect(function()
        v5(function(v7)
            local v8 = {};
            if v6 then
                for _, v10 in v7, nil, nil do
                    if v3.descriptors[v10] then
                        table.insert(v8, v10);
                    end;
                end;
            end;
            if table.find(v8, v3.activeKey) == nil then
                table.insert(v8, v3.activeKey);
            end;
            return v8;
        end);
    end, {
        v3.activeKey, 
        v3.descriptors, 
        v6
    });
    return v4;
end;
