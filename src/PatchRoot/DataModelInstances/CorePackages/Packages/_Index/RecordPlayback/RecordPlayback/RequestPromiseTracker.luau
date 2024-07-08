local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.SharedUtils);
local _ = require(l_Parent_1.HttpServiceMock);
local v5 = require(l_Parent_1.PrettyFormat);
local v6 = require(l_Parent_0.ImmediateSignal);
local v7 = {};
local v8 = {
    __index = v7
};
v7.new = function(v9, v10)
    return (setmetatable({
        _makeRequest = v9, 
        _running = true, 
        _source = v10, 
        _rejections = {}, 
        _promises = {}, 
        _warn = warn, 
        _onClose = v6.new()
    }, v8));
end;
v7.makeRequest = function(v11, v12, v13)
    if v11._running then
        local v19 = v2.try(v11._makeRequest, v12):andThen(function(v14)
            if v14.type == "internal-error" then
                local v15 = tostring(v14.error);
                table.insert(v11._rejections, v15);
                return {
                    type = "error", 
                    error = v15
                };
            elseif v14.type == "suspend" then
                return v2.new(function(v16, _)
                    v11._onClose:connect(function()
                        v16({
                            type = "error", 
                            error = "request was delayed until the record-playback logic ended"
                        });
                    end);
                end);
            else
                return v14;
            end;
        end, function(v18)
            table.insert(v11._rejections, v18);
            return {
                type = "error", 
                error = v18
            };
        end);
        v11._promises[v19] = true;
        return v19;
    else
        local v20 = string.format("Attempt to create request after test was done. Test location: %s\nRequest: %s\n\nRequest was made at: %s", v11._source, v5.format(v12), v13);
        v11._warn(v20);
        return v2.resolve({
            type = "error", 
            error = v20
        });
    end;
end;
v7.getRejections = function(v21)
    return v21._rejections;
end;
v7.getRunningPromises = function(v22)
    local v23 = {};
    for v24 in pairs(v22._promises) do
        if v24:getStatus() == v2.Status.Started then
            table.insert(v23, v24);
        end;
    end;
    return v23;
end;
v7.close = function(v25)
    if not v25._running then
        error("Attempt to close an already closed promise tracker");
    end;
    v25._running = false;
    v25._onClose:fire();
end;
return v7;
