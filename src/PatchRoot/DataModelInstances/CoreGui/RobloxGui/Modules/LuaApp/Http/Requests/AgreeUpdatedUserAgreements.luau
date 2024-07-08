local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserAgreementErrorCodes_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementErrorCodes;
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_CorePackages_0.Logging);
return function(v6, v7, v8)
    local v9 = v4.APIS_URL .. "user-agreements/v1/acceptances";
    local v10 = {};
    for _, v12 in ipairs(v7) do
        table.insert(v10, {
            agreementId = v12.id
        });
    end;
    return v6(v9, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            acceptances = v10
        })
    }):andThen(function(v13)
        v5.warn(string.format("Url: %s, responseCode: %s", v9, (tostring(v13.responseCode))));
        if v13.responseCode ~= 200 then
            if v8 then
                v8(l_UserAgreementErrorCodes_0.Exception);
            end;
            return ;
        else
            local l_responseBody_0 = v13.responseBody;
            if not l_responseBody_0.results or #l_responseBody_0.results <= 0 then
                if v8 then
                    v8(l_UserAgreementErrorCodes_0.NoError);
                end;
                return ;
            else
                local l_NoError_0 = l_UserAgreementErrorCodes_0.NoError;
                for _, v17 in ipairs(l_responseBody_0.results) do
                    if v17.errorCode ~= l_UserAgreementErrorCodes_0.NoError and v17.errorCode ~= l_UserAgreementErrorCodes_0.ItemAlreadyExists then
                        v5.warn(string.format("errorCode: %s, agreementId: %s, message: %s", tostring(v17.errorCode), v17.agreementId, v17.message));
                        if l_NoError_0 == l_UserAgreementErrorCodes_0.NoError then
                            l_NoError_0 = v17.errorCode;
                        end;
                        if v17.errorCode == l_UserAgreementErrorCodes_0.InvalidState then
                            l_NoError_0 = l_UserAgreementErrorCodes_0.InvalidState;
                        end;
                    end;
                end;
                if v8 then
                    v8(l_NoError_0);
                end;
                return ;
            end;
        end;
    end, function(v18)
        v5.warn(string.format("Url: %s, Status: %s, isJSONValid: %s", v9, tostring(v18.HttpError), (tostring(v18.isJSONValid))));
        if v8 then
            v8(l_UserAgreementErrorCodes_0.Exception);
        end;
    end);
end;
