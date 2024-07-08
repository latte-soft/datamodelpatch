local v0 = require(script.Parent.Parent.Immutable);
local l_Actions_0 = script.Parent.Parent.Actions;
local v2 = require(l_Actions_0.SetLuauHeapState);
local v3 = require(l_Actions_0.SetLuauHeapProfileTarget);
local v4 = require(l_Actions_0.SetLuauHeapActiveSnapshot);
local v5 = require(l_Actions_0.SetLuauHeapCompareSnapshot);
local _ = require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes);
local v7 = {
    isClientView = true, 
    client = {
        snapshots = {}, 
        active = 0, 
        compare = 0
    }, 
    server = {
        snapshots = {}, 
        active = 0, 
        compare = 0
    }
};
return function(v8, v9)
    local v10 = v8 or v7;
    if v9.type == v2.name then
        return (v0.JoinDictionaries(v10, if not v9.isClientState then {
            server = v9.sessionState
        } else {
            client = v9.sessionState
        }));
    elseif v9.type == v3.name then
        return v0.JoinDictionaries(v10, {
            isClientView = v9.isClientView
        });
    elseif v9.type == v4.name then
        if not v10.isClientView then
            local v11 = table.clone(v10.server);
            v11.active = v9.active;
            return v0.JoinDictionaries(v10, {
                server = v11
            });
        else
            local v12 = table.clone(v10.client);
            v12.active = v9.active;
            return v0.JoinDictionaries(v10, {
                client = v12
            });
        end;
    elseif v9.type == v5.name then
        if not v10.isClientView then
            local v13 = table.clone(v10.server);
            v13.compare = v9.compare;
            return v0.JoinDictionaries(v10, {
                server = v13
            });
        else
            local v14 = table.clone(v10.client);
            v14.compare = v9.compare;
            return v0.JoinDictionaries(v10, {
                client = v14
            });
        end;
    else
        return v10;
    end;
end;
