local l_Parent_0 = script:FindFirstAncestor("TenFootUiControllerBar").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigationUtils);
local v3 = {
    ButtonHoldStarted = "ButtonHoldStarted", 
    ButtonHoldEnded = "ButtonHoldEnded"
};
local v10 = {
    [v3.ButtonHoldStarted] = function(v4, v5)
        local v6 = table.clone(v4);
        v6.heldProgress[v5.eventName] = v5.progress;
        return v6;
    end, 
    [v3.ButtonHoldEnded] = function(v7, v8)
        local v9 = table.clone(v7);
        v9.heldProgress[v8.eventName] = nil;
        return v9;
    end
};
local function v14(v11, v12)
    local v13 = v10[v12.type];
    if not v13 then
        error("Unknown action: " .. v12.type);
        return ;
    else
        return v13(v11, v12.payload);
    end;
end;
local v15 = v1.createContext(nil);
return {
    Context = v15, 
    Provider = function(v16)
        local v17, v18 = v1.useReducer(v14, {
            heldProgress = {}
        });
        return v1.createElement(v15.Provider, {
            value = {
                state = v17, 
                dispatch = v18
            }
        }, v16.children);
    end, 
    useDispatchButtonHoldStarted = function()
        local v19 = v1.useContext(v15);
        local v20 = if not v19 then nil else v19.dispatch;
        return (v1.useCallback(function(v21, v22)
            if v20 then
                v20({
                    type = v3.ButtonHoldStarted, 
                    payload = {
                        eventName = v21, 
                        progress = v22
                    }
                });
            end;
        end, {
            v20
        }));
    end, 
    useDispatchButtonHoldEnded = function()
        local v23 = v1.useContext(v15);
        local v24 = if not v23 then nil else v23.dispatch;
        return (v1.useCallback(function(v25)
            if v24 then
                v24({
                    type = v3.ButtonHoldEnded, 
                    payload = {
                        eventName = v25
                    }
                });
            end;
        end, {
            v24
        }));
    end, 
    useHeldProgressByEvent = function()
        local v26 = v1.useContext(v15);
        if not v26 then
            return {};
        else
            return v26.state.heldProgress;
        end;
    end, 
    ControllerBarStateActionEnum = v3
};
