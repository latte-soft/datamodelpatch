local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Dash_0 = v2.Dash;
local v7 = require(l_script_FirstAncestor_0.ProfileContext);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v9 = require(l_script_FirstAncestor_0.TestHelpers.mockContext);
local v10 = require(l_script_FirstAncestor_0.TestHelpers.mockApolloClientAndResponse);
local l_UIBlox_0 = v2.UIBlox;
local l_ApolloClientModule_0 = v2.ApolloClientModule;
local l_mockApolloClient_0 = v2.GraphQLServer.ApolloClientTestUtils.mockApolloClient;
local l_status_0, l_result_0 = pcall(function()
    l_UIBlox_0.init();
end);
if not l_status_0 then
    warn("Error initializing UIBlox", l_result_0);
end;
local l_AppStyleProvider_0 = l_UIBlox_0.App.Style.AppStyleProvider;
local v17 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.ProfileSelection);
local v18 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.MergeStateAction);
local v19 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.MergeStateReducer);
local v20 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.mockLocale);
local v21 = require(l_script_FirstAncestor_0.Stories.StoryHelpers.generateTestState);
local l_RetrievalStatus_0 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local v23 = require(l_script_FirstAncestor_0.TestHelpers.mockAnalytics);
local v24 = require(l_script_FirstAncestor_0.Analytics);
l_Roact_0.setGlobalConfig({
    propValidation = true, 
    elementTracing = true
});
local function v31(v25)
    local l_controls_0 = v25.controls;
    local v27 = math.max(v25.host.AbsoluteSize.X, 100);
    local v28 = math.max(v25.host.AbsoluteSize.Y, 200);
    local v29 = v17.getUserId(v25);
    local v30 = {
        ScreenSize = Vector2.new(v27, v28), 
        Profile = {
            ProfilePageDataStatus = {
                ["123"] = l_RetrievalStatus_0.Done.rawValue(), 
                deletedUser = l_RetrievalStatus_0.Done.rawValue(), 
                loadingUser = l_RetrievalStatus_0.Fetching.rawValue(), 
                failedUser = l_RetrievalStatus_0.Failed.rawValue()
            }
        }
    };
    if not (not v29 or not l_controls_0.profileDataStatus) then
        v30.Profile.ProfilePageDataStatus[v29] = l_controls_0.profileDataStatus.rawValue();
    end;
    return v30;
end;
local v32 = {
    Default = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
return {
    name = "LuaProfile", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = l_Roact_0, 
    mapStory = function(v33)
        local v34 = l_Rodux_0.Store.new(v19, v21(), {
            l_Rodux_0.thunkMiddleware
        });
        local v35 = l_mockApolloClient_0({});
        return function(v36)
            local v37 = v31(v36);
            if v37 then
                v34:dispatch(v18(v37));
            end;
            v10(v35, {
                mutualFriendsCount = v36.controls.friendsCount
            });
            return l_Roact_0.createElement(l_AppStyleProvider_0, {
                style = not not v36 and v32[v36.theme] or v32.Default
            }, {
                WithAnalytics = l_Roact_0.createElement(v24.Context.Provider, {
                    value = v23({})
                }, {
                    storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                        store = v34
                    }, {
                        apolloClient = l_Roact_0.createElement(l_ApolloClientModule_0.ApolloProvider, {
                            client = v35
                        }, {
                            profileContext = l_Roact_0.createElement(v7.Provider, {
                                value = l_Dash_0.join(v9({
                                    abbreviateCount = function(v38)
                                        return l_NumberLocalization_0.abbreviate(v38, "en-us", nil);
                                    end
                                }))
                            }, {
                                story = v20(v33, v36)
                            })
                        })
                    })
                })
            });
        end;
    end
};
