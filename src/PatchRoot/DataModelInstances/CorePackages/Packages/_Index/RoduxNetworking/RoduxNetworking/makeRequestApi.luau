local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.makeActionCreator);
local v2 = require(l_Parent_0.RequestBuilder);
local v3 = require(l_Parent_0.NetworkStatus);
local v4 = require(l_Parent_0.Promise);
return function(v5, v6)
    local v7 = v3({
        keyPath = v5.keyPath, 
        killRequestWithFilteredIds = v5.killRequestWithFilteredIds
    });
    return function(v8, v9)
        local v10 = v1(v8);
        local v11 = nil;
        local function v14(v12, v13)
            if v13.mockNetworkImpl then
                error("Request already mocked - you may need to call `Mock.clear` between tests/uses");
            end;
            if type(v12) ~= "function" and type(v12) ~= v13.defaultType then
                error(v13.argumentName .. " must be a " .. v13.defaultType .. " or function");
            end;
            v11 = function(...)
                return v4[v13.defaultResolveMethod](type(v12) == "function" and v12(...) or v12);
            end;
        end;
        v10.API = function(...)
            local v15 = v9(function(...)
                return v2:new(...);
            end, ...);
            return function(v16)
                return v7.setStatus(v16, v15:getIds(), v15:makeKeyMapper(), function(v17, v18)
                    local v19 = v11 or v5.networkImpl;
                    local v20 = v15:makeOptions();
                    local v21 = v15:getNamedIds();
                    return v19(v15:makeUrl(v18), v6, v20):andThen(function(v22)
                        v17:dispatch(v10.Succeeded(v18, v22.responseBody, v21, v20, v15:getAdditionalData()));
                        return v22;
                    end, function(v23)
                        v17:dispatch(v10.Failed(v18, v23, v21, v20, v15:getAdditionalData()));
                        return v4.reject(v23);
                    end);
                end);
            end;
        end;
        v10.getStatus = function(v24, v25)
            return v7.getStatus(v24, (v9(function(...)
                return v2:new(...);
            end, v25):makeKeyMapper()(v25)));
        end;
        v10.Mock = {
            reply = function(v26)
                return v14(v26, {
                    defaultResolveMethod = "resolve", 
                    argumentName = "mockResponse", 
                    defaultType = "table", 
                    mockNetworkImpl = v11
                });
            end, 
            replyWithError = function(v27)
                return v14(v27, {
                    defaultResolveMethod = "reject", 
                    argumentName = "mockError", 
                    defaultType = "string", 
                    mockNetworkImpl = v11
                });
            end, 
            clear = function()
                v11 = nil;
            end
        };
        return v10;
    end;
end;
