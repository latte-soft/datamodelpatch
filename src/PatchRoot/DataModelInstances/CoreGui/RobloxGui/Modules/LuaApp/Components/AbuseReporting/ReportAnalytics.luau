local _ = game:GetService("RbxAnalyticsService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v3 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local l_COMMON_FORMAT_ENTRY_POINT_0 = v3.COMMON_FORMAT_ENTRY_POINT;
local l_REPORT_ENTRYPOINT_0 = v3.REPORT_ENTRYPOINT;
local v6 = {
    platform = "", 
    dialogEntryPoint = "", 
    selectItemCount = 0, 
    backButtonClickCount = 0, 
    isSeenSummaryPage = false
};
local function v9(v7, v8)
    if v7.platform ~= "" and v7.dialogEntryPoint ~= "" then
        l_EventIngestService_0:SendEventDeferred(v7.platform, v7.dialogEntryPoint, v8, v7);
    end;
end;
local function v11(v10)
    if not ((v10 ~= l_COMMON_FORMAT_ENTRY_POINT_0.Profile and v10 ~= l_COMMON_FORMAT_ENTRY_POINT_0.Chat) and v10 ~= l_COMMON_FORMAT_ENTRY_POINT_0.Experience) or v10 == l_COMMON_FORMAT_ENTRY_POINT_0.Item then
        return v10;
    elseif v10 == l_REPORT_ENTRYPOINT_0.Profile then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Profile;
    elseif v10 == l_REPORT_ENTRYPOINT_0.Chat then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Chat;
    elseif v10 == l_REPORT_ENTRYPOINT_0.ExperienceDetails then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Experience;
    elseif v10 == l_REPORT_ENTRYPOINT_0.Item then
        return l_COMMON_FORMAT_ENTRY_POINT_0.Item;
    else
        return "";
    end;
end;
local v12 = {
    SET_BASIC_INFO = "SET_BASIC_INFO", 
    INCREMENT_SELECTION_ITEM = "INCREMENT_SELECTION_ITEM", 
    INCREMENT_BACK_BUTTON_CLICK = "INCREMENT_BACK_BUTTON_CLICK", 
    SET_IS_SEEN_SUMMARY_PAGE = "SET_IS_SEEN_SUMMARY_PAGE"
};
return {
    reportAnalyticsReducer = function(v13, v14)
        local v15 = table.clone(v13);
        if v14.type == v12.SET_BASIC_INFO then
            v15.platform = v14.platform;
            v15.dialogEntryPoint = v11(v14.dialogEntryPoint);
            return v15;
        elseif v14.type == v12.INCREMENT_SELECTION_ITEM then
            v15.selectItemCount = v15.selectItemCount + 1;
            return v15;
        elseif v14.type == v12.INCREMENT_BACK_BUTTON_CLICK then
            v15.backButtonClickCount = v15.backButtonClickCount + 1;
            return v15;
        else
            if v14.type == v12.SET_IS_SEEN_SUMMARY_PAGE then
                v15.isSeenSummaryPage = true;
            end;
            return v15;
        end;
    end, 
    EMPTY_LOGGING_STATE = v6, 
    sendEventData = v9, 
    ActionTypes = v12
};
