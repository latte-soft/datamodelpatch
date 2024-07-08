local v0 = {};
local v1 = {};
v1.__index = v1;
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_CommandModules_0 = l_ClientChatModules_0:WaitForChild("CommandModules");
local l_Util_0 = require(l_CommandModules_0:WaitForChild("Util"));
local _ = script.Parent;
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
v1.SetupCommandProcessors = function(v7)
    local l_l_CommandModules_0_Children_0 = l_CommandModules_0:GetChildren();
    for v9 = 1, #l_l_CommandModules_0_Children_0 do
        if l_l_CommandModules_0_Children_0[v9]:IsA("ModuleScript") and l_l_CommandModules_0_Children_0[v9].Name ~= "Util" then
            local v10 = require(l_l_CommandModules_0_Children_0[v9]);
            local v11 = v10[l_Util_0.KEY_COMMAND_PROCESSOR_TYPE];
            local v12 = v10[l_Util_0.KEY_PROCESSOR_FUNCTION];
            if v11 == l_Util_0.IN_PROGRESS_MESSAGE_PROCESSOR then
                table.insert(v7.InProgressMessageProcessors, v12);
            elseif v11 == l_Util_0.COMPLETED_MESSAGE_PROCESSOR then
                table.insert(v7.CompletedMessageProcessors, v12);
            end;
        end;
    end;
end;
v1.ProcessCompletedChatMessage = function(v13, v14, v15)
    for v16 = 1, #v13.CompletedMessageProcessors do
        if v13.CompletedMessageProcessors[v16](v14, v15, l_ChatSettings_0) then
            return true;
        end;
    end;
    return false;
end;
v1.ProcessInProgressChatMessage = function(v17, v18, v19, v20)
    for v21 = 1, #v17.InProgressMessageProcessors do
        local v22 = v17.InProgressMessageProcessors[v21](v18, v19, v20, l_ChatSettings_0);
        if v22 then
            return v22;
        end;
    end;
    return nil;
end;
v0.new = function()
    local v23 = setmetatable({}, v1);
    v23.CompletedMessageProcessors = {};
    v23.InProgressMessageProcessors = {};
    v23:SetupCommandProcessors();
    return v23;
end;
return v0;
