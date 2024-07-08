local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local l_AppChatNetworking_0 = v1.AppChatNetworking;
local l_AppHeaderBar_0 = v1.AppHeaderBar;
local l_FriendsMenu_0 = v1.FriendsMenu;
local l_React_0 = v1.React;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_SharedFlags_0 = v1.SharedFlags;
local l_UIBlox_0 = v1.UIBlox;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useNavigation_0 = v1.useNavigation;
local l_FriendsMenuFriendsList_0 = l_FriendsMenu_0.FriendsMenuFriendsList;
local l_FriendsMenuContextWrapper_0 = l_FriendsMenu_0.FriendsMenuContextWrapper;
local l_FriendsMenuSearch_0 = l_FriendsMenu_0.FriendsMenuSearch;
local l_FriendMenuType_0 = l_FriendsMenu_0.FriendMenuType;
local l_SelectedUsersScroller_0 = l_FriendsMenu_0.SelectedUsersScroller;
local l_GetFFlagEnableFriendMenuMultiSelect_0 = l_SharedFlags_0.GetFFlagEnableFriendMenuMultiSelect;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = l_SharedFlags_0.UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local l_HeaderBar_0 = l_UIBlox_0.App.Bar.HeaderBar;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v23 = require(script.Parent.SquadInviteFriendsButton);
local function v24()
end;
return function()
    local v25 = l_useLocalization_0({
        inviteToSquadLabel = "Feature.Squads.Label.InviteToSquad"
    });
    local v26 = l_useDispatch_0();
    local v27 = l_useNavigation_0();
    local v28 = v27.getParam("conversationId");
    local l_Theme_0 = l_useStyle_0().Theme;
    local v30, v31 = l_React_0.useState(0);
    return l_React_0.createElement(l_FriendsMenuContextWrapper_0, {
        inviteSingleFriend = v24, 
        inviteMultiFriends = l_React_0.useCallback(function(v32, v33)
            v26(l_AppChatNetworking_0.rodux.AddUserToConversation.API(v33, v32)):andThen(function()
                v27.navigate(v3.SquadLobby, {
                    conversationId = v33
                });
            end);
        end, {}), 
        isLoadingCustomParams = false
    }, {
        ContainerFrame = l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -52), 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, {
            VerticalLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 16), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            HeaderBar = l_React_0.createElement(l_HeaderBar_0, {
                barHeight = v2.SQUAD_LOBBY_TITLE_BAR_HEIGHT, 
                renderLeft = (if not l_GetFFlagUIBloxUseNewHeaderBar_0() then l_HeaderBar_0.renderLeft.backButton else l_AppHeaderBar_0.makeBackButton)((l_React_0.useCallback(function()
                    v27.pop();
                end, l_dependencyArray_0(v27)))), 
                renderRight = v24, 
                title = v25.inviteToSquadLabel
            }), 
            SearchSelectFrame = l_React_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                [l_React_0.Change.AbsoluteSize] = l_React_0.useCallback(function(v34)
                    v31(v34.AbsoluteSize.Y);
                end, l_dependencyArray_0(v31))
            }, {
                Padding = l_React_0.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24)
                }), 
                VerticalLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 16), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                FriendsMenuSearch = l_React_0.createElement(l_FriendsMenuSearch_0, {
                    layoutOrder = 0, 
                    size = UDim2.new(1, 0, 0, 36), 
                    focusElement = false
                }), 
                SelectedUsersScroller = l_React_0.createElement(l_SelectedUsersScroller_0, {
                    layoutOrder = 1
                })
            }), 
            FriendsList = l_React_0.createElement(l_FriendsMenuFriendsList_0, {
                size = UDim2.new(1, 0, 1, (-v2.SQUAD_LOBBY_TITLE_BAR_HEIGHT - v30) - 32), 
                layoutOrder = 1, 
                parentComponentName = v2.SQUAD_INVITE_PARENT_COMPONENT, 
                menuType = if not l_GetFFlagEnableFriendMenuMultiSelect_0() then nil else l_FriendMenuType_0.MultiSelect
            })
        }), 
        FriendsListButtonFrame = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.new(1, 0, 0, 52), 
            BackgroundTransparency = l_Theme_0.BackgroundContrast.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
            BorderSizePixel = 0
        }, {
            Padding = l_React_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 8)
            }), 
            Button = l_React_0.createElement(v23, {
                conversationId = v28
            })
        })
    });
end;
