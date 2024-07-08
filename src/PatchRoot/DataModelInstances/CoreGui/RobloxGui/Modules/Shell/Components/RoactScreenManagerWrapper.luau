local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.ScreenManager);
local v3 = require(l_Modules_0.Shell.AppState);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_Analytics_0 = require(l_Modules_0:FindFirstChild("Shell"):FindFirstChild("Analytics"));
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8, v9, v10)
    local v11 = {};
    v9 = v9 or {};
    v9.onUnmount = function()
        if v11 == v2:GetTopScreen() then
            v2:CloseCurrent();
            if v10 then
                v10();
            end;
        end;
    end;
    local v12 = v1.createElement(v4.StoreProvider, {
        store = v3.store
    }, {
        v1.createElement(v7, v9)
    });
    v11._instance = nil;
    v11.Show = function(v13)
        v13._instance = v1.mount(v12, v8, (tostring(v7)));
    end;
    v11.Hide = function(v14)
        v14:Destruct();
    end;
    v11.Focus = function(_)
    end;
    v11.RemoveFocus = function(_)
    end;
    v11.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = tostring(v7)
        };
    end;
    setmetatable(v11, v6);
    return v11;
end;
v6.Destruct = function(v18)
    v1.unmount(v18._instance);
end;
return v6;
