local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Cryo);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local _ = require(script.Parent.GameProtocolTypes);
local v7 = require(script.Parent.Flags.GetFFlagMoveLuaExpLaunchBegin);
local v9 = {
    GAME_LAUNCH_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("Game", "launch"), 
        validateParams = v3.intersection(v3.strictInterface({
            placeId = v3.optional(v3.number), 
            userId = v3.optional(v3.number), 
            accessCode = v3.optional(v3.string), 
            gameInstanceId = v3.optional(v3.string), 
            linkCode = v3.optional(v3.string), 
            referralPage = v3.optional(v3.string), 
            launchData = v3.optional(v3.string), 
            joinAttemptOrigin = v3.optional(v3.string), 
            joinAttemptId = v3.string
        }), function(v8)
            return v8.placeId or v8.userId;
        end)
    }
};
v9.__index = v9;
v9.new = function()
    return (setmetatable({
        subscriber = l_MessageBus_0.Subscriber.new()
    }, v9));
end;
v9.launchGame = function(v10, v11, v12, v13)
    if type(v11.placeId) == "string" then
        v11.placeId = tonumber(v11.placeId);
    end;
    if type(v11.userId) == "string" then
        v11.userId = tonumber(v11.userId);
    end;
    local v14 = if v11.joinAttemptId ~= nil then v11.joinAttemptId else l_HttpService_0:GenerateGUID(false);
    v11 = v4.Dictionary.join(v11, {
        joinAttemptId = v14, 
        joinAttemptOrigin = if v12 ~= nil then v12 else v11.joinAttemptOrigin
    });
    if v13 then
        v13(v14);
    end;
    if v7() then
        l_default_0:logEvent("experience_launch_begin");
    end;
    l_MessageBus_0.publish(v10.GAME_LAUNCH_DESCRIPTOR, v11);
end;
v9.default = v9.new();
return v9;
