local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local v2 = require(game:GetService("CorePackages").Rhodium);
local l_status_0, l_result_0 = pcall(function()
    local v3 = require(l_RobloxGui_0.Modules.RhodiumTest.LuaApp.TestLuaMobileApp);
    v2.RemoteRhodium.setCommandPath(l_RobloxGui_0.Modules.RhodiumTest.LuaApp.Actions);
    l_UserInputService_0.InputEnded:connect(function(v4, _)
        if not (((not (v4.UserInputType == Enum.UserInputType.Keyboard) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift)) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl)) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt)) and v4.KeyCode == Enum.KeyCode.R then
            v3();
        end;
    end);
end);
if not l_status_0 then
    warn(l_result_0);
end;
