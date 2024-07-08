local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = {};
v2.__index = v2;
local v3 = {
    selectItemCount = 0, 
    backButtonClickCount = 0, 
    isSeenSummaryPage = false
};
local v4 = {
    ABANDONED_TREE_BASED_REPORT = "TreeBasedAbuseReportAbandoned", 
    SUBMIT_TREE_BASED_REPORT = "TreeBasedAbuseReportSubmitted"
};
v2.new = function(v5, v6)
    return (setmetatable({
        _target = v5, 
        _context = v6, 
        _state = table.clone(v3)
    }, v2));
end;
v2._sendEvent = function(v7, v8, v9)
    if not (not v7._target or not v7._context) then
        l_RbxAnalyticsService_0:SendEventDeferred(v7._target, v7._context, v8, (v1.Dictionary.join({
            platform = v7._target, 
            dialogEntryPoint = v7._context
        }, v7._state, v9 or {})));
    end;
end;
v2.onBackButtonPressed = function(v10)
    local l__state_0 = v10._state;
    l__state_0.backButtonClickCount = l__state_0.backButtonClickCount + 1;
end;
v2.onSingleListItemSelected = function(v12)
    local l__state_1 = v12._state;
    l__state_1.selectItemCount = l__state_1.selectItemCount + 1;
end;
v2.onSubmissionPageMount = function(v14)
    v14._state.isSeenSummaryPage = true;
end;
v2.onReportSubmitted = function(v15)
    v15:_sendEvent(v4.SUBMIT_TREE_BASED_REPORT);
end;
v2.onReportAbandoned = function(v16)
    v16:_sendEvent(v4.ABANDONED_TREE_BASED_REPORT);
end;
return v2;
