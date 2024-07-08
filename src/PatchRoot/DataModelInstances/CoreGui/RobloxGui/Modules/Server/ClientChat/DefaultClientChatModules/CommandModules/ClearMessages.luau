local l_Util_0 = require(script.Parent:WaitForChild("Util"));
ProcessMessage = function(v1, v2, _)
    if not (string.sub(v1, 1, 4):lower() ~= "/cls") or string.sub(v1, 1, 6):lower() == "/clear" then
        local l_v2_CurrentChannel_0 = v2:GetCurrentChannel();
        if l_v2_CurrentChannel_0 then
            l_v2_CurrentChannel_0:ClearMessageLog();
        end;
        return true;
    else
        return false;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage
};
