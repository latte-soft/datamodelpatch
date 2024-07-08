local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_t_0 = v3.t;
local l_RoactRodux_0 = v3.RoactRodux;
local l_Cryo_0 = v3.Cryo;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Constants);
local v10 = require(l_Parent_0.Utility.Promise);
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = require(l_Parent_0.Components.Page);
local v13 = require(l_Parent_0.Components.ThemedTextLabel);
local v14 = require(l_Parent_0.Components.PageNavigationWatcher);
local v15 = require(l_Parent_0.Components.Connection.FocusHandler);
local v16 = require(l_Parent_0.Components.Connection.RootedConnection);
local v17 = require(script.InviteFriendsList);
local v18 = require(script.AddFriendsNow);
local v19 = require(script.LoadingFriendsError);
local v20 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v21 = l_Roact_0.PureComponent:extend("InviteFriendsPage");
v21.validateProps = l_t_0.strictInterface({
    pageTitle = l_t_0.string, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    PlayersService = l_t_0.union(l_t_0.Instance, l_t_0.table), 
    menuPage = not not v20() and l_t_0.string or nil
});
v21.defaultProps = {
    PlayersService = l_Players_0
};
v21.init = function(v22)
    v22.backButtonRef = l_Roact_0.createRef();
    v22.searchBoxRef = l_Roact_0.createRef();
    v22.state = {
        loadingFriends = true, 
        loadingFriendsError = false, 
        friends = {}
    };
end;
v21.renderLoadingPage = function(_)
    return v11({
        loading = "CoreScripts.InGameMenu.InviteFriends.Loading"
    })(function(v24)
        return l_Roact_0.createElement(v13, {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v24.loading, 
            fontKey = "Header1", 
            themeKey = "TextEmphasis"
        });
    end);
end;
v21.renderError = function(v25)
    return l_Roact_0.createElement(v19, {
        onRetry = function()
            v25:setState({
                loadingFriends = true, 
                loadingFriendsError = false
            });
            v25:loadFriends();
        end, 
        canCaptureFocus = v25.props.canCaptureFocus
    });
end;
v21.renderNoFriends = function(v26)
    return l_Roact_0.createElement(v18, {
        canCaptureFocus = v26.props.canCaptureFocus
    });
end;
local function v29(v27, v28)
    if v27.IsOnline == v28.IsOnline then
        return v27.Username:lower() < v28.Username:lower();
    else
        return v27.IsOnline and not v28.IsOnline;
    end;
end;
v21.renderFriends = function(v30)
    return l_Roact_0.createElement(v17, {
        friends = v30.state.friends, 
        canCaptureFocus = v30.props.canCaptureFocus, 
        searchBoxRef = v30.searchBoxRef
    });
end;
v21.render = function(v31)
    local l_state_0 = v31.state;
    local v33 = {
        Watcher = l_Roact_0.createElement(v14, {
            desiredPage = "InviteFriends", 
            onNavigateTo = function()
                v31:loadFriends();
            end
        })
    };
    if not l_state_0.loadingFriends then
        if not l_state_0.loadingFriendsError then
            if #l_state_0.friends == 0 then
                v33.NoFriends = v31:renderNoFriends();
            else
                v33.FriendsList = v31:renderFriends();
            end;
        else
            v33.ErrorLoading = v31:renderError();
        end;
    else
        v33.Loading = v31:renderLoadingPage();
    end;
    return l_Roact_0.createElement(v16, {
        render = function(v34)
            local l_createElement_0 = l_Roact_0.createElement;
            local l_v15_0 = v15;
            local v37 = {};
            local v38;
            if v20() then
                v38 = true;
                if not (v31.props.menuPage == "InviteFriends") then
                    goto label0;
                end;
            end;
            v38 = nil;
            ::label0::;
            v37.shouldForgetPreviousSelection = v38;
            v37.isFocused = (v31.props.canCaptureFocus and l_state_0.loadingFriends) and v34;
            v37.didFocus = function()
                l_GuiService_0.SelectedCoreObject = v31.backButtonRef:getValue();
            end;
            return l_createElement_0(l_v15_0, v37, {
                Page = l_Roact_0.createElement(v12, {
                    pageTitle = v31.props.pageTitle, 
                    buttonRef = v31.backButtonRef, 
                    NextSelectionDown = v31.searchBoxRef
                }, v33)
            });
        end
    });
end;
v21.didMount = function(v39)
    v39.mounted = true;
    v39:loadFriends();
end;
v21.loadFriends = function(v40)
    v10.new(function(v41, v42)
        coroutine.wrap(function()
            local l_LocalPlayer_0 = v40.props.PlayersService.LocalPlayer;
            local l_status_0, l_result_0 = pcall(function()
                return v40.props.PlayersService:GetFriendsAsync(l_LocalPlayer_0.UserId);
            end);
            if l_status_0 then
                local v46 = {};
                while true do
                    for _, v48 in ipairs(l_result_0:GetCurrentPage()) do
                        v46[#v46 + 1] = {
                            IsOnline = v48.IsOnline, 
                            Id = v48.Id, 
                            Username = v48.Username, 
                            DisplayName = v48.DisplayName, 
                            itemRef = nil
                        };
                    end;
                    if l_result_0.IsFinished then
                        v41((l_Cryo_0.List.sort(v46, v29)));
                        return ;
                    elseif not pcall(function()
                        l_result_0:AdvanceToNextPageAsync();
                    end) then
                        v42("Error loading friends");
                        return ;
                    end;
                end;
            else
                v42("Error loading friends");
                return ;
            end;
        end)();
    end):andThen(function(v49)
        if v40.mounted then
            v40:setState({
                loadingFriends = false, 
                friends = v49
            });
        end;
    end):catch(function()
        if v40.mounted then
            v40:setState({
                loadingFriends = false, 
                loadingFriendsError = true
            });
        end;
    end);
end;
v21.willUnmount = function(v50)
    v50.mounted = false;
end;
return l_RoactRodux_0.connect(function(v51, _)
    local v53 = false;
    if v51.menuPage == "InviteFriends" then
        v53 = v51.isMenuOpen;
        if v53 then
            v53 = false;
            if v51.displayOptions.inputType == v9.InputType.Gamepad then
                v53 = not v51.respawn.dialogOpen and v51.currentZone == 1;
            end;
        end;
    end;
    return {
        canCaptureFocus = v53, 
        menuPage = not not v20() and v51.menuPage or nil
    };
end)(v21);
