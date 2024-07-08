local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.Enum.OverlayType);
local _ = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local _ = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v6 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.GetAccountsList);
local v7 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local _ = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local v9 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSelector);
local _ = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v12 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v13 = require(l_Modules_0.LuaApp.Constants);
local l_CorePackages_0 = game:GetService("CorePackages");
local v15 = require(l_CorePackages_0.Packages.React);
local l_AddAccountRow_0 = require(l_CorePackages_0.Workspace.Packages.AccountSelector).AddAccountRow;
local l_MaxAccountsReachedText_0 = require(l_CorePackages_0.Workspace.Packages.AccountSelector).MaxAccountsReachedText;
local v18 = require(script.Parent.Parent.CloseCentralOverlay);
local v19 = require(script.Parent.OpenAccountSwitchingErrorOverlay);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v21 = require(script.Parent.AccountSwitcher.SwitchToAccount);
local v22 = require(script.Parent.AppStorageUtilities);
local function v27(v23, v24, _)
    if v24 ~= "moreMenu" then
        return nil;
    elseif not v23 then
        local v26 = l_useNavigation_0();
        return v15.createElement(l_AddAccountRow_0, {
            origin = v24, 
            context = v12.Context.AccountSwitcher, 
            onRowClicked = function()
                v26.replace(v4.AccountSwitchingAddAccountPeekView, {
                    extraProps = {
                        origin = v24
                    }
                });
            end
        });
    else
        return v15.createElement(l_MaxAccountsReachedText_0);
    end;
end;
return function(_, v29, v30, v31)
    return function(v32)
        if v9 then
            local v33 = v32:getState().AuthenticationStatus.status == v5.LOGGED_IN;
            local function v34()
                v32:dispatch(v18());
            end;
            return v6(v29, v33):andThen(function(v35)
                local l_logged_in_users_metadata_0 = v35.logged_in_users_metadata;
                if #l_logged_in_users_metadata_0 == 0 then
                    if v33 == true then
                        v32:dispatch(v19("Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.PleaseTryAgainLater", "CommonUI.Messages.Action.OK", "", v34, nil, v13.Auth.AccountSwitcherUnavailableError));
                    end;
                    return 0;
                else
                    local l_active_user_id_0 = v35.active_user_id;
                    local v38 = tostring(v7.fromLocalStorage().userId);
                    if ((v31 ~= nil and l_active_user_id_0 ~= nil) and l_active_user_id_0 ~= "") and l_active_user_id_0 ~= v38 then
                        v31.reportAuthClientError(v12.Context.AccountSwitcherMismatch, l_active_user_id_0 .. "," .. v38);
                    end;
                    local v39 = #l_logged_in_users_metadata_0 >= 5;
                    local v40 = {};
                    for _, v42 in l_logged_in_users_metadata_0, nil, nil do
                        local v43 = v42.user_id == l_active_user_id_0;
                        table.insert(v40, {
                            id = v42.user_id, 
                            name = v42.username, 
                            displayName = v42.display_name, 
                            iconKey = if not v43 then nil else "icons/status/success_large", 
                            isUnselectable = v43
                        });
                    end;
                    table.sort(v40, function(v44, _)
                        return v44.id == v35.active_user_id;
                    end);
                    v32:dispatch(v10({
                        origin = v30, 
                        context = v12.Context.AccountSwitcher, 
                        users = v40, 
                        actionRows = {}, 
                        onAccountSelection = function(v46)
                            for _, v48 in ipairs(v40) do
                                if v48.id == v46 then
                                    v22.setAccountSwitchTargetUsername(v48.name);
                                    v22.flush();
                                end;
                            end;
                            v32:dispatch(v21(v29, v46));
                        end, 
                        onAccountSelectionAbandoned = function()
                        end, 
                        titleTextKey = "Authentication.AccountSwitch.Heading.SwitchAccount", 
                        renderFooterComponent = function()
                            return v27(v39, v30, v32);
                        end
                    }, true));
                    return #l_logged_in_users_metadata_0;
                end;
            end):catch(function(_)
                v32:dispatch(v19("Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.PleaseTryAgainLater", "CommonUI.Messages.Action.OK", "", v34, nil, v13.Auth.AccountSwitcherUnavailableError));
            end);
        else
            return nil;
        end;
    end;
end;
