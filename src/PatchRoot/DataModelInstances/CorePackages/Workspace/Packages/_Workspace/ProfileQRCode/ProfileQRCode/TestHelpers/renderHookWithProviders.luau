local v0 = require(script:FindFirstAncestor("ProfileQRCode").Parent.Dev.ReactRoblox);
local l_act_0 = v0.act;
local v2 = require(script.Parent.createTreeWithProviders);
return function(v3, v4)
    local v5 = nil;
    local function v7(v6)
        v5 = v3(v6);
        return nil;
    end;
    local _ = function(_)
        return (v2(v7, v4 or {}));
    end;
    local v10 = v0.createRoot((Instance.new("Frame")));
    l_act_0(function()
        local l_v10_0 = v10;
        local _ = {};
        l_v10_0:render((v2(v7, v4 or {})));
    end);
    return {
        result = v5, 
        rerender = function(v13)
            l_act_0(function()
                local l_v10_1 = v10;
                local _ = v13;
                l_v10_1:render((v2(v7, v4 or {})));
            end);
        end, 
        cleanup = function()
            v10:unmount();
        end
    };
end;
