local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Logging);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Util.Base64);
local v6 = require(l_Modules_0.LuaApp.Util.ChallengeError);
local v7 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v8 = require(l_Modules_0.LuaApp.Enum.Challenge.GenericType);
local v9 = require(l_Modules_0.LuaApp.Enum.Challenge.ErrorKind);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppChallengeDisableForceWebViewVisible);
local v11 = require(l_Modules_0.LuaApp.Promise);
local v12 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v13 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderNativeChallenge);
shouldForceWebViewVisibleForChallengeType = function(v14)
    local v15 = v8.fromRawValue(v14);
    local v16 = false;
    if v15 ~= nil then
        v16 = false;
        if v15 ~= v8.Captcha then
            v16 = false;
            if v15 ~= v8.ProofOfWork then
                v16 = v15 ~= v8.DeviceIntegrity;
            end;
        end;
    end;
    return v16;
end;
shouldRenderNativeChallenge = function(v17)
    local v18 = l_HttpService_0:JSONDecode(v17);
    local v19 = false;
    if v18 ~= nil then
        v19 = false;
        if v18.sharedParameters ~= nil then
            v19 = v18.sharedParameters.renderNativeChallenge == true;
        end;
    end;
    return v19;
end;
renderChallengeWithHeaders = function(v20, v21, v22, v23, v24)
    return function(v25)
        if v24 == nil then
            return v11.resolve();
        elseif ((not (type(v24.Headers) == "table") or not v24.Headers["rblx-challenge-type"]) or not v24.Headers["rblx-challenge-metadata"]) or not v24.Headers["rblx-challenge-id"] then
            return v11.reject(v24);
        else
            local v26 = v8.fromRawValue(v24.Headers["rblx-challenge-type"]);
            local v27 = v5.Decode(v24.Headers["rblx-challenge-metadata"]);
            if not shouldRenderNativeChallenge(v27) then
                v3.warn("Rendering generic challenge.");
                return v11.new(function(v28, v29)
                    v25:dispatch(v12({
                        challengeType = v7.Generic, 
                        challengeParameters = {
                            genericChallengeId = v24.Headers["rblx-challenge-id"], 
                            genericChallengeType = v24.Headers["rblx-challenge-type"], 
                            genericChallengeMetadata = v5.EncodeUrl(v27), 
                            onChallengeCompleted = function(v30)
                                v23 = if type(v23) == "table" then v23 else {};
                                v23.headers = if type(v23.headers) == "table" then v23.headers else {};
                                v23.headers["rblx-challenge-id"] = v24.Headers["rblx-challenge-id"];
                                v23.headers["rblx-challenge-type"] = v24.Headers["rblx-challenge-type"];
                                v23.headers["rblx-challenge-metadata"] = v5.Encode(l_HttpService_0:JSONEncode(v30.metadata));
                                local v31, _ = v20(v21, v22, v23);
                                v28((v31:andThen(nil, function(v33)
                                    return v25:dispatch(renderChallengeWithHeaders(v20, v21, v22, v23, v33));
                                end)));
                            end, 
                            onChallengeInvalidated = function(v34)
                                if not v34 or not v34.challengeType then
                                    v29(v6:new(v9.Invalidated, {
                                        challengeType = v8.fromRawValue(v24.Headers["rblx-challenge-type"])
                                    }));
                                    return ;
                                else
                                    v34.challengeType = v8.fromRawValue((tostring(v34.challengeType)));
                                    v29(v6:new(v9.Invalidated, v34));
                                    return ;
                                end;
                            end
                        }, 
                        onChallengeAbandoned = function()
                            v29(v6:new(v9.Abandoned, {
                                challengeType = v8.fromRawValue(v24.Headers["rblx-challenge-type"])
                            }));
                        end, 
                        onChallengeLoadFailed = function()
                            v3.warn("Load generic challenge failed.");
                            v29(v6:new(v9.LoadFailed, {
                                challengeType = v8.fromRawValue(v24.Headers["rblx-challenge-type"])
                            }));
                        end, 
                        forceWebViewVisible = not v10() or shouldForceWebViewVisibleForChallengeType(v24.Headers["rblx-challenge-type"])
                    }, false));
                end);
            else
                v3.warn("Rendering native challenge.");
                return v11.new(function(v35, v36)
                    v25:dispatch(v13({
                        challengeId = v24.Headers["rblx-challenge-id"], 
                        challengeType = v26, 
                        challengeMetadata = v27, 
                        onSessionCompleted = function()
                            v23 = if type(v23) == "table" then v23 else {};
                            v23.headers = if type(v23.headers) == "table" then v23.headers else {};
                            v23.headers["rblx-challenge-id"] = v24.Headers["rblx-challenge-id"];
                            v23.headers["rblx-challenge-type"] = v24.Headers["rblx-challenge-type"];
                            v23.headers["rblx-challenge-metadata"] = v24.Headers["rblx-challenge-metadata"];
                            local v38, _ = v20(v21, v22, v23):andThen(nil, function(_)
                                v36(v6:new(v9.Invalidated, {
                                    challengeType = v26
                                }));
                            end);
                            v35(v38);
                        end, 
                        onSessionFailed = function()
                            v36(v6:new(v9.Invalidated, {
                                challengeType = v26
                            }));
                        end
                    }));
                end);
            end;
        end;
    end;
end;
return renderChallengeWithHeaders;
