local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local v6 = require(l_Shell_0.ScreenManager);
local v7 = require(l_Shell_0.AppState);
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v10 = require(l_Shell_0.Components.Social.FriendsView);
local v11 = require(l_Shell_0.FriendsData);
local v12 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v13 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function(v14)
    local v15 = {};
    local v16 = false;
    local l_TabContainer_0 = v14.Parent:FindFirstChild("TabContainer");
    local v18 = l_Utility_0.Create("Frame")({
        Name = "SocialPane", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false, 
        SelectionImageObject = l_Utility_0.Create("ImageLabel")({
            BackgroundTransparency = 1
        }), 
        Parent = v14
    });
    local v19 = l_Utility_0.Create("Frame")({
        Name = "FriendsContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 23), 
        BackgroundTransparency = 1, 
        Parent = v18
    });
    local v20 = nil;
    local function v21()
        if v20 then
            v20 = v3.update(v20, (v3.createElement(v4.StoreProvider, {
                store = v7.store
            }, {
                FriendsView = v3.createElement(v10, {
                    inFocus = v16, 
                    hide = not v18.Visible, 
                    redirectUp = function()
                        l_Utility_0.SetSelectedCoreObject(l_TabContainer_0);
                    end
                })
            })));
            return ;
        else
            return ;
        end;
    end;
    v15.GetName = function(_)
        return l_LocalizedStrings_0:LocalizedString("FriendsWord");
    end;
    v15.GetId = function(_)
        return l_Analytics_0.TabNames("FriendsId");
    end;
    v15.IsFocused = function(_)
        return v16;
    end;
    v15.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SocialPaneId")
        };
    end;
    v15.Show = function(_, v27)
        v18.Visible = true;
        v11:SuspendUpdate();
        if not v27 then
            v21();
        else
            if v20 then
                v3.unmount(v20);
            end;
            v20 = v3.mount(v3.createElement(v4.StoreProvider, {
                store = v7.store
            }, {
                FriendsView = v3.createElement(v10, {
                    hide = not v18.Visible, 
                    inFocus = v16, 
                    redirectUp = function()
                        l_Utility_0.SetSelectedCoreObject(l_TabContainer_0);
                    end
                })
            }), v19, "FriendsViewContainer");
        end;
        v6:PlayDefaultOpenSound();
        if v12() > 0 then
            if not v13() then
                l_Analytics_0.reportNavigationLoaded(v15:GetName());
            else
                l_Analytics_0.reportNavigationLoaded(l_Analytics_0.TabNames("FriendsId"));
                return ;
            end;
        end;
    end;
    v15.Hide = function(_, v29)
        v18.Visible = false;
        if not v29 then
            v21();
            return ;
        else
            if v20 then
                v3.unmount(v20);
            end;
            v20 = nil;
            v11:ResumeUpdate();
            return ;
        end;
    end;
    v15.Focus = function(_)
        v16 = true;
        v21();
    end;
    v15.RemoveFocus = function(_)
        v16 = false;
        v21();
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        if not (not l_SelectedCoreObject_0 or not l_SelectedCoreObject_0:IsDescendantOf(v18)) then
            l_Utility_0.SetSelectedCoreObject(nil);
        end;
    end;
    v15.SetPosition = function(_, v34)
        v18.Position = v34;
    end;
    v15.SetParent = function(_, v36)
        v18.Parent = v36;
    end;
    v15.IsAncestorOf = function(_, v38)
        return v18 and v18:IsAncestorOf(v38);
    end;
    return v15;
end;
