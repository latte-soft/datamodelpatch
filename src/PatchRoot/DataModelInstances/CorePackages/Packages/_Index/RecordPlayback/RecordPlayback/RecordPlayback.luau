local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.SharedUtils);
local l_unwrapPromiseError_0 = v3.unwrapPromiseError;
local v5 = require(l_Parent_1.RequestPipeline);
local v6 = require(l_Parent_1.PrettyFormat);
local v7 = require(l_Parent_1.HttpServiceMock);
local _ = require(l_Parent_0.Artifacts);
local _ = require(l_Parent_0.ArtifactLoader);
local _ = require(l_Parent_0.RequestFormatter);
local v11 = require(l_Parent_0.RequestPromiseTracker);
local v12 = require(l_Parent_0.UrlUtils);
local l_LineWriter_0 = v3.LineWriter;
local l_Error_0 = v3.Error;
local l_try_0 = v3.try;
local function v20(v16, v17)
    local l_url_0 = v16.url;
    local l_url_1 = v17.url;
    if l_url_0.host == l_url_1.host then
        if l_url_0.path == l_url_1.path then
            return v12.formatQuery(l_url_0.query) < v12.formatQuery(l_url_1.query);
        else
            return l_url_0.path < l_url_1.path;
        end;
    else
        return l_url_0.host < l_url_1.host;
    end;
end;
local v21 = {};
local v22 = {
    __index = v21
};
v21.new = function(v23, v24)
    return (setmetatable({
        _recordMissingRequests = false, 
        _forceRecording = false, 
        _ignoreMissingRequests = false, 
        _assertRequestExistence = true, 
        _useRequestsOnlyOnce = true, 
        _artifactLoader = v23, 
        _contentLocation = v24, 
        _httpService = l_HttpService_0, 
        _warn = warn
    }, v22));
end;
v21.forceRecording = function(v25)
    v25._forceRecording = true;
    return v25;
end;
v21.recordMissingRequests = function(v26)
    v26._recordMissingRequests = true;
    return v26;
end;
v21.ignoreMissingRequests = function(v27)
    v27._ignoreMissingRequests = true;
    return v27;
end;
v21.skipExistenceAssertion = function(v28)
    v28._assertRequestExistence = false;
    return v28;
end;
v21.reusableRequests = function(v29)
    v29._useRequestsOnlyOnce = false;
    return v29;
end;
v21.execute = function(v30, v31)
    if v30._forceRecording then
        v30._artifactLoader:delete(v30._contentLocation);
    end;
    local v32 = v30._artifactLoader:load(v30._contentLocation, {
        useRequestsOnce = v30._useRequestsOnlyOnce
    });
    local v33 = v5.RequestPipeline.new();
    if v32 then
        v30:_insertPlayback(v32, v33);
    end;
    if not (v32 ~= nil and not v30._recordMissingRequests) then
        v30:_insertRecorder(v33);
    end;
    if v30._ignoreMissingRequests then
        v30:_insertIgnore(v33);
    end;
    local v35 = v11.new(function(v34)
        return v33:process(v34);
    end, (debug.traceback(nil, 2)));
    v35._warn = v30._warn;
    local v38 = v7.new(function(v36, v37)
        return v35:makeRequest(v36, v37);
    end);
    local v39, v40 = l_try_0(function()
        return v31(v38) or nil;
    end);
    v35:close();
    if v39 then
        local v41 = l_LineWriter_0.new();
        if v30._assertRequestExistence and v32 ~= nil then
            local v42 = v32:getUnusedRequests();
            local v43 = #v42;
            table.sort(v42, v20);
            if v43 == 1 then
                v41:write("A request was expected to happen but it did not: " .. v6.format(v42[1], {}));
            elseif v43 > 1 then
                v41:write("%d requests were expected to happen:", v43);
                for _, v45 in ipairs(v42) do
                    v41:write(" -> " .. v6.format(v45, {}));
                end;
            end;
        end;
        if v40 then
            local v46, v47 = l_try_0(v40);
            if not v46 then
                v41:verticalSpace():write("The clean-up callback has encountered an error: %s", (tostring(v47)));
            end;
        end;
        local v48 = v35:getRejections();
        local v49 = #v48;
        if v49 ~= 0 then
            v41:verticalSpace():write("%d promise%s rejected:", v49, v49 == 1 and "" or "s");
            for _, v51 in ipairs(v48) do
                v41:write(" -> %s", (tostring(v51)));
            end;
        end;
        local v52 = v35:getRunningPromises();
        local v53 = #v52;
        if v53 ~= 0 then
            v41:verticalSpace():write("%d promise%s are still running. Make sure that these promise are being cancelled:", v53, v53 == 1 and "" or "s");
            for _, v55 in ipairs(v52) do
                v41:write(" -> %s", v55._source);
            end;
        end;
        local v56 = v41:toString();
        if v56 ~= "" then
            error(l_Error_0.new(v56, 1));
        end;
        return ;
    else
        error(v40);
        return ;
    end;
end;
v21._insertRecorder = function(v57, v58)
    local v59 = v5.createPassthrough(v57._httpService);
    local v60 = v57._artifactLoader:getWriter(v57._contentLocation);
    v58:appendProcessor(v5.Matcher.all(), function(v61)
        local v62 = v59(v61):expect();
        if v62.type == "response" then
            v60:writeResponse(v61, v62.response);
            return v62;
        else
            if v62.type == "error" then
                v60:writeError(v61, l_unwrapPromiseError_0(v62.error));
            end;
            return v62;
        end;
    end);
end;
v21._insertPlayback = function(v63, v64, v65)
    v65:appendOptionalProcessor(function(v66)
        local v67 = v64:find(v66);
        if v67 == nil then
            if not v63._recordMissingRequests then
                return nil, ("Unable to find response for the request %s\n\n"):format(v6.format(v66, {})) .. "To record only new requests, configure the RecordPlayback object by calling `recordMissingRequests()`\n";
            else
                return nil;
            end;
        elseif v67.response ~= nil then
            return {
                type = "response", 
                response = v67.response
            };
        else
            return {
                type = "error", 
                error = v67.error
            };
        end;
    end);
end;
v21._insertIgnore = function(_, v69)
    v69:appendProcessor(v5.Matcher.all(), function(_)
        return {
            type = "suspend"
        };
    end);
end;
return v21;
