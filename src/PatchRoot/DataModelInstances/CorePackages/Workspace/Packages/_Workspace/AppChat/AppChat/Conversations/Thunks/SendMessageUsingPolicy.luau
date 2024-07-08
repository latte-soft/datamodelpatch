local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RequestTimeDiag_0 = require(l_Parent_0.Analytics).RequestTimeDiag;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_ResponseStatus_0 = require(l_Parent_0.AppChatNetworking).Constants.ResponseStatus;
local v7 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
return function(v8, _)
    local v10 = l_RequestTimeDiag_0:new(v3.PerformanceMeasurement.LUA_CHAT_SEND_MESSAGE);
    return function(v11)
        v8:onBeforeSendingMessage(v11);
        return v8:sendMessage(v11):andThen(function(v12)
            v10:report();
            if not v7() then
                if not (not v12 or not v12.responseBody) and v12.responseBody.resultType ~= "Success" then
                    return v4.reject(v12);
                end;
            elseif not (not (not (not (not v12 or not v12.responseBody) and v12.responseCode == l_StatusCodes_0.OK) or not v12.responseBody.messages) and #v12.responseBody.messages ~= 0) or (v12.responseBody.messages[1].status and v12.responseBody.messages[1].status ~= "") and v12.responseBody.messages[1].status ~= l_ResponseStatus_0.SUCCESS then
                return v4.reject(v12);
            end;
            return v12;
        end):andThen(function(v13)
            return v8:onSuccess(v11, v13);
        end):catch(function(v14)
            return v8:onFailure(v11, v14);
        end);
    end;
end;
