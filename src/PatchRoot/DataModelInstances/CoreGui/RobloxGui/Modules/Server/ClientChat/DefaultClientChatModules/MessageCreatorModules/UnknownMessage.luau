local _ = require(script.Parent.Parent:WaitForChild("ChatSettings"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
CreateUnknownMessageLabel = function(v2)
    print("No message creator for message: " .. v2.Message);
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = "UnknownMessage", 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateUnknownMessageLabel
};
