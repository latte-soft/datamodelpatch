local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.RoactNavigation);
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    v5 = v5 or {};
    local v6 = v5.params or {};
    local v7 = true;
    if v5.isFocused ~= nil then
        v7 = v5.isFocused;
    end;
    local v8 = v5.routeName or "DummyRoute";
    local v9 = {
        state = {
            routeName = v8, 
            key = v5.key or v8, 
            params = v6, 
            routes = v5.routes
        }, 
        _isFocused = v7, 
        _dispatchListeners = {}, 
        _eventListeners = {
            [v3.Events.WillFocus] = {}, 
            [v3.Events.DidFocus] = {}, 
            [v3.Events.WillBlur] = {}, 
            [v3.Events.DidBlur] = {}
        }
    };
    setmetatable(v9, v4);
    v9.isFocused = function()
        return v9._isFocused;
    end;
    v9.getParam = function(v10)
        return v9.state.params[v10];
    end;
    v9.navigate = function(v11)
        v9.state.routeName = v11;
        v9:setFocused(false);
    end;
    v9.goBack = function()
        v9:setFocused(false);
    end;
    v9.dispatch = function(v12)
        local l__dispatchListeners_0 = v9._dispatchListeners;
        if l__dispatchListeners_0 then
            for _, v15 in l__dispatchListeners_0, nil, nil do
                v15(v12);
            end;
        end;
    end;
    v9.addDispatchListener = function(v16)
        v9._dispatchListeners = v2.List.join(v9._dispatchListeners, {
            v16
        });
        return {
            remove = function()
                v9._eventListeners = v2.List.removeValue(v9._dispatchListeners, v16);
            end
        };
    end;
    v9.addListener = function(v17, v18)
        local v19 = v9._eventListeners[v17];
        if v19 then
            v9._eventListeners[v17] = v2.List.join(v19, {
                v18
            });
            return {
                remove = function()
                    v9._eventListeners[v17] = v2.List.removeValue(v9._eventListeners[v17], v18);
                end
            };
        else
            return {
                remove = function()
                end
            };
        end;
    end;
    return v9;
end;
v4.__tostring = function(v20)
    return string.format("FakeNavigation{routeName=%s, isFocused=%s, params=%s}", v20.state.routeName, not v20._isFocused and "false" or "true", l_HttpService_0:JSONEncode(v20.state.params));
end;
v4._fireEvent = function(v21, v22)
    local v23 = v21._eventListeners[v22];
    if v23 then
        for _, v25 in v23, nil, nil do
            v25();
        end;
    end;
end;
v4.setFocused = function(v26, v27)
    if v27 ~= v26._isFocused then
        v26:_fireEvent(not not v27 and v3.Events.WillFocus or v3.Events.WillBlur);
        v26._isFocused = v27;
        v26:_fireEvent(not not v27 and v3.Events.DidFocus or v3.Events.DidBlur);
    end;
end;
v4.setParams = function(v28, v29)
    v28.state.params = v29;
end;
return v4;
