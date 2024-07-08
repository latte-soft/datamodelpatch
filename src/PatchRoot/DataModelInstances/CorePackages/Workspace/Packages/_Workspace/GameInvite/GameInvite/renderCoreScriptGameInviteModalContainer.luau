local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactRodux);
local v6 = require(l_Parent_1.ReactRoblox);
local v7 = require(l_Parent_1.SharedFlags);
local v8 = require(l_Parent_1.Style);
local v9 = require(l_Parent_1.UniversalAppPolicy);
local l_ApolloProvider_0 = require(l_Parent_1.ApolloClient).ApolloProvider;
local v11 = require(l_Parent_0.GameInviteConstants);
local v12 = require(l_Components_0.GameInviteModal);
local _ = require(l_Parent_0.gameInviteModalType);
local l_AppFeaturePolicies_0 = v9.AppFeaturePolicies;
local l_RoactAppPolicy_0 = v9.RoactAppPolicy;
local l_StyleProviderWithDefaultTheme_0 = v8.StyleProviderWithDefaultTheme;
game:DefineFastFlag("FixGameInviteModalLoadTimeIncrease", false);
local l_FFlagGameInviteModalInviteLinkPolicy_0 = v7.FFlagGameInviteModalInviteLinkPolicy;
local v18 = nil;
if not game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then
    v18 = require(l_Parent_1.RobloxApolloClient).initializeApolloClient({});
end;
local function v20(v19)
    if not l_FFlagGameInviteModalInviteLinkPolicy_0 then
        return v19;
    else
        return {
            PolicyProvider = v4.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            }, v19)
        };
    end;
end;
return function(v21)
    local v22 = require(l_Parent_0.State.GameInviteStore);
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "GameInvite";
    l_Folder_0.Parent = l_CoreGui_0;
    local v24 = v4.createElement(v5.StoreProvider, {
        store = v22
    }, (v20({
        StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
            ApolloClientProvider = v4.createElement(l_ApolloProvider_0, {
                client = if not game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then v18 else v21
            }, {
                GameInviteModalWrapper = v4.createElement(v12, {
                    displayOrder = -1, 
                    renderLocation = v11.RenderLocation.CoreScripts
                })
            })
        })
    })));
    local v25 = v6.createRoot(l_Folder_0);
    v25:render(v24);
    return v25;
end;
