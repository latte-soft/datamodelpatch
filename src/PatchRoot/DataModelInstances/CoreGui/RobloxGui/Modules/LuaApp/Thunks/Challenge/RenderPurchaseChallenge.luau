local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v2 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v3 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepSpendFrictionRequests);
local v5 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableSpendFrictionTwoFactor);
local v6 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableTwoStepCatalogAnalytics);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev);
return function(v9, v10, v11, v12, v13, v14, v15)
    return function(v16)
        if v7() then
            wait(v8());
        end;
        v16:dispatch(v2({
            challengeType = v1.TwoStepVerification, 
            challengeParameters = {
                actionType = v3.RobuxSpend, 
                challengeId = v9, 
                userId = v10, 
                onChallengeCompleted = function(v17)
                    if v6 then
                        v11.completedTwoStepAuthOnPurchase();
                    end;
                    return v4.redeem(v12, tostring(v9), v17.verificationToken):andThen(function(_)
                        v13();
                    end, function(_)
                        v14();
                    end);
                end, 
                onChallengeInvalidated = function(_)
                    if v6 then
                        v11.invalidatedTwoStepAuthOnPurchase();
                    end;
                    v14();
                end
            }, 
            onChallengeAbandoned = function()
                if v6 then
                    v11.abandonedTwoStepAuthOnPurchase();
                end;
                v14();
            end, 
            onChallengeLoadFailed = function()
                if v6 then
                    v11.loadFailedTwoStepAuthOnPurchase();
                end;
                v14();
            end, 
            forceWebViewVisible = true
        }, false));
        if not (not v5 or not v15) then
            v15();
        end;
    end;
end;
