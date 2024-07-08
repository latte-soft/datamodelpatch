local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useNavigation_0 = v1.useNavigation;
local l_HeaderBar_0 = l_UIBlox_0.App.Bar.HeaderBar;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v16 = l_Images_0["icons/actions/friends/friendAdd"];
local v17 = l_Images_0["icons/actions/truncationExpand"];
local v18 = l_Images_0["icons/menu/more_off"];
local v19 = l_Images_0["icons/menu/player_small"];
local function v20()
end;
return function(v21)
    local v22 = l_useNavigation_0();
    local v23 = v22.getParam("conversationId");
    local v24 = l_useStyle_0();
    local l_Font_0 = v24.Font;
    local v26 = l_React_0.useRef(false);
    l_React_0.useEffect(function()
        v26.current = true;
        return function()
            v26.current = false;
        end;
    end, {});
    local v27 = l_React_0.useCallback(function()
        if v26 then
            v22.pop();
        end;
    end, {
        v22
    });
    local v28 = l_React_0.useCallback(function()
        if v26 then
            v22.navigate(v3.SquadInviteFriends, {
                conversationId = v23
            });
        end;
    end, {
        v22
    });
    local v29 = l_getIconSize_0(l_IconSize_0.Small);
    return l_React_0.createElement(l_HeaderBar_0, {
        barHeight = v2.SQUAD_LOBBY_TITLE_BAR_HEIGHT, 
        renderLeft = l_React_0.useCallback(function()
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.fromScale(0, 1), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                CloseButton = l_Roact_0.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(0, 0), 
                    icon = v17, 
                    iconSize = l_IconSize_0.Medium, 
                    layoutOrder = 0, 
                    onActivated = v27
                }), 
                PlayerIconContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromOffset(v29 + 4, v29), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIPadding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 4)
                    }), 
                    PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Position = UDim2.fromOffset(0, 0), 
                        Size = UDim2.fromOffset(v29, v29), 
                        BackgroundTransparency = 1, 
                        Image = v19, 
                        ImageColor3 = v24.Theme.TextDefault.Color, 
                        ImageTransparency = v24.Theme.TextDefault.Transparency
                    })
                }), 
                UserCount = l_Roact_0.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v24.Font.Header2.Font, 
                    LayoutOrder = 2, 
                    Text = tostring(v21.numUsers), 
                    TextColor3 = v24.Theme.TextDefault.Color, 
                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize
                })
            });
        end, l_dependencyArray_0(v27, v21.numUsers)), 
        renderRight = l_React_0.useCallback(function()
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = UDim2.fromScale(0, 1), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 16), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                InviteButton = l_Roact_0.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(0, 0), 
                    icon = v16, 
                    iconSize = l_IconSize_0.Medium, 
                    isDisabled = v2.SQUAD_MAX_CAPACITY <= v21.numUsers, 
                    layoutOrder = 0, 
                    onActivated = v28
                }), 
                MenuButton = l_Roact_0.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(0, 0), 
                    icon = v18, 
                    iconSize = l_IconSize_0.Medium, 
                    layoutOrder = 1, 
                    onActivated = v20
                })
            });
        end, l_dependencyArray_0(v28, v21.numUsers))
    });
end;
