local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.EventHostName);
local _ = require(l_script_FirstAncestor_0.types);
local l_Cell_0 = v3.App.Table.Cell;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v11 = {
    size = UDim2.new(1, 0, 0, 52)
};
return function(v12)
    v12 = v1.Dictionary.join(v11, v12);
    local v13 = l_useStyle_0();
    return v2.createElement(l_Cell_0, {
        size = v12.size, 
        userInteractionEnabled = true, 
        horizontalPadding = 0, 
        onActivated = v2.useCallback(function()
            if v12.onActivated then
                v12.onActivated(v12.host);
            end;
        end, {
            v12
        }), 
        head = v2.createElement(l_CellHeadDetail_0, {
            labelText = l_useLocalization_0({
                hostedBy = "Feature.VirtualEvents.HostedByLabel"
            }).hostedBy, 
            labelTextColor = v13.Theme.TextDefault, 
            labelTextFont = v13.Font.Body
        }), 
        tail = v2.createElement(l_CellTailDescription_0, {
            text = "", 
            renderTextOverride = function()
                return v2.createElement(v5, {
                    host = v12.host
                });
            end, 
            showArrow = true
        })
    });
end;
