local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.RoactRodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_act_0 = v3.act;
return function(v5, v6, v7)
    local v8 = {};
    local function v10(v9)
        v8.current = v6(v9);
        return nil;
    end;
    local function v13(v11)
        local v12 = v2.createElement(v10, v11);
        if v5 ~= nil then
            v12 = v2.createElement(v1.StoreProvider, {
                store = v5
            }, {
                Wrapper = v12
            });
        end;
        return v12;
    end;
    local v14 = v3.createRoot((Instance.new("Frame")));
    l_act_0(function()
        v14:render((v13(v7 or {})));
    end);
    return {
        result = v8, 
        rerender = function(v15)
            l_act_0(function()
                v14:render((v13(v15)));
            end);
        end, 
        cleanup = function()
            v14:unmount();
        end
    };
end;
