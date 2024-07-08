local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.__index = v4;
local v5 = v3.tuple(v3.callback, v3.optional(v3.strictInterface({
    queueTimeLimit = v3.optional(v3.numberPositive), 
    queueErrorLimit = v3.optional(v3.numberPositive), 
    queueKeyLimit = v3.optional(v3.numberPositive)
})));
v4.new = function(v6, v7)
    assert(v5(v6, v7));
    v7 = v7 or {};
    local v8 = {
        _reportMethod = v6, 
        _queueTimeLimit = v7.queueTimeLimit or 30, 
        _queueErrorLimit = v7.queueErrorLimit or 30, 
        _queueKeyLimit = v7.queueKeyLimit or 10, 
        _errors = {}, 
        _totalErrorCount = 0, 
        _totalKeyCount = 0, 
        _runningTime = 0, 
        _renderSteppedConnection = nil
    };
    setmetatable(v8, v4);
    return v8;
end;
v4.hasError = function(v9, v10)
    if not (type(v10) == "string") or v10 == "" then
        return false;
    else
        return v9._errors[v10] ~= nil;
    end;
end;
v4.addError = function(v11, v12, v13)
    if not (type(v12) == "string") or v12 == "" then
        return ;
    else
        if v11._errors[v12] then
            v11._errors[v12].count = v11._errors[v12].count + 1;
        else
            v11._errors[v12] = {
                data = v13, 
                count = 1
            };
            v11._totalKeyCount = v11._totalKeyCount + 1;
        end;
        v11._totalErrorCount = v11._totalErrorCount + 1;
        if v11:isReadyToReport() then
            v11:reportAllErrors();
        end;
        return ;
    end;
end;
v4.isReadyToReport = function(v14)
    local v15 = true;
    if v14._queueKeyLimit > v14._totalKeyCount then
        v15 = true;
        if v14._queueErrorLimit > v14._totalErrorCount then
            v15 = false;
            if v14._totalErrorCount > 0 then
                v15 = v14._queueTimeLimit <= v14._runningTime;
            end;
        end;
    end;
    return v15;
end;
v4.reportAllErrors = function(v16)
    local v17 = v2.Dictionary.join(v16._errors, {});
    v16._errors = {};
    v16._totalErrorCount = 0;
    v16._totalKeyCount = 0;
    v16._runningTime = 0;
    for v18, v19 in pairs(v17) do
        v16._reportMethod(v18, v19.data, v19.count);
    end;
end;
v4._onRenderStep = function(v20, v21)
    v20._runningTime = v20._runningTime + v21;
    if v20:isReadyToReport() then
        v20:reportAllErrors();
    end;
end;
v4.startTimer = function(v22)
    if v22._renderSteppedConnection == nil then
        v22._runningTime = 0;
        v22._renderSteppedConnection = l_RunService_0.renderStepped:Connect(function(v23)
            v22:_onRenderStep(v23);
        end);
    end;
end;
v4.stopTimer = function(v24)
    if v24._renderSteppedConnection ~= nil then
        v24._renderSteppedConnection:Disconnect();
        v24._runningTime = 0;
        v24._renderSteppedConnection = nil;
    end;
end;
return v4;
