local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v3 = require(l_CorePackages_0.Logging);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = {
    GET_INSTRUCTIONS = "timed-entertainment-allowance/v1/instructions", 
    REPORT_EXECUTION = "timed-entertainment-allowance/v1/reportExecute"
};
local v6 = {
    GET_INSTRUCTIONS = {
        errorCode = "number", 
        instructions = "table"
    }, 
    INSTRUCTION = {
        type = "number", 
        instructionName = "string", 
        serialId = "string", 
        title = "string", 
        message = "string", 
        url = "string", 
        modalType = "number", 
        data = "string"
    }, 
    REPORT_EXECUTION = {
        errorCode = "number"
    }
};
local v7 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = v5.GET_INSTRUCTIONS
})();
local v8 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = v5.REPORT_EXECUTION
})();
local v9 = l_UrlBuilder_0.new({
    base = l_Url_0.AUTH_URL, 
    path = "v1/logout"
})();
local function v14(v10, v11)
    for v12, v13 in pairs(v10) do
        assert(v11[v12] ~= nil, "Missing key");
        assert(type(v11[v12]) == v13, "Wrong type");
    end;
end;
return {
    httpService = nil, 
    new = function(v15, v16)
        v4.isNotNil(v16, "httpService");
        local v17 = {
            httpService = v16
        };
        setmetatable(v17, v15);
        v15.__index = v15;
        return v17;
    end, 
    getInstructions = function(v18, v19)
        v4.isNotNil(v18.httpService, "httpService");
        v4.isNotNil(v19, "callback");
        v18.httpService:RequestInternal({
            Url = v7, 
            Method = "GET"
        }):Start(function(v20, v21)
            local v22 = nil;
            local v23 = nil;
            local v24 = false;
            local v25 = {};
            if v20 then
                if v21.StatusCode == 401 then
                    v22 = false;
                    v24 = true;
                    v23 = "Unauthorized";
                elseif not (v21.StatusCode >= 200) or v21.StatusCode >= 400 then
                    v22 = false;
                    v23 = "Status code: " .. v21.StatusCode;
                else
                    local l_status_0, l_result_0 = pcall(function()
                        local v26 = v18.httpService:JSONDecode(v21.Body);
                        v14(v6.GET_INSTRUCTIONS, v26);
                        assert(v26.errorCode == 0, "Error code is not 0");
                        for _, v28 in ipairs(v26.instructions) do
                            v14(v6.INSTRUCTION, v28);
                        end;
                        v25 = v26.instructions;
                    end);
                    v22 = l_status_0;
                    v23 = l_result_0;
                end;
            else
                v22 = false;
                v23 = "Connection error";
            end;
            if not v22 then
                v3.warn("HttpRequests" .. " getInstructions failed: " .. v7 .. ", " .. v23);
            end;
            v19(v22, v24, v25);
        end);
    end, 
    reportExecution = function(v31, v32, v33, v34)
        v4.isNotNil(v31.httpService, "httpService");
        v31.httpService:RequestInternal({
            Url = v8, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json"
            }, 
            Body = v31.httpService:JSONEncode({
                instructionName = v32, 
                serialId = v33, 
                execTime = os.date("%Y-%m-%dT%H:%M:%SZ")
            })
        }):Start(function(v35, v36)
            local v37 = nil;
            local v38 = nil;
            if v35 then
                if v36.StatusCode < 200 and v36.StatusCode >= 400 then
                    v37 = false;
                    v38 = "Status code: " .. v36.StatusCode;
                else
                    local l_status_1, l_result_1 = pcall(function()
                        local v39 = v31.httpService:JSONDecode(v36.Body);
                        v14(v6.REPORT_EXECUTION, v39);
                        assert(v39.errorCode == 0, "Error code is not 0");
                    end);
                    v37 = l_status_1;
                    v38 = l_result_1;
                end;
            else
                v37 = false;
                v38 = "Connection error";
            end;
            if not v37 then
                v3.warn("HttpRequests" .. " reportExecution failed: " .. v8 .. ", " .. v38);
            end;
            if v34 ~= nil then
                v34(v37);
            end;
        end);
    end, 
    logout = function(v42)
        v4.isNotNil(v42.httpService, "httpService");
        local v43 = v42.httpService:RequestInternal({
            Url = v9, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json"
            }, 
            Body = ""
        });
        pcall(function()
            v43:Start(function(_, _)
            end);
        end);
    end
};
