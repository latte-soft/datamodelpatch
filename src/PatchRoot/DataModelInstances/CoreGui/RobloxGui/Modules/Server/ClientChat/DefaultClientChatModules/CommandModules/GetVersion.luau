local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local l_ChatConstants_0 = require(script.Parent.Parent:WaitForChild("ChatConstants"));
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = function(v2, v3, _)
        if not (string.sub(v2, 1, 8):lower() ~= "/version") or string.sub(v2, 1, 9):lower() == "/version " then
            l_Util_0:SendSystemMessageToSelf(string.format("This experience is running chat version [%d.%d.%s].", l_ChatConstants_0.MajorVersion, l_ChatConstants_0.MinorVersion, l_ChatConstants_0.BuildVersion), v3:GetCurrentChannel(), {});
            return true;
        else
            return false;
        end;
    end
};
