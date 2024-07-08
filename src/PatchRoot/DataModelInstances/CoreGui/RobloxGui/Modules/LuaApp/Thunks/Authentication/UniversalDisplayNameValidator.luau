local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Workspace.Packages.Promise);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.GetDisplayNamesValid);
local v6 = game:DefineFastInt("FIntDisplayNameMaxLength", 20);
local v7 = game:DefineFastInt("FIntDisplayNameMinLength", 3);
local v8 = require(l_Modules_0.LuaApp.Enum.IssueCondition);
local v9 = {
    ContainsInvalidCharacter = "ContainsInvalidCharacter", 
    Inappropriate = "Inappropriate", 
    LengthTooShortOrTooLong = "LengthTooShortOrTooLong", 
    MixedCharactersError = "MixedCharactersError", 
    None = "None", 
    TooManyCharacterSets = "TooManyCharacterSets", 
    ValidationFailed = "ValidationFailed"
};
local v10 = {
    [0] = v9.None, 
    [1] = v9.LengthTooShortOrTooLong, 
    [2] = v9.LengthTooShortOrTooLong, 
    [3] = v9.ContainsInvalidCharacter, 
    [4] = v9.Inappropriate, 
    [5] = v9.ValidationFailed, 
    [8] = v9.TooManyCharacterSets
};
local v11 = {
    [v9.ContainsInvalidCharacter] = "Feature.DisplayName.Label.ValidCharacters", 
    [v9.LengthTooShortOrTooLong] = "Authentication.SignUp.Label.UsernameError2", 
    [v9.MixedCharactersError] = "Feature.DisplayName.Label.MixedCharactersError", 
    [v9.Inappropriate] = "Feature.DisplayName.Label.ModeratedCheck", 
    [v9.ValidationFailed] = "Feature.DisplayName.Label.ValidationFailed"
};
local v12 = {
    [v9.LengthTooShortOrTooLong] = true, 
    [v9.ContainsInvalidCharacter] = true
};
local function v16()
    local v13 = {};
    for v14, _ in v11, nil, nil do
        if not v12[v14] then
            v13[v14] = v8.Hidden;
        end;
    end;
    return v13;
end;
isValidLength = function(v17)
    local v18 = string.len(v17);
    local v19 = true;
    if v18 >= v7 then
        v19 = v6 < v18;
    end;
    return v19;
end;
locallyValidateDisplayName = function(v20)
    return isValidLength(v20), {
        [v9.LengthTooShortOrTooLong] = if not isValidLength(v20) then v8.Resolved else v8.Problematic
    };
end;
return {
    validateFunction = function(v21, v22, v23, v24)
        return function(_)
            local v26 = v16();
            if v22 == "" then
                if v23[v9.ValidationFailed] == v8.Problematic then
                    return v3.resolve({
                        Input = v22, 
                        InputValid = false, 
                        IssueCondition = v23, 
                        hasRequestFailed = true
                    });
                else
                    return v3.resolve({
                        Input = v22, 
                        InputValid = false, 
                        IssueCondition = v26
                    });
                end;
            else
                local v27 = {};
                for v28 in v12, nil, nil do
                    v27[v28] = v8.Resolved;
                end;
                local v29 = v4.Dictionary.join(v26, v27);
                local v30, v31 = locallyValidateDisplayName(v22);
                if not v30 then
                    return v5(v21, v22, v24.birthday):andThen(function()
                        return v3.resolve({
                            Input = v22, 
                            InputValid = true, 
                            IssueCondition = v29, 
                            hasRequestFailed = false
                        });
                    end, function(v32)
                        if v32 and v32.StatusCode == 400 then
                            local v33 = if not not v32 and v32.Body then l_HttpService_0:JSONDecode(v32.Body) else nil;
                            local v34 = if not not v33 and v33.errors then v33.errors else {};
                            local l_v29_0 = v29;
                            v4.List.map(v34, function(v36)
                                l_v29_0[v10[v36.code]] = v8.Problematic;
                            end);
                            return v3.resolve({
                                Input = v22, 
                                InputValid = false, 
                                IssueCondition = l_v29_0, 
                                hasRequestFailed = false
                            });
                        else
                            local v37 = {};
                            for v38 in pairs(v29) do
                                v37[v38] = v8.Hidden;
                            end;
                            v37[v9.ValidationFailed] = v8.Problematic;
                            return v3.resolve({
                                Input = v22, 
                                InputValid = false, 
                                IssueCondition = v37, 
                                hasRequestFailed = true
                            });
                        end;
                    end);
                elseif v23[v9.ValidationFailed] == v8.Problematic then
                    return v3.resolve({
                        Input = v22, 
                        InputValid = false, 
                        IssueCondition = v23, 
                        hasRequestFailed = true
                    });
                else
                    return v3.resolve({
                        Input = v22, 
                        InputValid = false, 
                        IssueCondition = v4.Dictionary.join(v29, v31)
                    });
                end;
            end;
        end;
    end, 
    getIssueMessageList = function()
        return v11;
    end, 
    getDefaultIssues = function()
        local v39 = {};
        for v40 in pairs(v11) do
            if not v12[v40] then
                v39[v40] = v8.Hidden;
            else
                v39[v40] = v8.Problematic;
            end;
        end;
        return v39;
    end
};
