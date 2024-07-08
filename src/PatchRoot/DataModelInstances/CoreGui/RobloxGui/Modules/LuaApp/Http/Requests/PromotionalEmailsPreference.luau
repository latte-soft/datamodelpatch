local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.LuaApp.Http.Url);
local _ = require(l_CorePackages_0.Logging);
return function(v5, v6)
    local v7 = v3.NOTIFICATION_URL .. "v2/notifications/notification-preferences";
    local v8 = "None";
    if v6 then
        v8 = "Personalized";
    end;
    return v5(v7, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            updatedPreferences = {
                {
                    notificationType = "PromotionalEmails", 
                    notificationChannel = "Email", 
                    preferenceStatus = v8
                }
            }
        })
    }):catch(function()
    end);
end;
