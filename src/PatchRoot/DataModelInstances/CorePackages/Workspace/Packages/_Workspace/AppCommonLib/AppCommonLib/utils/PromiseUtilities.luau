local l_Parent_0 = script:FindFirstAncestor("AppCommonLib").Parent;
local v1 = require(l_Parent_0.Result);
local v2 = require(l_Parent_0.Promise);
return {
    Batch = function(v3, v4)
        assert(type(v3) == "table", "PromiseUtilities expects a list of Promises");
        local v5 = 0;
        for _, v7 in pairs(v3) do
            assert(v2.is(v7), "PromiseUtilities expects a list of Promises");
            v5 = v5 + 1;
        end;
        return v2.new(function(v8, _)
            local v10 = 0;
            local v11 = {};
            local function _(v12, v13, v14)
                v11[v12] = v1.new(v13, v14);
                v10 = v10 + 1;
                if v10 == v5 then
                    v8(v11);
                end;
            end;
            if next(v3) == nil then
                v8(v11);
            end;
            for v16, v17 in pairs(v3) do
                v17:andThen(function(v18, ...)
                    if select("#", ...) > 0 then
                        warn("Promises in PromiseUtilities.Batch should not return tuple");
                    end;
                    v11[v16] = v1.new(true, v18);
                    v10 = v10 + 1;
                    if v10 == v5 then
                        v8(v11);
                    end;
                end, function(v19)
                    v11[v16] = v1.new(false, v19);
                    v10 = v10 + 1;
                    if v10 == v5 then
                        v8(v11);
                    end;
                    if v4 then
                        v4(v19);
                    end;
                end);
            end;
        end);
    end, 
    CountResults = function(v20)
        local v21 = 0;
        local v22 = 0;
        for _, v24 in pairs(v20) do
            local v25, _ = v24:unwrap();
            if not v25 then
                v22 = v22 + 1;
            end;
            v21 = v21 + 1;
        end;
        return {
            successCount = v21 - v22, 
            failureCount = v22, 
            totalCount = v21
        };
    end
};
