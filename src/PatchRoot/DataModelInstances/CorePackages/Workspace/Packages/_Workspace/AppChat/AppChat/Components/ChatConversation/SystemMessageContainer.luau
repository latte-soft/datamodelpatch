local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local l_memo_0 = v1.memo;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.SystemMessage);
local v5 = {
    text = "", 
    parentWidth = 0, 
    showDateTime = false
};
SystemMessageContainer = function(v6)
    local v7 = v3.Dictionary.join(v5, v6);
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        DateTime = v7.showDateTime and v1.createElement(v4, {
            LayoutOrder = 1, 
            Text = v7.sent:GetLongRelativeTime(), 
            maxWidth = 1000
        }), 
        SystemMessage = v1.createElement(v4, {
            LayoutOrder = 2, 
            Text = v7.text, 
            maxWidth = v7.parentWidth * 0.75
        }), 
        debug = v7.debugElement or nil
    });
end;
return l_memo_0(SystemMessageContainer);
