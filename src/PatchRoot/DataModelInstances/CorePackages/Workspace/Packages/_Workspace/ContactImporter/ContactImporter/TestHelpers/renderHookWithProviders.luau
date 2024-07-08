local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.devDependencies);
local l_ReactRoblox_0 = require(l_script_FirstAncestor_0.dependencies).ReactRoblox;
local l_act_0 = l_ReactRoblox_0.act;
local l_createTreeWithProviders_0 = v1.createTreeWithProviders;
return function(v5, v6)
    local v7 = nil;
    local function v9(v8)
        v7 = v5(v8);
        return nil;
    end;
    local _ = function(_)
        return (l_createTreeWithProviders_0(v9, v6 or {}));
    end;
    local v12 = l_ReactRoblox_0.createRoot((Instance.new("Frame")));
    l_act_0(function()
        local l_v12_0 = v12;
        local _ = {};
        l_v12_0:render((l_createTreeWithProviders_0(v9, v6 or {})));
    end);
    return {
        result = v7, 
        rerender = function(v15)
            l_act_0(function()
                local l_v12_1 = v12;
                local _ = v15;
                l_v12_1:render((l_createTreeWithProviders_0(v9, v6 or {})));
            end);
        end, 
        cleanup = function()
            v12:unmount();
        end
    };
end;
