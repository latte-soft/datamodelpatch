local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v5 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v8 = UDim2.new(1, 0, 0, 200);
return function(v9)
    local l_ReportActionBar_0 = v5().ReportActionBar;
    local v11 = l_ReportActionBar_0.size or v8;
    local v12 = l_ReportActionBar_0.buttonHeight or 48;
    local v13 = UDim2.fromOffset(l_ReportActionBar_0.buttonWidth or 500, v12);
    local v14 = {};
    for _, v16 in v9.buttons, nil, nil do
        table.insert(v14, {
            buttonType = v16.buttonType or l_ButtonType_0.Secondary, 
            props = {
                onActivated = v16.onActivated, 
                size = v13, 
                text = v16.text
            }
        });
    end;
    return v2.createElement("Frame", {
        LayoutOrder = v9.layoutOrder, 
        Size = v11, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        ActionButtons = v2.createElement(l_ButtonStack_0, {
            marginBetween = l_ReportActionBar_0.buttonListHorizontalPadding, 
            buttonHeight = v12, 
            buttons = v14
        })
    });
end;
