local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_utils_0 = l_Parent_0.utils;
local _ = require(l_Parent_0.type);
local l_getNearestWholeNumber_0 = require(l_utils_0.toastNotificationHelper).getNearestWholeNumber;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_TimeTrigger_0 = v1.ToastNotificationProtocolEnums.TimeTrigger;
return function(v8, v9)
    local v10, v11 = l_React_0.useState(0);
    local v12 = {};
    local v13 = true;
    for v14, v15 in pairs(v8) do
        local v16 = nil;
        if v15.trigger == l_TimeTrigger_0.OnReceive then
            v16 = l_getNearestWholeNumber_0((v15.timespanMs - (DateTime.now().UnixTimestampMillis - v9.notificationReceivedTimestampMs)) / 1000);
        elseif v15.trigger == l_TimeTrigger_0.OnDisplay then
            v16 = l_getNearestWholeNumber_0((v15.timespanMs - (DateTime.now().UnixTimestampMillis - v9.displayTimestampMs)) / 1000);
        end;
        if v16 > 0 then
            v13 = false;
        end;
        v12[v14] = math.max(0, v16);
    end;
    l_React_0.useEffect(function()
        local v17 = nil;
        if not v13 then
            v17 = task.delay(1, function()
                v11(v10 + 1);
            end);
        end;
        return function()
            if v17 then
                task.cancel(v17);
            end;
        end;
    end, l_dependencyArray_0(v13, v10));
    return v12;
end;
