local function v5(v0, ...)
    local v1 = {};
    local v2 = #v0;
    for v3 = 1, v2 do
        v1[v3] = v0[v3];
    end;
    for v4 = 1, select("#", ...) do
        v1[v2 + v4] = select(v4, ...);
    end;
    return v1;
end;
local function v10(v6, v7)
    local v8 = {};
    for v9 = 1, #v6 do
        if v6[v9] ~= v7 then
            table.insert(v8, v6[v9]);
        end;
    end;
    return v8;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12)
    local v13 = {
        _listeners = {}, 
        _store = v12
    };
    setmetatable(v13, v11);
    return v13;
end;
v11.connect = function(v14, v15)
    if typeof(v15) ~= "function" then
        error("Expected the listener to be a function.");
    end;
    if not (not v14._store or not v14._store._isDispatching) then
        error("You may not call store.changed:connect() while the reducer is executing. " .. "If you would like to be notified after the store has been updated, subscribe from a " .. "component and invoke store:getState() in the callback to access the latest state. ");
    end;
    local v16 = {
        callback = v15, 
        disconnected = false, 
        connectTraceback = debug.traceback(), 
        disconnectTraceback = nil
    };
    v14._listeners = v5(v14._listeners, v16);
    return {
        disconnect = function()
            if v16.disconnected then
                error(("Listener connected at: \n%s\n" .. "was already disconnected at: \n%s\n"):format(tostring(v16.connectTraceback), (tostring(v16.disconnectTraceback))));
            end;
            if not (not v14._store or not v14._store._isDispatching) then
                error("You may not unsubscribe from a store listener while the reducer is executing.");
            end;
            v16.disconnected = true;
            v16.disconnectTraceback = debug.traceback();
            v14._listeners = v10(v14._listeners, v16);
        end
    };
end;
v11.fire = function(v17, ...)
    for _, v19 in ipairs(v17._listeners) do
        if not v19.disconnected then
            v19.callback(...);
        end;
    end;
end;
return v11;
