local l_LogService_0 = game:GetService("LogService");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(script.Parent.Parent.Parent.Constants);
local l_MainWindow_0 = v2.DefaultFontSize.MainWindow;
local l_Log_0 = v2.Font.Log;
local l_MaxStringSize_0 = v2.LogFormatting.MaxStringSize;
local l_EnumToMsgTypeName_0 = v2.EnumToMsgTypeName;
local v7 = require(script.Parent.Parent.Parent.CircularBuffer);
local v8 = require(script.Parent.Parent.Parent.Signal);
local v9 = tonumber(settings():GetFVariable("NewDevConsoleMaxLogCount"));
local v10 = {
    "ClassDescriptor failed to learn", 
    "EventDescriptor failed to learn", 
    "Type failed to learn"
};
local v11 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v12 = {};
v12.__index = v12;
local function v18(v13, v14, v15)
    local v16 = nil;
    local v17 = #v13;
    v16 = if v17 < l_MaxStringSize_0 then string.format("%s -- %s", v14, v13) else string.format("%s -- %s", v14, (string.sub(v13, 1, l_MaxStringSize_0)));
    return {
        Message = v16, 
        CharCount = v17, 
        Type = v15, 
        Dims = l_TextService_0:GetTextSize(v16, l_MainWindow_0, l_Log_0, Vector2.new())
    };
end;
local function v23(v19)
    if v19.Type ~= Enum.MessageType.MessageWarning.Value then
        return false;
    else
        local v20 = false;
        for _, v22 in ipairs(v10) do
            if string.find(v19.Message, v22) ~= nil then
                return true;
            end;
        end;
        return v20;
    end;
