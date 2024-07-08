local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v10 = require(l_Modules_0.LuaApp.Thunks.ApiFetchPassesThumbnails);
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v12 = require(l_Modules_0.LuaApp.Components.Passes.PassesGrid);
local v13 = require(l_Modules_0.LuaApp.Components.Subscriptions.SubscriptionsGrid);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSubscriptionPurchaseInEDP);
local v15 = v2.PureComponent:extend("PassesPage");
v15.validateProps = v7.strictInterface({
    universeId = v7.string, 
    networking = v7.callback, 
    passes = v7.optional(v7.table), 
    subscriptionProducts = v7.optional(v7.table), 
    requestPassesThumbnails = v7.callback, 
    fetchGamePasses = v7.callback
});
v15.init = function(v16)
    v16.fetchPassesThumbnails = function(v17, v18)
        if v17 then
            local v19 = {};
            for _, v21 in ipairs(v17) do
                table.insert(v19, v21.id);
            end;
            v16.props.requestPassesThumbnails(v18, v19);
        end;
    end;
end;
v15.render = function(v22)
    local l_universeId_0 = v22.props.universeId;
    local l_passes_0 = v22.props.passes;
    local l_subscriptionProducts_0 = v22.props.subscriptionProducts;
    return l_withStyle_0(function(v26)
        return v2.createElement("Frame", {
            Name = "PassesContent", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v26.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v26.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            TopBar = v2.createElement(v11.Container, {
                leftItem = v11.BackButton, 
                rightItems = {
                    v11.BuyRobuxButton
                }
            }), 
            PageContent = v2.createElement(v11.PageContent, {}, {
                MainPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                PassesArea = v2.createElement("ScrollingFrame", {
                    Name = "PassesArea", 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = false, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    ScrollBarThickness = 0, 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ElasticBehavior = Enum.ElasticBehavior.Always
                }, if not v14() then {
                    PassesGrid = v2.createElement(v12, {
                        universeId = l_universeId_0, 
                        passes = l_passes_0
                    })
                } else {
                    GridLayoutContainer = v8({
                        subscriptions = "Feature.Subscription.Heading.Subscriptions", 
                        passes = "Feature.GamePass.Heading.PassesForThisGame"
                    })(function(v27)
                        return v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            BackgroundTransparency = 1
                        }, {
                            UIListLayout = v2.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Vertical, 
                                Padding = UDim.new(0, 24)
                            }), 
                            SubscripttionHeader = v2.createElement("TextLabel", {
                                Text = v27.subscriptions, 
                                BackgroundTransparency = 1, 
                                TextColor3 = v26.Theme.TextDefault.Color, 
                                TextSize = v26.Font.BaseSize * v26.Font.Header2.RelativeSize, 
                                Font = v26.Font.Header2.Font, 
                                LayoutOrder = 0, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }), 
                            SubscriptionsGrid = v2.createElement(v13, {
                                subscriptionProducts = l_subscriptionProducts_0, 
                                layoutOrder = 1
                            }), 
                            Passes = v2.createElement("TextLabel", {
                                Text = v27.passes, 
                                BackgroundTransparency = 1, 
                                TextColor3 = v26.Theme.TextDefault.Color, 
                                TextSize = v26.Font.BaseSize * v26.Font.Header2.RelativeSize, 
                                Font = v26.Font.Header2.Font, 
                                LayoutOrder = 2, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }), 
                            PassesGrid = v2.createElement(v12, {
                                universeId = l_universeId_0, 
                                passes = l_passes_0, 
                                layoutOrder = 3
                            })
                        });
                    end)
                })
            })
        });
    end);
end;
v15.didMount = function(v28)
    local l_passes_1 = v28.props.passes;
    local l_networking_0 = v28.props.networking;
    if l_passes_1 ~= nil then
        v28.fetchPassesThumbnails(l_passes_1, l_networking_0);
    end;
end;
v15.didUpdate = function(v31, v32, _)
    if v32.passes ~= v31.props.passes then
        v31.fetchPassesThumbnails(v31.props.passes, v31.props.networking);
    end;
end;
return l_RoactServices_0.connect({
    networking = v6
})((v3.connect(function(v34, v35)
    return {
        passes = v34.GamePasses[tostring(v35.universeId)]
    };
end, function(v36)
    return {
        requestPassesThumbnails = function(v37, v38)
            return v36(v10(v37, v38));
        end, 
        fetchGamePasses = function(v39, v40)
            return v36(v4(v39, v40));
        end
    };
end)(v15)));
