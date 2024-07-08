local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_withStyle_0 = v2.UIBlox.Style.withStyle;
local l_Text_0 = v2.Text;
local l_t_0 = v2.t;
local l_llama_0 = v2.llama;
local l_Mock_0 = v2.Mock;
local v9 = require(l_script_FirstAncestor_0.User);
local v10 = require(l_script_FirstAncestor_0.Logger);
local v11 = require(l_script_FirstAncestor_0.EnumScreens);
local v12 = require(script.Parent.AddFriendsTile);
local v13 = require(script.Parent.UserTile);
local v14 = require(script.Parent.UserCarouselHeader);
local v15 = require(script.Parent.UIBloxCarouselAdaptor);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_FFlagLuaAppConsolidateProfileLogging_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppConsolidateProfileLogging;
local v18 = l_Roact_0.PureComponent:extend("UserCarousel");
v18.defaultProps = {
    accountProviderName = "", 
    addFriendOnActivated = function()
    end, 
    enableDisplayNamePolicy = false, 
    friends = {}, 
    friendThumbnailSize = 96, 
    LayoutOrder = 0, 
    Logger = v10, 
    onFriendSelected = function()
    end, 
    peopleListFrozen = false, 
    screenSize = Vector2.new(1000, 1000), 
    shouldInviteFromAccountProvider = false, 
    wideMode = false, 
    hasFriendRequests = false
};
v18.validateProps = l_t_0.interface({
    analytics = l_t_0.table, 
    accountProviderName = l_t_0.optional(l_t_0.string), 
    addFriendOnActivated = l_t_0.optional(l_t_0.callback), 
    enableDisplayNamePolicy = l_t_0.optional(l_t_0.boolean), 
    friends = l_t_0.array(v9.validateUser), 
    friendThumbnailSize = l_t_0.optional(l_t_0.number), 
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    onFriendSelected = l_t_0.optional(l_t_0.callback), 
    peopleListFrozen = l_t_0.optional(l_t_0.boolean), 
    screenSize = l_t_0.optional(l_t_0.union(l_t_0.Vector2, l_Mock_0.MagicMock.is)), 
    shouldInviteFromAccountProvider = l_t_0.optional(l_t_0.boolean), 
    wideMode = l_t_0.optional(l_t_0.boolean), 
    hasFriendRequests = l_t_0.boolean, 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    goToFriendsLanding = l_t_0.optional(l_t_0.callback), 
    goToAddFriends = l_t_0.optional(l_t_0.callback), 
    isLuaProfilePageEnabled = l_t_0.optional(l_t_0.boolean), 
    luaAddFriendsPageEnabled = l_t_0.optional(l_t_0.boolean)
});
v18.init = function(v19)
    v19.state = {
        friends = {}
    };
    v19.onFriendSelected = function(v20)
        v19.props.Logger:info("Going to ViewUser");
        v19.props.analytics:buttonClick("UserTile", {
            friendId = v20.user.id, 
            position = v20.positionIndex, 
            subpage = if not v19.props.isLuaProfilePageEnabled then nil else "peekView", 
            page = if not v19.props.isLuaProfilePageEnabled then nil else "playerProfile"
        });
        if v19.props.isLuaProfilePageEnabled then
            v19.props.analytics:navigate("ViewUserProfile");
        end;
        local v21 = l_llama_0.Dictionary.join(v20, {
            onOpen = function()
                v19.props.setPeopleListFrozen(true);
            end, 
            onClose = function()
                v19.props.setPeopleListFrozen(false);
            end
        });
        if not v19.props.isLuaProfilePageEnabled then
            v19.props.navigateToLuaAppPages[v11.ViewUser](v21);
            return ;
        else
            v19.props.navigateToLuaAppPages[v11.ViewUserProfile](v20.user.id, {
                contextualMenuProps = v21, 
                profilePeekViewProps = {
                    absolutePosition = v20.absolutePosition, 
                    source = if not l_FFlagLuaAppConsolidateProfileLogging_0 then nil else l_Sources_0.SocialTab
                }, 
                openJoinable = true
            });
            return ;
        end;
    end;
    v19.goToFriendRequestsPage = function()
        v19.props.navigateToLuaAppPages[not not v19.props.enableFriendFinder and v11.FriendFinder or v11.AddFriends]();
    end;
    v19.goToFriendsPage = function()
        v19.props.Logger:info("Going to FriendsPage");
        v19.props.analytics:buttonClick("CarouselTitle");
        v19.props.analytics:navigate("CarouselTitle");
        if v19.props.goToFriendsLanding then
            v19.props.analytics:buttonClick("friendsLanding");
            v19.props.analytics:navigate("FriendsLandingPage");
        end;
        if not v19.props.goToFriendsLanding then
            v19.props.navigateToLuaAppPages[v11.AddFriends]();
            return ;
        else
            v19.props.goToFriendsLanding();
            return ;
        end;
    end;
    v19.activatedAddFriendsTile = function()
        v19.props.Logger:info("Going to AddFriends");
        v19.props.analytics:buttonClick("AddFriends");
        v19.props.analytics:navigate("AddFriends");
        v19.props.goToAddFriends();
    end;
    v19.activatedFriendRequestsButton = function()
        v19.props.Logger:info("Going to FriendRequests");
        v19.props.analytics:buttonClick("FriendRequests", {
            isBadgeShown = v19.props.hasFriendRequests
        });
        v19.props.analytics:navigate("FriendRequests");
        v19.props.goToAddFriends();
    end;
