local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_createElement_0 = v1.createElement;
local v3 = require(l_CorePackages_0.UIBlox);
local _ = v3.Core.Style.useStyle;
local _ = v3.App.Button.LinkButton;
local _ = v3.Core.Control.Interactable;
local v7 = require(script.Parent.Badge);
local v8 = require(script.Parent.Popup);
local v9 = require(script.Parent.useAnalytics);
return function(v10)
    local v11, v12 = v1.useState(false);
    local v13 = v9();
    v1.useEffect(function()
        if v10.visible then
            v13.fireEvent("badgeImpression", {
                badgeType = "13Plus"
            });
        end;
    end, {
        v10.visible
    });
    return l_createElement_0("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, 32), 
        LayoutOrder = v10.layoutOrder, 
        Visible = v10.visible
    }, {
        layout = l_createElement_0("UIListLayout", {
            Padding = UDim.new(0, 14), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        badge = l_createElement_0(v7, {
            isPopupVisible = v11, 
            setIsPopupVisible = v12, 
            layoutOrder = 1
        }), 
        popup = l_createElement_0(v8, {
            bodyText = v10.bodyText, 
            linkText = v10.linkText, 
            openWebview = v10.openWebview, 
            visible = v11, 
            analyticsCopyType = v10.analyticsCopyType, 
            layoutOrder = 2
        })
    });
end;
