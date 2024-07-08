local l_LogService_0 = game:GetService("LogService");
local v1 = require(game:GetService("CorePackages").Packages.Dev.JestGlobals3);
local l_beforeAll_0 = v1.beforeAll;
local l_afterAll_0 = v1.afterAll;
local l_expect_0 = v1.expect;
local v5 = false;
l_beforeAll_0(function()
    l_LogService_0.MessageOut:Connect(function(_, v7)
        if v7 == Enum.MessageType.MessageError then
            v5 = true;
        end;
    end);
end);
l_afterAll_0(function()
    task.wait(0.2);
    l_expect_0(v5).toBe(false);
end);
