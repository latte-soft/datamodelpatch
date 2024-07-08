local l_LogService_0 = game:GetService("LogService");
local v1 = require(script:FindFirstAncestor("JestConfigs").Parent.JestGlobals);
local l_beforeAll_0 = v1.beforeAll;
local l_afterAll_0 = v1.afterAll;
local l_expect_0 = v1.expect;
local v5 = false;
local v6 = nil;
l_beforeAll_0(function()
    l_expect_0.extend({
        toHaveNoOutput = function(_, v8, v9)
            if not v8 then
                return {
                    pass = true, 
                    message = function()
                        return "Expected an error or warning message";
                    end
                };
            else
                return {
                    pass = false, 
                    message = function()
                        return (("Has hit an error or warning message: %*"):format(v9));
                    end
                };
            end;
        end
    });
    l_LogService_0.MessageOut:Connect(function(v10, v11)
        if not (v11 ~= Enum.MessageType.MessageError) or v11 == Enum.MessageType.MessageWarning then
            v5 = true;
            v6 = v10;
        end;
    end);
end);
l_afterAll_0(function()
    task.wait(0.2);
    l_expect_0(v5).toHaveNoOutput(v6);
end);
