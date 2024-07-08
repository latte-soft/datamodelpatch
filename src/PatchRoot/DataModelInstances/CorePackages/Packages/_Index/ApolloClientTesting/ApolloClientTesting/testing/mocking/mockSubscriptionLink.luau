local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_Error_0 = v3.Error;
local l_setTimeout_0 = v3.setTimeout;
local l_Observable_0 = require(l_Parent_0.utilities).Observable;
local l_ApolloLink_0 = require(l_Parent_1.ApolloClient).ApolloLink;
local v10 = setmetatable({}, {
    __index = l_ApolloLink_0
});
v10.__index = v10;
v10.new = function()
    local v11 = setmetatable(l_ApolloLink_0.new(), v10);
    v11.unsubscribers = {};
    v11.setups = {};
    v11.observers = {};
    return v11;
end;
v10.request = function(v12, v13)
    v12.operation = v13;
    return l_Observable_0.new(function(v14)
        l_Array_0.forEach(v12.setups, function(v15)
            v15();
        end);
        table.insert(v12.observers, v14);
        return function()
            l_Array_0.forEach(v12.unsubscribers, function(v16)
                v16();
            end);
        end;
    end);
end;
v10.simulateResult = function(v17, v18, v19)
    if v19 == nil then
        v19 = false;
    end;
    l_setTimeout_0(function()
        local l_observers_0 = v17.observers;
        if not l_Boolean_0.toJSBoolean(#l_observers_0) then
            error(l_Error_0.new("subscription torn down"));
        end;
        l_Array_0.forEach(l_observers_0, function(v21)
            if not (not l_Boolean_0.toJSBoolean(v18.result) or not l_Boolean_0.toJSBoolean(v21.next)) then
                v21:next(v18.result);
            end;
            if not (not l_Boolean_0.toJSBoolean(v18.error) or not l_Boolean_0.toJSBoolean(v21.error)) then
                v21:error(v18.error);
            end;
            if not (not v19 or not l_Boolean_0.toJSBoolean(v21.complete)) then
                v21:complete();
            end;
        end);
    end, not not l_Boolean_0.toJSBoolean(v18.delay) and v18.delay or 0);
end;
v10.simulateComplete = function(v22)
    local l_observers_1 = v22.observers;
    if not l_Boolean_0.toJSBoolean(#l_observers_1) then
        error(l_Error_0.new("subscription torn down"));
    end;
    l_Array_0.forEach(l_observers_1, function(v24)
        if l_Boolean_0.toJSBoolean(v24.complete) then
            v24:complete();
        end;
    end);
end;
v10.onSetup = function(v25, v26)
    v25.setups = l_Array_0.concat(v25.setups, {
        v26
    });
end;
v10.onUnsubscribe = function(v27, v28)
    v27.unsubscribers = l_Array_0.concat(v27.unsubscribers, {
        v28
    });
end;
v0.MockSubscriptionLink = v10;
v0.mockObservableLink = function()
    return v10.new();
end;
return v0;
