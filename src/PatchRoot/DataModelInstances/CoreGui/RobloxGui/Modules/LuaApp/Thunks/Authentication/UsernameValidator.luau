local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.LuaApp.Promise);
local _ = require(l_Modules_0.LuaApp.Http.Requests.GetUsernameValid);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.PostUsernameValid);
local v7 = require(l_Modules_0.LuaApp.Enum.UsernameIssue);
local v8 = require(l_Modules_0.LuaApp.Enum.IssueCondition);
local v9 = require(l_Modules_0.LuaApp.Util.LocalSignUpUsernameValidator);
local v10 = {
    [0] = v7.None, 
    [1] = v7.AlreadyInUse, 
    [2] = v7.Inappropriate, 
    [3] = v7.LengthTooShortOrTooLong, 
    [4] = v7.BoundingUnderscore, 
    [5] = v7.MultipleUnderscores, 
    [6] = v7.ContainsSpaces, 
    [7] = v7.ContainsInvalidCharacter, 
    [10] = v7.ContainsPII
};
local v11 = {
    [v7.ContainsInvalidCharacter] = "Authentication.SignUp.Label.UsernameError1", 
    [v7.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
    [v7.AlreadyInUse] = "Authentication.SignUp.Label.UsernameError3", 
    [v7.Inappropriate] = "Authentication.SignUp.Label.UsernameError4", 
    [v7.BoundingUnderscore] = "Authentication.SignUp.Label.UsernameError5", 
    [v7.MultipleUnderscores] = "Authentication.SignUp.Label.UsernameError6", 
    [v7.ContainsPII] = "Authentication.SignUp.Label.UsernameError7"
};
local function v12()
    return v11;
end;
local function v15()
    local v13 = {};
    for v14 in pairs(v11) do
        if not (v14 ~= v7.ContainsInvalidCharacter and v14 ~= v7.LengthTooShortOrTooLong) or v14 == v7.AlreadyInUse then
            v13[v14] = v8.Problematic;
        else
            v13[v14] = v8.Hidden;
        end;
    end;
    return v13;
end;
local function v20(v16)
    local v17 = v2.Dictionary.join(v16);
    for v18, v19 in pairs(v17) do
        if v19 ~= v8.Hidden then
            v17[v18] = v8.Problematic;
        end;
    end;
    return v17;
end;
local _ = function(v21, v22, v23, v24, v25)
    return function(_)
        v3.isType(v22, "string", "username passed into UsernameValidator.validateFunction");
        v3.isType(v23, "string", "birthday passed into UsernameValidator.validateFunction");
        v3.isType(v24, "table", "previousIssues passed into UsernameValidator.validateFunction");
        if v22 == "" then
            return v4.resolve({
                Input = v22, 
                InputValid = false, 
                IssueCondition = v20(v24)
            });
        else
            local v27 = v2.Dictionary.join(v24);
            local v28 = v9:locallyValidateUsername(v22);
            local v29 = false;
            for _, v31 in pairs(v28) do
                if v31 then
                    v29 = true;
                    break;
                end;
            end;
            if not v29 then
                for v32, v33 in pairs(v27) do
                    v27[v32] = v33 == v8.Hidden and v8.Hidden or v8.Resolved;
                end;
                return v6(v21, v22, v23, v25):andThen(function(v34)
                    local v35 = (v34 and v34.responseBody) and v34.responseBody.code;
                    local v36 = v10[v35];
                    if not v36 then
                        warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v35);
                    elseif v36 == v7.ContainsSpaces then
                        v27[v7.ContainsInvalidCharacter] = v8.Problematic;
                    elseif v36 ~= v7.None then
                        v27[v36] = v8.Problematic;
                    end;
                    return v4.resolve({
                        Input = v22, 
                        InputValid = v36 == v7.None, 
                        IssueCondition = v27
                    });
                end, function(_)
                    return v4.resolve({
                        Input = v22, 
                        InputValid = true, 
                        IssueCondition = v27
                    });
                end);
            else
                for v38, v39 in pairs(v24) do
                    local v40 = v28[v38];
                    if not (v39 == v8.Hidden) or not v40 then
                        if v39 ~= v8.Hidden then
                            v27[v38] = v40 == false and v8.Resolved or v8.Problematic;
                        end;
                    else
                        v27[v38] = v8.Problematic;
                    end;
                end;
                return v4.resolve({
                    Input = v22, 
                    InputValid = false, 
                    IssueCondition = v27
                });
            end;
        end;
    end;
end;
return {
    validateFunction = function(v42, v43, v44, v45)
        v45 = v45 or {};
        local l_birthday_0 = v45.birthday;
        local l_context_0 = v45.context;
        return function(_)
            v3.isType(v43, "string", "username passed into UsernameValidator.validateFunction");
            v3.isType(l_birthday_0, "string", "birthday passed into UsernameValidator.validateFunction");
            v3.isType(v44, "table", "previousIssues passed into UsernameValidator.validateFunction");
            if v43 == "" then
                return v4.resolve({
                    Input = v43, 
                    InputValid = false, 
                    IssueCondition = v20(v44)
                });
            else
                local v49 = v2.Dictionary.join(v44);
                local v50 = v9:locallyValidateUsername(v43);
                local v51 = false;
                for _, v53 in pairs(v50) do
                    if v53 then
                        v51 = true;
                        break;
                    end;
                end;
                if not v51 then
                    for v54, v55 in pairs(v49) do
                        v49[v54] = v55 == v8.Hidden and v8.Hidden or v8.Resolved;
                    end;
                    return v6(v42, v43, l_birthday_0, l_context_0):andThen(function(v56)
                        local v57 = (v56 and v56.responseBody) and v56.responseBody.code;
                        local v58 = v10[v57];
                        if not v58 then
                            warn("UsernameValidator.validateFunction() Received unrecognized response code: ", v57);
                        elseif v58 == v7.ContainsSpaces then
                            v49[v7.ContainsInvalidCharacter] = v8.Problematic;
                        elseif v58 ~= v7.None then
                            v49[v58] = v8.Problematic;
                        end;
                        return v4.resolve({
                            Input = v43, 
                            InputValid = v58 == v7.None, 
                            IssueCondition = v49
                        });
                    end, function(_)
                        return v4.resolve({
                            Input = v43, 
                            InputValid = true, 
                            IssueCondition = v49
                        });
                    end);
                else
                    for v60, v61 in pairs(v44) do
                        local v62 = v50[v60];
                        if not (v61 == v8.Hidden) or not v62 then
                            if v61 ~= v8.Hidden then
                                v49[v60] = v62 == false and v8.Resolved or v8.Problematic;
                            end;
                        else
                            v49[v60] = v8.Problematic;
                        end;
                    end;
                    return v4.resolve({
                        Input = v43, 
                        InputValid = false, 
                        IssueCondition = v49
                    });
                end;
            end;
        end;
    end, 
    getIssueMessageList = v12, 
    getDefaultIssues = v15
};
