local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.HttpError);
local function _(v3)
    return v1.new(function(v4)
        delay(v3, function()
            v4();
        end);
    end);
end;
local function v6(v7, v8)
    return v7():catch(function(v9)
        v8.remainingAttempts = v8.remainingAttempts - 1;
        local v10 = false;
        if v8.remainingAttempts > 0 then
            v10 = true;
            if v9.kind ~= v2.Kind.RequireExternalRetry then
                v10 = v9.kind == v2.Kind.LuaTimeout;
            end;
        end;
        if v10 then
            if not v8.shouldImmediateRetry then
                local v11 = v8.backoffRate ^ (v8.maxAttempts - v8.remainingAttempts);
                return v1.new(function(v12)
                    delay(v11, function()
                        v12();
                    end);
                end):andThen(function()
                    return v6(v7, v8);
                end);
            else
                return v6(v7, v8);
            end;
        else
            return v1.reject(v9);
        end;
    end);
end;
return function(v13, v14)
    return function(v15, v16, v17)
        local v18 = {
            maxAttempts = 3, 
            backoffRate = 2, 
            shouldImmediateRetry = false
        };
        if not (not v14 or not v14.shouldImmediateRetry) then
            assert(type(v14.shouldImmediateRetry) == "boolean", "shouldImmediateRetry must be a bool");
            v18.shouldImmediateRetry = v14.shouldImmediateRetry;
        end;
        v18.remainingAttempts = v18.maxAttempts;
        local function v19()
            return v13(v15, v16, v17);
        end;
        return (v19():catch(function(v20)
            v18.remainingAttempts = v18.remainingAttempts - 1;
            local v21 = false;
            if v18.remainingAttempts > 0 then
                v21 = true;
                if v20.kind ~= v2.Kind.RequireExternalRetry then
                    v21 = v20.kind == v2.Kind.LuaTimeout;
                end;
            end;
            if v21 then
                if not v18.shouldImmediateRetry then
                    local v22 = v18.backoffRate ^ (v18.maxAttempts - v18.remainingAttempts);
                    return v1.new(function(v23)
                        delay(v22, function()
                            v23();
                        end);
                    end):andThen(function()
                        return v6(v19, v18);
                    end);
                else
                    return v6(v19, v18);
                end;
            else
                return v1.reject(v20);
            end;
        end));
    end;
end;
