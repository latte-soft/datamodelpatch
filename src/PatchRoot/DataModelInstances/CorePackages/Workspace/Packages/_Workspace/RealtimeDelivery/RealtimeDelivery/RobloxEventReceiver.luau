local l_Signal_0 = require(script:FindFirstAncestor("RealtimeDelivery").Parent.AppCommonLib).Signal;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = {};
v2.__index = v2;
v2.observeEvent = function(v3, v4, v5)
    assert(type(v4) == "string", "Expected namespace to be a string");
    assert(type(v5) == "function", "Expected callback to be a function");
    local v6 = v3.namespaceTable[v4];
    if v6 == nil then
        v6 = l_Signal_0.new();
        v3.namespaceTable[v4] = v6;
    end;
    return v6:connect(v5);
end;
v2.new = function(v7)
    local v8 = {
        namespaceTable = {}
    };
    setmetatable(v8, v2);
    v8.connections = {
        v7.RobloxEventReceived:Connect(function(v9)
            local v10 = v8.namespaceTable[v9.namespace];
            if v10 == nil then
                return ;
            else
                local v11 = nil;
                if v9.detail and v9.detail ~= "" then
                    local l_status_0, l_result_0 = pcall(function()
                        return l_HttpService_0:JSONDecode(v9.detail);
                    end);
                    v11 = not not l_status_0 and l_result_0 or v9.detail;
                else
                    v11 = {};
                end;
                v10:fire(v11, v9.detailType);
                return ;
            end;
        end), 
        v7.RobloxConnectionChanged:Connect(function(v14, v15, v16, v17)
            local v18 = v8.namespaceTable[v14];
            if v18 == nil then
                return ;
            else
                local v19 = nil;
                if v17 then
                    local l_status_1, l_result_1 = pcall(function()
                        return l_HttpService_0:JSONDecode(v17);
                    end);
                    v19 = l_status_1 and l_result_1;
                end;
                v18:fire(v15, v16, v19);
                return ;
            end;
        end)
    };
    return v8;
end;
return v2;
