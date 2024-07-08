local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.PostPasswordValid);
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Enum.PasswordIssue);
local v4 = require(l_Modules_0.LuaApp.Enum.IssueCondition);
local v5 = {
    [v3.Length] = "Authentication.SignUp.Label.PasswordError1", 
    [v3.UsernameMatch] = "Authentication.SignUp.Label.PasswordError2", 
    [v3.Simple] = "Authentication.SignUp.Label.PasswordError3"
};
local function v6()
    return v5;
end;
local function v9()
    local v7 = {};
    for v8 in pairs(v5) do
        v7[v8] = v4.Problematic;
    end;
    return v7;
end;
local _ = function(v10, v11, v12, v13)
    return function(_)
        local v15 = {
            [v3.Length] = v4.Resolved, 
            [v3.UsernameMatch] = v4.Resolved, 
            [v3.Simple] = v13[v3.Simple] ~= v4.Hidden and v4.Resolved or v4.Hidden
        };
        if not (((v11 ~= nil and v12 ~= nil) and v11 ~= "") and v12 ~= "") or string.match(v12, "%S") == nil then
            for v16 in pairs(v15) do
                if v15[v16] == v4.Resolved then
                    v15[v16] = v4.Problematic;
                end;
            end;
            return v2.resolve({
                Input = v12, 
                InputValid = false, 
                IssueCondition = v15
            });
        else
            return v1(v10, v11, v12):andThen(function(v17)
                local v18 = {};
                local v19 = (v17 and v17.responseBody) and v17.responseBody.code;
                if type(v19) == "number" then
                    if v19 == 2 then
                        v15[v3.Length] = v4.Problematic;
                    elseif v19 == 3 then
                        v15[v3.UsernameMatch] = v4.Problematic;
                    elseif not (v19 ~= 4) or v19 == 5 then
                        v15[v3.Simple] = v4.Problematic;
                    end;
                else
                    warn("JSON failure");
                end;
                v18.Input = v12;
                v18.InputValid = v19 == 0;
                v18.IssueCondition = v15;
                return v2.resolve(v18);
            end, function(_)
                return v2.resolve({
                    Input = v12, 
                    InputValid = true, 
                    IssueCondition = v15
                });
            end);
        end;
    end;
end;
return {
    validateFunction = function(v22, v23, v24, v25)
        local l_username_0 = (v25 or {}).username;
        return function(_)
            local v28 = {
                [v3.Length] = v4.Resolved, 
                [v3.UsernameMatch] = v4.Resolved, 
                [v3.Simple] = v24[v3.Simple] ~= v4.Hidden and v4.Resolved or v4.Hidden
            };
            if not (((l_username_0 ~= nil and v23 ~= nil) and l_username_0 ~= "") and v23 ~= "") or string.match(v23, "%S") == nil then
                for v29 in pairs(v28) do
                    if v28[v29] == v4.Resolved then
                        v28[v29] = v4.Problematic;
                    end;
                end;
                return v2.resolve({
                    Input = v23, 
                    InputValid = false, 
                    IssueCondition = v28
                });
            else
                return v1(v22, l_username_0, v23):andThen(function(v30)
                    local v31 = {};
                    local v32 = (v30 and v30.responseBody) and v30.responseBody.code;
                    if type(v32) == "number" then
                        if v32 == 2 then
                            v28[v3.Length] = v4.Problematic;
                        elseif v32 == 3 then
                            v28[v3.UsernameMatch] = v4.Problematic;
                        elseif not (v32 ~= 4) or v32 == 5 then
                            v28[v3.Simple] = v4.Problematic;
                        end;
                    else
                        warn("JSON failure");
                    end;
                    v31.Input = v23;
                    v31.InputValid = v32 == 0;
                    v31.IssueCondition = v28;
                    return v2.resolve(v31);
                end, function(_)
                    return v2.resolve({
                        Input = v23, 
                        InputValid = true, 
                        IssueCondition = v28
                    });
                end);
            end;
        end;
    end, 
    getIssueMessageList = v6, 
    getDefaultIssues = v9
};
