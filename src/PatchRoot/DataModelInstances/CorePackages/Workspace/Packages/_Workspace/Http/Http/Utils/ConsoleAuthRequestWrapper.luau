local l_CorePackages_0 = game:GetService("CorePackages");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Logging);
local _ = require(l_script_FirstAncestor_0.RequestTypes);
if not game:DefineFastFlag("ConsoleCredentialsHeadersEverywhere", false) and not game:GetEngineFeature("ConsoleCredentialsHeaders") then
    local _ = function()
        return (v3.new(function(v7, _)
            l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getCredentialsRequest", {
                type = "consoleAuthCode"
            }, function(v9)
                v7(v9);
            end, {});
        end));
    end;
    local _ = function()
        return v3.new(function(v11, _)
            l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v13)
                v11(v13);
            end, {});
        end);
    end;
    return function(v15, v16, v17, v18)
        if not game:GetEngineFeature("ConsoleCredentialsHeaders") then
            return v3.new(function(v19, _)
                l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getCredentialsRequest", {
                    type = "consoleAuthCode"
                }, function(v21)
                    v19(v21);
                end, {});
            end):andThen(function(v22)
                if v22 == nil then
                    return v3.reject();
                else
                    local l_authCode_0 = v22.authCode;
                    local v24 = v22.issuerId or 0;
                    local v25 = v22.errorCode or 0;
                    if v25 ~= 0 then
                        warn("authcode error:", v25);
                        return v3.reject({
                            errorCode = v25
                        });
                    else
                        local v26 = if not v18.headers then {} else v18.headers;
                        v26.Authorization = l_authCode_0;
                        if v24 ~= 0 then
                            v26.Issuer = tostring(v24);
                        end;
                        local l_v18_0 = v18;
                        l_v18_0.headers = v26;
                        return v15(v16, v17, l_v18_0);
                    end;
                end;
            end, function(v28)
                return v3.reject(v28);
            end);
        else
            return v3.new(function(v29, _)
                l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v31)
                    v29(v31);
                end, {});
            end):andThen(function(v32)
                if v32 ~= nil and v32.success then
                    v18.headers = v4.Dictionary.join(v18.headers or {}, v32.headers or {});
                    return v15(v16, v17, v18);
                else
                    warn("credential headers error");
                    return v3.reject();
                end;
            end, function(v33)
                return v3.reject(v33);
            end);
        end;
    end;
else
    return function(v34, v35, v36, v37)
        return v3.new(function(v38, v39)
            l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v40)
                if not (v40 and v40.success) then
                    v5.warn("credential headers error");
                    v39({});
                end;
                v37.headers = v4.Dictionary.join(v37.headers or {}, v40.headers or {});
                return v34(v35, v36, v37):andThen(v38):catch(v39);
            end, {});
        end);
    end;
end;
