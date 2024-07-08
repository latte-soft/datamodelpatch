local v0 = require(script.Parent.Parent.Dev.ReactRoblox);
local l_act_0 = v0.act;
local v2 = require(script.Parent.createTreeWithProviders);
return function(v3, v4)
    local v5 = nil;
    local v6 = nil;
    local function v8(v7)
        v5 = v3(v7);
        return nil;
    end;
    local function _(v9)
        return (v2(v8, v9));
    end;
    local v11 = v0.createRoot((Instance.new("Frame")));
    l_act_0(function()
        v11:render((v2(v8, v4)));
    end);
    local function v13(v12)
        l_act_0(function()
            v11:render((v2(v8, v12 or v4)));
        end);
        return v6();
    end;
    local function v14()
        v11:unmount();
    end;
    v6 = function()
        return {
            result = v5, 
            rerender = v13, 
            cleanup = v14
        };
    end;
    return v6();
end;
