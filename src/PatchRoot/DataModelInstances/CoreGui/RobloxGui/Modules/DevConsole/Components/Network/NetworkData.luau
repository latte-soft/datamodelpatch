local l_LogService_0 = game:GetService("LogService");
local v1 = require(script.Parent.Parent.Parent.CircularBuffer);
local v2 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).NetworkFormatting.ChartHeaderNames;
local v4 = tonumber(settings():GetFVariable("NewDevConsoleMaxHttpCount"));
local v17 = {
    [l_ChartHeaderNames_0[1]] = function(v5, v6)
        return v5.Num < v6.Num;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v7, v8)
        return v7.Method < v8.Method;
    end, 
    [l_ChartHeaderNames_0[3]] = function(v9, v10)
        return v9.Status < v10.Status;
    end, 
    [l_ChartHeaderNames_0[4]] = function(v11, v12)
        return v11.Time < v12.Time;
    end, 
    [l_ChartHeaderNames_0[5]] = function(v13, v14)
        return v13.RequestType < v14.RequestType;
    end, 
    [l_ChartHeaderNames_0[6]] = function(v15, v16)
        return v15.Url < v16.Url;
    end
};
local function _(v18, v19, v20, v21, v22, v23, v24)
    return {
        Num = v18, 
        Method = v19, 
        Status = v20, 
        Time = v21, 
        RequestType = v22, 
        Url = v23, 
        Response = v24
    };
end;
local v26 = {};
v26.__index = v26;
v26.new = function(v27)
    local v28 = {};
    setmetatable(v28, v26);
    v28._isRunning = false;
    v28._isClient = v27;
    v28._httpResultSignal = not not v27 and l_LogService_0.HttpResultOut or l_LogService_0.ServerHttpResultOut;
    v28._httpEntryAdded = v2.new();
    v28._httpSummaryTable = {};
    v28._httpSummaryCount = 0;
    v28._httpEntryBuffer = v1.new(v4);
    v28._httpLifeTimeEntryCount = 0;
    v28._sortType = l_ChartHeaderNames_0[1];
    return v28;
end;
v26.addHttpEntry = function(v29, v30)
    v29._httpLifeTimeEntryCount = v29._httpLifeTimeEntryCount + 1;
    v29._httpEntryBuffer:push_back({
        Num = v29._httpLifeTimeEntryCount, 
        Method = v30.Method, 
        Status = v30.Status, 
        Time = v30.Time, 
        RequestType = v30.RequestType, 
        Url = v30.URL, 
        Response = v30.Response
    });
    local l_RequestType_0 = v30.RequestType;
    local v32 = v29._httpSummaryTable[l_RequestType_0];
    if v32 then
        v32.RequestCount = v32.RequestCount + 1;
        if v30.Status >= 400 then
            v32.FailedCount = v32.FailedCount + 1;
        end;
        v32.AverageTime = ((v32.AverageTime * v32.RequestCount + v30.Time) - v32.AverageTime) / v32.RequestCount;
        if v30.Time < v32.MinTime then
            v32.MinTime = v30.Time;
        end;
        if v32.MaxTime < v30.Time then
            v32.MaxTime = v30.Time;
        end;
    else
        v29._httpSummaryCount = v29._httpSummaryCount + 1;
        v29._httpSummaryTable[l_RequestType_0] = {
            RequestType = l_RequestType_0, 
            RequestCount = 1, 
            FailedCount = 0, 
            AverageTime = v30.Time, 
            MinTime = v30.Time, 
            MaxTime = v30.Time
        };
        if v30.Status >= 400 then
            v29._httpSummaryTable[v30.RequestType].FailedCount = 1;
            return ;
        end;
    end;
end;
v26.setSortType = function(v33, v34)
    if not v17[v34] then
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v34))), 2);
        return ;
    else
        v33._sortType = v34;
        v33._httpEntryAdded:Fire(v33._httpSummaryTable, v33._httpSummaryCount, v33:getSortedEntries());
        return ;
    end;
end;
v26.getSortType = function(v35)
    return v35._sortType;
end;
v26.resetHttpEntryList = function(v36)
    v36._httpSummaryTable = {};
    v36._httpEntryBuffer:reset();
    v36._httpLifeTimeEntryCount = 0;
    if v36._isClient then
        local l_l_LogService_0_HttpResultHistory_0 = l_LogService_0:GetHttpResultHistory();
        if l_l_LogService_0_HttpResultHistory_0 then
            for _, v39 in pairs(l_l_LogService_0_HttpResultHistory_0) do
                v36:addHttpEntry(v39);
            end;
        end;
    end;
end;
v26.Signal = function(v40)
    return v40._httpEntryAdded;
end;
v26.getSortedEntries = function(v41)
    local v42 = v41._httpEntryBuffer:iterator();
    local v43 = v42:next();
    local v44 = {};
    local v45 = 1;
    while v43 do
        v44[v45] = v43;
        v45 = v45 + 1;
        v43 = v42:next();
    end;
    table.sort(v44, v17[v41._sortType]);
    return v44;
end;
v26.getCurrentData = function(v46)
    return {
        summaryTable = v46._httpSummaryTable, 
        summaryCount = v46._httpSummaryCount, 
        entryList = v46:getSortedEntries()
    };
end;
v26.isRunning = function(v47)
    return v47._isRunning;
end;
v26.start = function(v48)
    if not v48._httpResultConnection then
        if v48._additionHttpSetup then
            v48._additionHttpSetup();
        end;
        v48._httpResultConnection = v48._httpResultSignal:connect(function(v49)
            v48:addHttpEntry(v49);
            v48._httpEntryAdded:Fire(v48._httpSummaryTable, v48._httpSummaryCount, v48:getSortedEntries());
        end);
        v48:resetHttpEntryList();
        if not v48._isClient then
            v48._onHttpResultApprovedConnection = l_LogService_0.OnHttpResultApproved:connect(function(v50)
                l_LogService_0:RequestHttpResultApproved();
                if v50 then
                    v48._onHttpResultApprovedConnection:Disconnect();
                    v48._onHttpResultApprovedConnection = nil;
                end;
            end);
            l_LogService_0:RequestServerHttpResult();
        end;
        v48._isRunning = true;
    end;
end;
v26.stop = function(v51)
    if v51._httpResultConnection then
        v51._httpResultConnection:Disconnect();
        v51._httpResultConnection = nil;
    end;
    v51._isRunning = false;
end;
return v26;
