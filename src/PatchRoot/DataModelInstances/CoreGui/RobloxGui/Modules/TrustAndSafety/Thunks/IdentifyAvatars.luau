local _ = game:GetService("CoreGui");
local v1 = nil;
local l_AvatarIdentification_0 = require(game:GetService("CorePackages").Workspace.Packages.TnSAvatarIdentification).AvatarIdentification;
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.Hide);
local v6 = require(l_Parent_0.Actions.Show);
local v7 = require(l_Parent_0.Actions.SetIdentifiedAvatars);
local v8 = require(l_Parent_0.Utility.ScreenshotHookManager);
local l_getVisibleAvatars_0 = l_AvatarIdentification_0.getVisibleAvatars;
if game:GetEngineFeature("ReportAnythingScreenshot") then
    v1 = game:GetService("SafetyService");
end;
return function()
    return function(v10)
        if v1 == nil then
            return ;
        else
            coroutine.wrap(function()
                v8.doPreScreenshot();
                v10:dispatch(v5());
                local _ = v1:TakeScreenshot({
                    registerContent = 1
                });
                local v12, _ = l_getVisibleAvatars_0();
                for _ = 1, 61 do
                    l_RunService_0.RenderStepped:Wait();
                end;
                v10:dispatch(v6());
                v8.doPostScreenshot();
                v10:dispatch(v7(v12));
            end)();
            return ;
        end;
    end;
end;
