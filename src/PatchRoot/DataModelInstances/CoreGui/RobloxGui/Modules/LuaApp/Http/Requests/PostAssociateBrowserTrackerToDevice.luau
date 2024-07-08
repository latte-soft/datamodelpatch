local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Modules_0.LuaApp.Http.Url);
local v3 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_DeviceIdService_0 = game:GetService("DeviceIdService");
return function(v8)
    local v9 = v3.fromString("apis:original-users/v1/associateBrowserTrackerToDevice");
    local v10 = tonumber(l_AppStorageService_0:GetItem(v5.BrowserTrackerId));
    local l_l_DeviceIdService_0_DeviceId_0 = l_DeviceIdService_0:GetDeviceId();
    if not (((v10 ~= nil and v10 > 0) and l_l_DeviceIdService_0_DeviceId_0 ~= nil) and l_l_DeviceIdService_0_DeviceId_0 ~= "") or l_l_DeviceIdService_0_DeviceId_0 == "00000000-0000-0000-0000-000000000000" then
        return v4.reject();
    else
        v8(v9(), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                browser_tracker_id = v10, 
                device_id = l_l_DeviceIdService_0_DeviceId_0
            })
        }):catch(function()
        end);
        return v4.resolve();
    end;
end;
