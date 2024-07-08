local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GetDisplayNamesValid);
local v8 = require(l_Modules_0.LuaApp.Enum.UsernameIssue);
local v9 = require(l_Modules_0.LuaApp.Enum.IssueCondition);
local v10 = require(l_Modules_0.LuaApp.Util.LocalSignUpDisplayNameValidator);
local v11 = {
    [0] = v8.None, 
    [1] = v8.LengthTooShortOrTooLong, 
    [2] = v8.LengthTooShortOrTooLong, 
    [3] = v8.ContainsInvalidCharacter, 
    [4] = v8.Inappropriate
};
local v12 = {
    [v8.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1", 
    [v8.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
    [v8.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3", 
    [v8.Inappropriate] = "Authentication.SignUp.Label.UsernameError4", 
    [v8.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5", 
    [v8.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6", 
    [v8.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
};
local function v13()
    return v12;
end;
local function v16()
    local v14 = {};
    for v15 in pairs(v12) do
        v14[v15] = v9.Hidden;
    end;
    return v14;
end;
local function v21(v17)
    local v18 = v3.Dictionary.join(v17);
    for v19, v20 in pairs(v18) do
        if v20 ~= v9.Hidden then
            v18[v19] = v9.Problematic;
        end;
    end;
    return v18;
end;
return {
    validateFunction = function(v22, v23, v24, v25)
        return function(_)
            v4.isType(v23, "string", "displayName passed into DisplayNameValidator.validateFunction");
            v4.isType(v24, "table", "previousIssues passed into DisplayNameValidator.validateFunction");
            if v23 == "" then
                return v5.resolve({
                    Input = v23, 
                    InputValid = false, 
                    IssueCondition = v21(v24)
                });
            else
                local v27 = v3.Dictionary.join(v24);
                local v28 = v10:locallyValidateDisplayName(v23);
                local v29 = false;
                for _, v31 in pairs(v28) do
                    if v31 then
                        v29 = true;
                        break;
                    end;
                end;
                if not v29 then
                    for v32, v33 in pairs(v27) do
                        v27[v32] = v33 == v9.Hidden and v9.Hidden or v9.Resolved;
                    end;
                    return v7(v22, v23, v25.birthday):andThen(function(_)
                        return v5.resolve({
                            Input = v23, 
                            InputValid = true, 
                            IssueCondition = v27
                        });
                    end, function(v35)
                        local v36 = l_HttpService_0:JSONDecode(v35.Body);
                        local v37 = not not v36 and v36.errors or {};
                        local v38 = nil;
                        for _, v40 in pairs(v37) do
                            if v40.code then
                                v38 = v11[v40.code];
                                break;
                            end;
                        end;
                        if not v38 then
                            v6("DisplayNameValidator_GetDisplayNamesValid_Failed", 1);
                            return v5.resolve({
                                Input = v23, 
                                InputValid = true, 
                                IssueCondition = v27
                            });
                        else
                            v27[v38] = v9.Problematic;
                            return v5.resolve({
                                Input = v23, 
                                InputValid = false, 
                                IssueCondition = v27
                            });
                        end;
                    end);
                else
                    for v41, v42 in pairs(v24) do
                        local v43 = v28[v41];
                        if not (v42 == v9.Hidden) or not v43 then
                            if v42 ~= v9.Hidden then
                                v27[v41] = v43 == false and v9.Resolved or v9.Problematic;
                            end;
                        else
                            v27[v41] = v9.Problematic;
                        end;
                    end;
                    return v5.resolve({
                        Input = v23, 
                        InputValid = false, 
                        IssueCondition = v27
                    });
                end;
            end;
        end;
    end, 
    getIssueMessageList = v13, 
    getDefaultIssues = v16
};
