local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_UserIconList_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).UserIconList;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.sortFriendsByPresenceAndRecency);
local v7 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v8 = v1.PureComponent:extend("FriendFooter");
v8.defaultProps = {
    innerMargin = 0, 
    outerMargin = 0, 
    titleTextSize = 0, 
    footerContentWidth = 0, 
    footerContentHeight = 0, 
    friends = {}, 
    gameName = ""
};
v8.render = function(v9)
    local l_appTheme_0 = v9.props.appTheme;
    local l_innerMargin_0 = v9.props.innerMargin;
    local l_outerMargin_0 = v9.props.outerMargin;
    local l_titleTextSize_0 = v9.props.titleTextSize;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_innerMargin_0)
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_outerMargin_0), 
            PaddingRight = UDim.new(0, l_outerMargin_0), 
            PaddingTop = UDim.new(0, l_outerMargin_0)
        }), 
        Title = v1.createElement("TextLabel", {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, l_titleTextSize_0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextSize = l_titleTextSize_0, 
            TextColor3 = l_appTheme_0.GameCard.Title.Color, 
            Font = l_appTheme_0.GameCard.Title.Font, 
            Text = v9.props.gameName, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        }), 
        UserIconList = v1.createElement(l_UserIconList_0, {
            layoutOrder = 2, 
            width = v9.props.footerContentWidth, 
            height = v9.props.footerContentHeight, 
            users = v9.props.friends
        })
    });
end;
v8 = v7(v8);
local v20 = l_memoize_0(function(v14, v15)
    if v14 and v15 then
        local v16 = {};
        for _, v18 in pairs(v15) do
            local v19 = v14[v18];
            if not (not v19 or not v19.isFriend) then
                table.insert(v16, v19);
            end;
        end;
        table.sort(v16, v6);
        return v16;
    else
        return {};
    end;
end);
return (v2.connect(function(v21, v22)
    local l_universeId_0 = v22.universeId;
    assert(typeof(l_universeId_0) == "string", "universeId must be provided as a valid string.");
    local v24 = v21.Games[l_universeId_0];
    local v25 = "";
    if v24 then
        v25 = v24.name;
    end;
    return {
        friends = v20(v21.Users, v21.InGameUsersByGame[l_universeId_0]), 
        gameName = v25
    };
end)(v8));
