local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TestEZ_0 = require(l_CorePackages_0.JestGlobals).TestEZ;
local l_TestBootstrap_0 = l_TestEZ_0.TestBootstrap;
local l_TextReporter_0 = l_TestEZ_0.Reporters.TextReporter;
local l_Tests_0 = script.Parent.Tests;
require(l_CorePackages_0.UIBlox).init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
local function _()
    l_TestBootstrap_0:run({
        l_Tests_0
    }, l_TextReporter_0);
end;
return function()
    l_UserInputService_0.InputEnded:connect(function(v7, _)
        if not (((not (v7.UserInputType == Enum.UserInputType.Keyboard) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift)) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl)) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt)) and v7.KeyCode == Enum.KeyCode.R then
            l_TestBootstrap_0:run({
                l_Tests_0
            }, l_TextReporter_0);
        end;
    end);
end;
