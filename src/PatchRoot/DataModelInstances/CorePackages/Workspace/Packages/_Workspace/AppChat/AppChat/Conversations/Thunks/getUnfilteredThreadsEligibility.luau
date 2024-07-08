local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(l_Parent_0.Promise);
return function()
    return function(v5)
        return v4.all({
            v5:dispatch(v2.rodux.GetUnfilteredThreadEligibility.API()):catch(function(v6)
                v3:warning("Error in GetUnfilteredThreadsEligibility request. Error: {}", (tostring(v6)));
            end), 
            v5:dispatch(v2.rodux.GetUnfilteredThreadsFtuxModal.API()):catch(function(v7)
                v3:warning("Error in GetUnfilteredThreadsFtuxModal request. Error: {}", (tostring(v7)));
            end)
        }):andThen(function(v8)
            return {
                GetUnfilteredThreadsEligibility = v8[1], 
                GetUnfilteredThreadsFtuxModal = v8[2]
            };
        end);
    end;
end;
