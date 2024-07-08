local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.memoize);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.Shell.Components.Common.CategoryMenuView);
local v5 = require(l_Modules_0.Shell.Components.Common.SplitViewLR);
local v6 = require(l_Modules_0.Shell.Utility);
local v7 = require(l_Modules_0.Shell.SoundManager);
local v8 = require(l_Modules_0.Shell.LocalizedStrings);
local v9 = require(l_Modules_0.Shell.Components.Social.FriendsScrollingView);
local v10 = require(l_Modules_0.Shell.Components.Social.NoFriendsView);
local v11 = require(l_Modules_0.Shell.PageKeys);
local v12 = v1.PureComponent:extend("FriendsView");
local l_Key_0 = v11.FriendCategories.Key;
local v14 = {
    OnlineFriends = v11.FriendCategories.OnlineFriends.Key, 
    AllFriends = v11.FriendCategories.AllFriends.Key
};
local v15 = {
    [v14.OnlineFriends] = {
        Order = 1, 
        StringKey = "OnlineWord"
    }, 
    [v14.AllFriends] = {
        Order = 2, 
        StringKey = "AllWord"
    }
};
local function _(v16, v17)
    if v16.state.currentPage ~= v17 then
        v16:setState({
            currentPage = v17, 
            selectedPage = l_Key_0
        });
    end;
end;
v12.init = function(v19)
    v19.selectedPage = l_Key_0;
    v19.onSelectionGained = function(v20)
        local l_v19_0 = v19;
        if l_v19_0.state.currentPage ~= v20 then
            l_v19_0:setState({
                currentPage = v20, 
                selectedPage = l_Key_0
            });
        end;
    end;
    v19.state = {
        currentPage = v14.OnlineFriends, 
        selectedPage = l_Key_0
    };
    v19.enterSection = function()
        v7:Play("OverlayOpen");
        v6.SetSelectedCoreObject(nil);
        v19:setState({
            selectedPage = v19.state.currentPage
        });
    end;
    v19.exitSection = function()
        v7:Play("PopUp");
        v19:setState({
            selectedPage = l_Key_0
        });
    end;
end;
v12.render = function(v22)
    local v23 = v22.props.actionPriority or 0;
    local l_currentPage_0 = v22.state.currentPage;
    local l_inFocus_0 = v22.props.inFocus;
    local l_hide_0 = v22.props.hide;
    local v27 = false;
    local v28 = false;
    if not (l_hide_0 or not l_inFocus_0) then
        if v22.state.selectedPage == l_Key_0 then
            v27 = true;
        end;
        if v22.state.selectedPage ~= l_Key_0 then
            v28 = true;
        end;
    end;
    local l_enterSection_0 = v22.enterSection;
    if l_currentPage_0 == v11.FriendCategories.OnlineFriends.Key and #v22.props.onlineFriendsData == 0 then
        l_enterSection_0 = nil;
    elseif l_currentPage_0 == v11.FriendCategories.AllFriends.Key and #v22.props.allFriendsData == 0 then
        l_enterSection_0 = nil;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, -58, 1, 0), 
        Position = UDim2.new(0, 58, 0, 0), 
        BackgroundTransparency = 1
    }, {
        Mainview = v1.createElement(v5, {
            Bias = 0.265, 
            LeftView = v1.createElement(v4, {
                StringKey = l_Key_0, 
                Categories = v15, 
                InFocus = v27, 
                DefaultCategoryFocus = v14.OnlineFriends, 
                OnSelectSection = v22.onSelectionGained, 
                EnterSection = l_enterSection_0, 
                RedirectUp = v22.props.redirectUp, 
                ActionPriority = v23
            }), 
            RightView = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                OnlineFriendsView = v1.createElement(v9, {
                    friendsData = v22.props.onlineFriendsData, 
                    initialized = v22.props.initialized, 
                    hide = l_currentPage_0 ~= v11.FriendCategories.OnlineFriends.Key, 
                    inFocus = v28, 
                    redirectLeft = v22.exitSection, 
                    redirectBack = v22.exitSection, 
                    redirectUp = v22.props.redirectUp, 
                    redirectRight = v22.props.redirectRight, 
                    size = UDim2.new(0, 440, 0, 770), 
                    noFriendsView = v1.createElement(v10, {
                        text = v8:LocalizedString("NoFriendsOnlinePhrase")
                    }), 
                    actionPriority = v23 + 1
                }), 
                AllFriendsView = v1.createElement(v9, {
                    friendsData = v22.props.allFriendsData, 
                    initialized = v22.props.initialized, 
                    hide = l_currentPage_0 ~= v11.FriendCategories.AllFriends.Key, 
                    inFocus = v28, 
                    redirectLeft = v22.exitSection, 
                    redirectBack = v22.exitSection, 
                    redirectUp = v22.props.redirectUp, 
                    redirectRight = v22.props.redirectRight, 
                    size = UDim2.new(0, 440, 0, 770), 
                    noFriendsView = v1.createElement(v10, {
                        text = v8:LocalizedString("PlayAndMakeFriendsPhrase")
                    }), 
                    actionPriority = v23 + 1
                })
            })
        })
    });
end;
local v34 = v2(function(v30)
    local v31 = {};
    for _, v33 in ipairs(v30) do
        if not (v33.robloxStatus == "Offline") or v33.xboxStatus == "Online" then
            table.insert(v31, v33);
        end;
    end;
    return v31;
end);
return v3.connect(function(v35, _)
    local l_data_0 = v35.RenderedFriends.data;
    return {
        allFriendsData = l_data_0, 
        onlineFriendsData = v34(l_data_0), 
        initialized = v35.RenderedFriends.initialized
    };
end)(v12);
