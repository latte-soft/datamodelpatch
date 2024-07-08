local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local v3 = require(l_Modules_0.Common.memoize);
local v4 = require(l_Modules_0.LuaApp.sortFriendsByPresenceAndRecency);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Components.Home.JoinableFriendEntry);
local v7 = (v5.PlacesList.ContextualMenu.HorizontalOuterPadding + v5.PlacesList.ContextualMenu.AvatarSize) + v5.PlacesList.ContextualMenu.HorizontalInnerPadding;
local v8 = v1.PureComponent:extend("JoinableFriendsList");
local function v10(v9)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v9.layoutOrder
    }, {
        BottomDivider = v1.createElement("Frame", {
            Size = UDim2.new(1, -v7, 1, 0), 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v5.Color.GRAY4, 
            BorderSizePixel = 0
        })
    });
end;
v8.defaultProps = {
    layoutOrder = 0
};
v8.init = function(v11)
    v11.state = {
        friends = v11.props.friends
    };
end;
v8.render = function(v12)
    local l_LayoutOrder_0 = v12.props.LayoutOrder;
    local l_maxHeight_0 = v12.props.maxHeight;
    local l_width_0 = v12.props.width;
    local l_universeId_0 = v12.props.universeId;
    local v17 = v12.state.friends or {};
    local v18 = {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v19, v20 in ipairs(v17) do
        local v21 = v19 * 2;
        local v22 = v19 < #v17;
        v18["Entry_" .. v20.name] = v1.createElement(v6, {
            user = v20, 
            layoutOrder = v21, 
            entryHeight = 67, 
            entryWidth = l_width_0, 
            universeId = l_universeId_0
        });
        v18["Divider_" .. v20.name] = v22 and v1.createElement(v10, {
            layoutOrder = v21 + 1
        });
    end;
    local v23 = 67 * #v17 + 1 * (#v17 - 1);
    return v1.createElement("ScrollingFrame", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, (math.min(l_maxHeight_0, v23))), 
        CanvasSize = UDim2.new(1, 0, 0, v23), 
        BackgroundColor3 = v5.Color.WHITE, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0
    }, v18);
end;
local v30 = v3(function(v24, v25)
    if v24 and v25 then
        local v26 = {};
        for _, v28 in pairs(v25) do
            local v29 = v24[v28];
            if not (not v29 or not v29.isFriend) then
                table.insert(v26, v29);
            end;
        end;
        table.sort(v26, v4);
        return v26;
    else
        return {};
    end;
end);
return (v2.connect(function(v31, v32)
    return {
        friends = v30(v31.Users, v31.InGameUsersByGame[v32.universeId])
    };
end)(v8));
