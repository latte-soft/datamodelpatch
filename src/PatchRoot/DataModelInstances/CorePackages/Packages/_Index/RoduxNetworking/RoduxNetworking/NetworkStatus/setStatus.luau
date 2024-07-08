local v0 = require(script.Parent.EnumNetworkStatus);
local v1 = require(script.Parent.buildActionName);
local v2 = require(script.Parent.Promise);
return function(v3)
    local v4 = require(script.Parent.getStatus)(v3);
    local function _(v5, v6, v7)
        return {
            ids = v5, 
            keymapper = v6, 
            status = v7, 
            type = v1(v3)
        };
    end;
    local function v15(v9, v10, v11)
        local v12 = {};
        for _, v14 in ipairs(v10) do
            if v4(v9, v11(v14)) ~= v0.Fetching then
                table.insert(v12, v14);
            end;
        end;
        return v12;
    end;
    return function(v16, v17, v18, v19)
        local v20 = v15(v16:getState(), v17, v18);
        if (v3.killRequestWithFilteredIds and #v17 > 0) and #v20 == 0 then
            return v2.reject("Request with provided IDs already fetching.");
        else
            v16:dispatch({
                ids = v20, 
                keymapper = v18, 
                status = v0.Fetching, 
                type = v1(v3)
            });
            return v19(v16, v20):andThen(function(v21)
                v16:dispatch({
                    ids = v20, 
                    keymapper = v18, 
                    status = v0.Done, 
                    type = v1(v3)
                });
                return v21;
            end, function(v22)
                v16:dispatch({
                    ids = v20, 
                    keymapper = v18, 
                    status = v0.Failed, 
                    type = v1(v3)
                });
                return v2.reject(v22);
            end);
        end;
    end;
end;
