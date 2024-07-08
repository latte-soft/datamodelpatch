local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.formatDate);
local v6 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v9 = utf8.char(8226);
return function(v10)
    local v11 = l_useStyle_0();
    local v12 = l_useLocalization_0({
        cancelled = "Feature.VirtualEvents.EventCancelledText"
    });
    local v13 = v10.virtualEvent.eventStatus == "cancelled";
    local v14 = v2.useMemo(function()
        return v6(v10.virtualEvent);
    end, {
        v10.virtualEvent
    });
    return v2.createElement(l_StyledTextLabel_0, {
        text = if not v13 then ("%s %s %s"):format(v5(v14.startDate), v9, v5(v14.endDate)) else v12.cancelled, 
        automaticSize = Enum.AutomaticSize.XY, 
        fontStyle = v11.Font.CaptionHeader, 
        colorStyle = if not v13 then v11.Theme.TextMuted else v11.Theme.Alert
    });
end;
