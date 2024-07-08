local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.FloatingActionButton.Components.FabStatusText);
local v2 = require(l_script_FirstAncestor_0.FloatingActionButton.Common.Enums);
local v3 = require(l_script_FirstAncestor_0.FloatingActionButton.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v4.React;
local l_UIBlox_0 = v4.UIBlox;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v9 = require(l_script_FirstAncestor_0.Components.FacePile);
return function(v10)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v13 = l_React_0.useCallback(function()
        local _ = {};
        if not (v10.squadState == v2.SquadState.UserJoin.rawValue()) or not v10.newJoinedUser then
            return v10.users;
        else
            return {
                v10.newJoinedUser.id
            };
        end;
    end, l_dependencyArray_0(v10.squadState, v10.users, v10.newJoinedUser));
    local v14, v15 = l_React_0.useState(v13());
    l_React_0.useEffect(function()
        v15(v13());
    end, l_dependencyArray_0(v13));
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v3.CONTAINER_HEIGHT), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        FabStatusText = l_React_0.createElement(v1, {
            size = UDim2.new(1, -v3.FACEPILE_WIDTH, 1, 0), 
            squadState = v10.squadState, 
            experienceName = v10.experienceName, 
            inviter = v10.inviter, 
            joinedUser = v10.newJoinedUser
        }), 
        FacePile = l_React_0.createElement(v9, {
            users = v14, 
            avatarSize = v3.FACEPILE_AVATAR_SIZE, 
            overlapOffset = v3.FACEPILE_OVERLAP, 
            borderWidth = v3.FACEPILE_BORDER_WIDTH, 
            borderColor = l_Theme_0.BackgroundUIDefault.Color, 
            facePileWidth = UDim.new(0, v3.FACEPILE_WIDTH), 
            horizontalAlignment = Enum.HorizontalAlignment.Right
        }), 
        Layout = l_React_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        Border = l_React_0.createElement("UIStroke", {
            Color = if v10.squadState == v2.SquadState.Idle.rawValue() then v3.CONTAINER_DEFAULT_BORDER_COLOR else v3.CONTAINER_HIGHLIGHT_BORDER_COLOR, 
            Thickness = v3.CONTAINER_BORDER_SIZE
        }), 
        UICorner = l_React_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, v3.CONTAINER_BORDER_RADIUS)
        }), 
        Padding = l_React_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v3.CONTAINER_LAYOUT_PADDING), 
            PaddingRight = UDim.new(0, v3.CONTAINER_LAYOUT_PADDING), 
            PaddingBottom = UDim.new(0, v3.CONTAINER_LAYOUT_PADDING), 
            PaddingLeft = UDim.new(0, v3.CONTAINER_LAYOUT_PADDING)
        })
    });
end;
