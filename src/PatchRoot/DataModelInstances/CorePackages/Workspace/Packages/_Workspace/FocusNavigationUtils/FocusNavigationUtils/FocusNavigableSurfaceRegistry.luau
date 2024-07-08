local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v9 = {
    registered = function(v3, v4)
        local v5 = table.clone(v3);
        v5[v4.name] = v4.guiObject;
        return v5;
    end, 
    deRegistered = function(v6, v7)
        if v6[v7.name] == v7.guiObject then
            local v8 = table.clone(v6);
            v8[v7.name] = nil;
            return v8;
        else
            return v6;
        end;
    end
};
local function v13(v10, v11)
    local v12 = v9[v11.type];
    if not v12 then
        error("Unknown action: " .. v11.type);
        return ;
    else
        return v12(v10, v11.payload);
    end;
end;
local v14 = v1.createContext(nil);
return {
    Provider = function(v15)
        local v16, v17 = v1.useReducer(v13, {});
        return v1.createElement(v14.Provider, {
            value = {
                state = v16, 
                dispatch = v17
            }
        }, v15.children);
    end, 
    registryContext = v14, 
    useRegisterFocusNavigableSurface = function()
        local v18 = v1.useContext(v14);
        local v19 = if not v18 then nil else v18.dispatch;
        return v1.useCallback(function(v20, v21)
            if v19 then
                v19({
                    type = "registered", 
                    payload = {
                        name = v20, 
                        guiObject = v21
                    }
                });
            end;
        end, {
            v19
        });
    end, 
    useDeRegisterFocusNavigableSurface = function()
        local v22 = v1.useContext(v14);
        local v23 = if not v22 then nil else v22.dispatch;
        return v1.useCallback(function(v24, v25)
            if v23 then
                v23({
                    type = "deRegistered", 
                    payload = {
                        name = v24, 
                        guiObject = v25
                    }
                });
            end;
        end, {
            v23
        });
    end, 
    useRegistryEntry = function(v26)
        local v27 = v1.useContext(v14);
        if v27 == nil then
            return nil;
        else
            local v28 = v27.state[v26];
            if v28 == nil then
                return nil;
            else
                return v28;
            end;
        end;
    end, 
    useFocusRegistryEntry = function(v29)
        local v30 = v2.useFocusGuiObject();
        local v31 = v1.useContext(v14);
        local v32;
        if v31 == nil then
            v32 = nil;
        else
            local v33 = v31.state[v29];
            v32 = if v33 == nil then nil else v33;
        end;
        return v1.useCallback(function()
            if v32 then
                v30(v32);
            end;
        end, {
            v30, 
            v32
        });
    end
};
