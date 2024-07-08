local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_UpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).UpdateFetchingStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
return function(v3)
    local v4 = {};
    local v5 = false;
    local v6 = v3 or 0;
    return function(v7, v8)
        local function _()
            if not v5 then
                v5 = true;
                task.delay(v6, function()
                    local l_v4_0 = v4;
                    v4 = {};
                    v5 = false;
                    v8:dispatch(l_BatchUpdateFetchingStatus_0(l_v4_0, true));
                end);
                return ;
            else
                return ;
            end;
        end;
        return function(v11)
            if v11.type == l_UpdateFetchingStatus_0.name then
                table.insert(v4, v11);
                if not v5 then
                    v5 = true;
                    task.delay(v6, function()
                        local l_v4_1 = v4;
                        v4 = {};
                        v5 = false;
                        v8:dispatch(l_BatchUpdateFetchingStatus_0(l_v4_1, true));
                    end);
                end;
            elseif not (v11.type == l_BatchUpdateFetchingStatus_0.name) or v11.shouldImmediatelyDispatch then
                return v7(v11);
            else
                for _, v14 in pairs(v11.fetchingStatuses) do
                    table.insert(v4, v14);
                end;
                if not v5 then
                    v5 = true;
                    task.delay(v6, function()
                        local l_v4_2 = v4;
                        v4 = {};
                        v5 = false;
                        v8:dispatch(l_BatchUpdateFetchingStatus_0(l_v4_2, true));
                    end);
                end;
            end;
            return nil;
        end;
    end;
end;
