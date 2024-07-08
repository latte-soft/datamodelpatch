local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_Modules_0.LuaApp.ArgCheck);
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.Http.HttpError);
local v6 = require(l_Modules_0.LuaApp.Http.HttpResponse);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v23 = {
    simpleSuccessRequest = function(v8)
        assert(v8 ~= nil, "Expected responseBody not to be nil");
        return function(v9, _, _)
            return v4.resolve(v6.new(v9, v8, 0, l_StatusCodes_0.OK));
        end;
    end, 
    simpleOngoingRequest = function()
        return function(_, _, _)
            return v4.new(function(_, _)
            end);
        end;
    end, 
    simpleFailRequest = function(v17, v18, v19)
        assert(v17 ~= nil, "Expected errKind not to be nil");
        if v18 == nil then
            v18 = "Fake request failed";
        end;
        assert(v18, "Cannot be nil");
        return function(v20, _, _)
            return v4.reject(v5.new(v20, v17, v18, v19));
        end;
    end
};
v23.failThenSuccessRequests = function(v24, v25, v26, v27, v28)
    if not v26 then
        v26 = 1;
    end;
    local v29 = 0;
    return function(v30, v31, v32)
        if v29 < v26 then
            v29 = v29 + 1;
            return v23.simpleFailRequest(v25, v27, v28)(v30, v31, v32);
        else
            return v23.simpleSuccessRequest(v24)(v30, v31, v32);
        end;
    end;
end;
local v33 = v2.interface({
    url = v2.string, 
    usePatterns = v2.optional(v2.boolean), 
    request = v2.callback
});
local v34 = v2.tuple(v2.array(v33), v2.string);
local function v40(v35, v36)
    v3.assert(v34(v35, v36));
    for _, v38 in ipairs(v35) do
        local _ = nil;
        if if not v38.usePatterns then v36:find(v38.url, nil, true) else v36:match(v38.url) then
            return v38.request;
        end;
    end;
    return nil;
end;
local v41 = v2.array(v33);
v23.mockEndpoints = function(v42)
    v3.assert(v41(v42));
    return function(v43, v44, v45)
        local v46 = v40(v42, v43);
        assert(v46, ("Url %q needs a request associated with it. (mockEndpoints requires all APIs to be mocked)"):format(v43));
        return v46(v43, v44, v45);
    end;
end;
return v23;
