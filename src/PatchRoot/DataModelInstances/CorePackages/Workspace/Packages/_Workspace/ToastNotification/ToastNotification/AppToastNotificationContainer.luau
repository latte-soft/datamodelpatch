local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.ExperienceService);
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules:FindFirstChild("LuaApp");
local v6 = nil;
local v7 = l_LuaApp_0 and l_LuaApp_0.ExperienceEventReceiver;
if v7 then
    v6 = require(v7).new();
end;
local v8 = require(l_Parent_0.ToastNotificationWrapper);
local l_ExperienceService_0 = v4.ExperienceService;
local l_UseExperienceService_0 = v4.Flags.UseExperienceService;
local v11 = game:DefineFastFlag("EnableToastNotificationInAppFromWebExperienceJoinFix", false);
return function(v12)
    local v13, v14 = v3.useState(false);
    v3.useEffect(function()
        if not v11 or not l_UseExperienceService_0() then
            if v6 then
                v6:onLaunched(function(_)
                    v14(true);
                end);
                v6:onLeft(function()
                    v14(false);
                end);
            end;
            return ;
        else
            l_ExperienceService_0:RegisterForExperienceJoin(function()
                v14(true);
            end);
            l_ExperienceService_0:RegisterForExperienceLeave(function()
                v14(false);
            end);
            return ;
        end;
    end, {});
    return not v13 and v3.createElement(v8, {
        displayOrder = v12.displayOrder, 
        renderLocation = "universalApp"
    });
end;
