local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v2 = require(l_script_FirstAncestor_0.Logger);
return function(v3)
    return function(v4)
        v4:dispatch(v1.rodux.UpdateTypingStatus.API(v3)):catch(function(v5)
            v2:error((("AppChatNetworking failure in updateTypingStatus, Status: %*"):format((tostring(v5)))));
        end);
    end;
end;
