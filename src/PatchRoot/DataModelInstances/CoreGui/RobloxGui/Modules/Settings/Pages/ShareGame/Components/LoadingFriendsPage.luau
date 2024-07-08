local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_LoadingBar_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).LoadingBar;
local v3 = require(l_CorePackages_0.Roact);
local v4 = v3.PureComponent:extend("LoadingFriendsPage");
v4.render = function(v5)
    local l_LayoutOrder_0 = v5.props.LayoutOrder;
    local l_ZIndex_0 = v5.props.ZIndex;
    local v8 = 0;
    local function _()
        v8 = v8 + 1;
        return v8;
    end;
    local l_createElement_0 = v3.createElement;
    local v11 = "Frame";
    local v12 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0
    };
    local v13 = {
        listLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_createElement_1 = v3.createElement;
    local v15 = "Frame";
    local v16 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 70, 0, 16)
    };
    v8 = v8 + 1;
    v16.LayoutOrder = v8;
    v16.ZIndex = l_ZIndex_0;
    v13.loadingIndicator = l_createElement_1(v15, v16, {
        loadingBar = v3.createElement(l_LoadingBar_0, {
            ZIndex = l_ZIndex_0
        })
    });
    return l_createElement_0(v11, v12, v13);
end;
return v4;