end;
local function v27(v24, v25, v26)
    if not (#v26 == 0) or next(v25) then
        if not next(v25) or v25[l_EnumToMsgTypeName_0[v24.Type]] then
            if #v26 > 0 and string.find(v24.Message:lower(), v26:lower()) == nil then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local _ = function(v28)
    local v29 = false;
    for _, v31 in pairs(v28) do
        v29 = v29 or v31;
    end;
    return v29;
end;
local function v42(v33, v34, v35, v36)
    v33:reset();
    local v37 = false;
    for _, v39 in pairs(v35) do
        v37 = v37 or v39;
    end;
    local l_v37_0 = v37;
    if not (#v36 == 0) or l_v37_0 then
        v37 = 0;
        local v41 = v34:next();
        while v41 do
            if v27(v41, v35, v36) then
                v37 = v37 + 1;
                v33:push_back(v41);
            end;
            v41 = v34:next();
        end;
        if v37 == 0 then
            if #v36 > 0 then
                v33:push_back((v18(string.format("\"%s\" was not found", v36), "", 0)));
                return ;
            else
                v33:push_back((v18("No Messages were found", "", 0)));
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v12.checkErrorWarningCounter = function(v43, v44)
    if v44 == Enum.MessageType.MessageWarning.Value then
        v43._warningCount = v43._warningCount + 1;
        v43._errorWarningSignal:Fire(v43._errorCount, v43._warningCount);
        return ;
    else
        if v44 == Enum.MessageType.MessageError.Value then
            v43._errorCount = v43._errorCount + 1;
            v43._errorWarningSignal:Fire(v43._errorCount, v43._warningCount);
        end;
        return ;
    end;
end;
v12.new = function(v45)
    local v46 = {};
    setmetatable(v46, v12);
    v46._initialized = false;
    v46._isRunning = false;
    v46._isClient = v45;
    v46._logData = v7.new(v9);
    v46._logDataSearched = v7.new(v9);
    v46._searchTerm = "";
    v46._commandLineHistory = v7.new(100);
    v46._commandLineIndex = 0;
    v46._filters = {};
    for _, v48 in pairs(l_EnumToMsgTypeName_0) do
        v46._filters[v48] = true;
    end;
    v46._errorCount = v45 and 0;
    v46._warningCount = v45 and 0;
    v46._logDataUpdate = v8.new();
    v46._errorWarningSignal = v45 and v8.new();
    v46._filterUpdated = v8.new();
    return v46;
end;
v12.Signal = function(v49)
    return v49._logDataUpdate;
end;
v12.errorWarningSignal = function(v50)
    return v50._errorWarningSignal;
end;
v12.filterUpdatedSignal = function(v51)
    return v51._filterUpdated;
end;
v12.setSearchTerm = function(v52, v53)
    if v52._searchTerm ~= v53 then
        v52._searchTerm = v53;
        if v52._searchTerm == "" then
            v52._logDataSearched:reset();
            v52._logDataUpdate:Fire(v52._logData);
            return ;
        else
            v42(v52._logDataSearched, v52._logData:iterator(), v52._filters, v52._searchTerm);
            v52._logDataUpdate:Fire(v52._logDataSearched);
        end;
    end;
end;
v12.getSearchTerm = function(v54)
    return v54._searchTerm;
end;
v12.getCommandLineHistory = function(v55)
    return v55._commandLineHistory;
end;
v12.getCommandLineIndex = function(v56)
    return v56._commandLineIndex;
end;
v12.setCommandLineIndex = function(v57, v58)
    v57._commandLineIndex = v58;
end;
v12.getFilters = function(v59)
    return v59._filters;
end;
v12.setFilter = function(v60, v61, v62)
    local v63 = v60._filters[v61];
    v60._filters[v61] = v62;
    local l__filters_0 = v60._filters;
    local v65 = false;
    for _, v67 in pairs(l__filters_0) do
        v65 = v65 or v67;
    end;
    if v65 then
        v42(v60._logDataSearched, v60._logData:iterator(), v60._filters, v60._searchTerm);
        v60._logDataUpdate:Fire(v60._logDataSearched);
        v60._filterUpdated:Fire();
        return ;
    else
        v60._filters[v61] = v63;
        return ;
    end;
end;
v12.setFilters = function(v68, v69)
    v68._filters = v69;
    local v70 = false;
    for _, v72 in pairs(v69) do
        v70 = v70 or v72;
    end;
    if v70 then
        v42(v68._logDataSearched, v68._logData:iterator(), v68._filters, v68._searchTerm);
        v68._logDataUpdate:Fire(v68._logDataSearched);
        v68._filterUpdated:Fire();
        return ;
    else
        v68._logDataSearched:reset();
        v68._logDataUpdate:Fire(v68._logData);
        return ;
    end;
end;
v12.getLogData = function(v73)
    if #v73._logDataSearched:getData() > 0 then
        return v73._logDataSearched;
    else
        return v73._logData;
    end;
end;
v12.getErrorWarningCount = function(v74)
    return v74._errorCount, v74._warningCount;
end;
v12.isRunning = function(v75)
    return v75._initialized;
end;
v12.start = function(v76)
    if not v76._isClient then
        v76._connection = l_LogService_0.ServerMessageOut:connect(function(v77, v78, v79)
            local v80 = v18(v77 or "[DevConsole Error 3]", v11(v79), v78.Value);
            if not v23(v80) then
                v76._logData:push_back(v80);
                if #v76._logDataSearched:getData() > 0 then
                    if v27(v80, v76._filters, v76._searchTerm) then
                        v76._logDataSearched:push_back(v80);
                        v76._logDataUpdate:Fire(v76._logDataSearched);
                        return ;
                    end;
                else
                    v76._logDataUpdate:Fire(v76._logData);
                end;
            end;
        end);
        l_LogService_0:RequestServerOutput();
    else
        if not v76._initialized then
            v76._initialized = true;
            if #{} == 0 then
                for _, v82 in ipairs((l_LogService_0:GetLogHistory())) do
                    local v83 = v18(v82.message or "[DevConsole Error 1]", v11(v82.timestamp), v82.messageType.Value);
                    if not v23(v83) then
                        v76:checkErrorWarningCounter(v82.messageType.Value);
                        v76._logData:push_back(v83);
                    end;
                end;
            end;
        end;
        v76._connection = l_LogService_0.MessageOut:connect(function(v84, v85)
            local v86 = v18(v84 or "[DevConsole Error 2]", v11(os.time()), v85.Value);
            if not v23(v86) then
                v76:checkErrorWarningCounter(v85.Value);
                v76._logData:push_back(v86);
                if #v76._logDataSearched:getData() > 0 then
                    if v27(v86, v76._filters, v76._searchTerm) then
                        v76._logDataSearched:push_back(v86);
                        v76._logDataUpdate:Fire(v76._logDataSearched);
                        return ;
                    end;
                else
                    v76._logDataUpdate:Fire(v76._logData);
                end;
            end;
        end);
    end;
    v76._isRunning = true;
end;
v12.stop = function(v87)
    v87._initialized = false;
    v87._isRunning = false;
    if v87._connection then
        v87._connection:Disconnect();
    end;
end;
return v12;
