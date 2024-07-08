local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PromiseUtilities_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.PromiseUtilities;
local v5 = require(l_Modules_0.LuaApp.Thunks.Networking.Util.Retry);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v7 = require(l_Modules_0.LuaApp.Models.HumanoidDescriptionProperties);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpMaxRetries);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpRetryTimeMultiplier);
local v10 = math.max(0, v8());
local v11 = math.max(0, v9());
local v12 = require(l_Modules_0.LuaApp.Actions.Authentication.SetHumanoidDescriptionProperties);
return {
    Fetch = function(v13, v14)
        return function(v15)
            local v16 = v2.List.join(v14);
            local function v28()
                local v17 = {};
                for _, v19 in pairs(v16) do
                    v17[v19] = v6.GetOutfit(v13, v19);
                end;
                return l_PromiseUtilities_0.Batch(v17):andThen(function(v20)
                    local v21 = {};
                    local v22 = {};
                    for v23, v24 in pairs(v20) do
                        local v25, v26 = v24:unwrap();
                        local v27 = v26 and v26.responseBody;
                        if not v25 or not v27 then
                            table.insert(v21, v23);
                        else
                            v22[tostring(v23)] = v7.fromOutfitDetailsWebApi(v27);
                        end;
                    end;
                    v15:dispatch(v12(v22));
                    return v3.resolve(v21);
                end);
            end;
            return v28():andThen(function(v29)
                return v5({
                    retryCount = v10, 
                    retryTimeMultiplier = v11, 
                    retryCallback = v28, 
                    previousResult = v29, 
                    isResolveConditionMet = function(v30)
                        if #v30 == 0 then
                            return true;
                        else
                            v16 = v2.List.join(v30);
                            return false;
                        end;
                    end
                });
            end);
        end;
    end
};
