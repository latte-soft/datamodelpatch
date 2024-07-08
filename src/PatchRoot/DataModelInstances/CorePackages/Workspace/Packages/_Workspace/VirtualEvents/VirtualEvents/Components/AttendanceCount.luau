local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.formatNumberWithShortUnits);
local _ = require(l_script_FirstAncestor_0.types);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local v10 = l_Images_0["icons/status/games/people-playing_small"];
local v11 = UDim.new(0, 6);
return function(v12)
    local v13 = l_useStyle_0();
    local v14 = l_useLocalization_0({
        interested = "Feature.VirtualEvents.AttendanceBeforeEvent", 
        attendingNow = "Feature.VirtualEvents.AttendanceDuringEvent"
    });
    local v15 = v12.eventStatus == "Ongoing";
    return v1.createElement("Frame", {
        LayoutOrder = v12.layoutOrder, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = v11
        }), 
        Icon = v1.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(18, 18), 
            Image = v10, 
            ImageColor3 = v13.Theme.IconEmphasis.Color, 
            BackgroundTransparency = 1
        }), 
        Label = v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 2, 
            fontStyle = v13.Font.Header1, 
            colorStyle = v13.Theme.TextEmphasis, 
            text = ("%s %s"):format(v4(if not v15 then v12.interested else v12.attending), if not v15 then v14.interested else v14.attendingNow)
        })
    });
end;