end;
v18.getDerivedStateFromProps = function(v22)
    if v22.peopleListFrozen then
        return nil;
    else
        return {
            friends = v22.friends
        };
    end;
end;
v18.render = function(v23)
    return l_withStyle_0(function(v24)
        local v25 = (v23.props.friendThumbnailSize + l_Text_0.GetTextBounds("SampleText", v24.Font.CaptionHeader.Font, v24.Font.CaptionHeader.RelativeSize * v24.Font.BaseSize, Vector2.new(10000, 10000)).Y) + 8;
        local function v26()
            return l_Roact_0.createElement(v12, {
                accountProviderName = v23.props.getAccountProviderName, 
                layoutOrder = 1, 
                onActivated = v23.activatedAddFriendsTile, 
                shouldInviteFromAccountProvider = v23.props.shouldInviteFromAccountProvider, 
                thumbnailSize = v23.props.friendThumbnailSize, 
                totalHeight = v25
            });
        end;
        return l_Roact_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v23.props.LayoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v25)
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            UserCarouselHeader = l_Roact_0.createElement(v14, {
                layoutOrder = 1, 
                friendCount = #v23.state.friends, 
                hasFriendRequests = v23.props.hasFriendRequests, 
                goToFriendRequestsPage = v23.activatedFriendRequestsButton, 
                goToFriendsPage = v23.goToFriendsPage
            }), 
            UserCarousel = l_Roact_0.createElement(v15, {
                createUserEntry = function(v27)
                    if v27.user == nil then
                        return v26();
                    else
                        return l_Roact_0.createElement(v13, {
                            enableDisplayNamePolicy = v23.props.enableDisplayNamePolicy, 
                            height = v25, 
                            layoutOrder = v27.index, 
                            onActivated = v23.onFriendSelected, 
                            thumbnailSize = v23.props.friendThumbnailSize, 
                            user = v27.user, 
                            absolutePosition = v27.absolutePosition
                        });
                    end;
                end, 
                friends = v23.state.friends, 
                friendThumbnailSize = v23.props.friendThumbnailSize, 
                LayoutOrder = 2, 
                wideMode = v23.props.wideMode, 
                tileHeight = v25
            })
        });
    end);
end;
return v18;
