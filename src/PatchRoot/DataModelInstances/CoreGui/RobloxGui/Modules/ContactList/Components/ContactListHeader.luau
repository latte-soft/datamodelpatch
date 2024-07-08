local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v5 = require(l_ContactList_0.dependencies);
local v6 = require(l_ContactList_0.Enums.Pages);
local v7 = require(l_ContactList_0.Actions.SetCurrentPage);
local v8 = require(l_ContactList_0.Analytics.useAnalytics);
local v9 = require(l_ContactList_0.Analytics.EventNamesEnum);
local l_useDispatch_0 = v5.Hooks.useDispatch;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_UIBlox_0 = v5.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local v17 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v17 = require(l_RobloxGui_0.Modules.RobloxTranslator);
end;
local function _(v18)
    if not l_GetFFlagIrisUseLocalizationProvider_0() then
        if v18 == v6.FriendList then
            return v17:FormatByKey("Feature.Call.Label.StartNewCall");
        elseif v18 == v6.CallHistory then
            return v17:FormatByKey("Feature.Call.Label.RecentCalls");
        end;
    elseif v18 == v6.FriendList then
        return "Feature.Call.Label.StartNewCall";
    elseif v18 == v6.CallHistory then
        return "Feature.Call.Label.RecentCalls";
    end;
    return "";
end;
return function(v20)
    local v21 = v8();
    local v22 = l_useStyle_0();
    local v23 = l_useDispatch_0();
    local l_Theme_0 = v22.Theme;
    local l_Font_0 = v22.Font;
    local v26 = nil;
    if l_GetFFlagIrisUseLocalizationProvider_0() then
        local l_l_useLocalization_0_0 = l_useLocalization_0;
        local v28 = {};
        local l_currentPage_0 = v20.currentPage;
        v28.titleLabel = if not l_GetFFlagIrisUseLocalizationProvider_0() then if l_currentPage_0 == v6.FriendList then v17:FormatByKey("Feature.Call.Label.StartNewCall") else if l_currentPage_0 == v6.CallHistory then v17:FormatByKey("Feature.Call.Label.RecentCalls") else "" else l_currentPage_0 == v6.FriendList and "Feature.Call.Label.StartNewCall" or (l_currentPage_0 == v6.CallHistory and "Feature.Call.Label.RecentCalls" or "");
        v26 = l_l_useLocalization_0_0(v28);
    end;
    local v30 = v2.useCallback(function()
        v21.fireEvent(v9.PhoneBookNavigate, {
            eventTimestampMs = os.time() * 1000, 
            startingPage = v20.currentPage, 
            destinationPage = v6.CallHistory
        });
        v23(v7(v6.CallHistory));
    end, {
        v20.currentPage
    });
    local v31 = v2.useCallback(function()
        v21.fireEvent(v9.PhoneBookNavigate, {
            eventTimestampMs = os.time() * 1000, 
            startingPage = v20.currentPage, 
            destinationPage = v6.FriendList
        });
        v23(v7(v6.FriendList));
    end, {
        v20.currentPage
    });
    local l_createElement_0 = v2.createElement;
    local v33 = "Frame";
    local v34 = {
        Size = UDim2.new(1, 0, 0, v20.headerHeight), 
        LayoutOrder = v20.layoutOrder, 
        BackgroundTransparency = 1
    };
    local v35 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        HeaderUIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        DismissButton = v2.createElement(l_ImageSetButton_0, {
            Size = UDim2.fromOffset(32, 32), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            Image = if v20.currentPage == v6.CallHistory then l_Images_0["icons/navigation/close"] else l_Images_0["icons/navigation/pushBack"], 
            LayoutOrder = 1, 
            [v2.Event.Activated] = if v20.currentPage == v6.CallHistory then v20.dismissCallback else v30
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        }), 
        DividerContainer = v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            Divider = v2.createElement("Frame", {
                Size = UDim2.new(0, 1, 0, 16), 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BorderSizePixel = 0
            }), 
            DividerContainerUIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 12)
            })
        })
    };
    local l_createElement_1 = v2.createElement;
    local v37 = "TextLabel";
    local v38 = {
        Size = UDim2.new(1, -85, 0, 24), 
        BackgroundTransparency = 1, 
        Font = l_Font_0.Header1.Font
    };
    local v39;
    if not l_GetFFlagIrisUseLocalizationProvider_0() then
        local l_currentPage_1 = v20.currentPage;
        v39 = if not l_GetFFlagIrisUseLocalizationProvider_0() then if l_currentPage_1 == v6.FriendList then v17:FormatByKey("Feature.Call.Label.StartNewCall") else if l_currentPage_1 == v6.CallHistory then v17:FormatByKey("Feature.Call.Label.RecentCalls") else "" else l_currentPage_1 == v6.FriendList and "Feature.Call.Label.StartNewCall" or (l_currentPage_1 == v6.CallHistory and "Feature.Call.Label.RecentCalls" or "");
    else
        v39 = v26.titleLabel;
    end;
    v38.Text = v39;
    v38.TextColor3 = l_Theme_0.TextEmphasis.Color;
    v38.TextSize = l_Font_0.Header1.RelativeSize * l_Font_0.BaseSize;
    v38.TextTransparency = l_Theme_0.TextEmphasis.Transparency;
    v38.LayoutOrder = 3;
    v38.TextXAlignment = Enum.TextXAlignment.Left;
    v38.TextYAlignment = Enum.TextYAlignment.Center;
    v35.HeaderText = l_createElement_1(v37, v38);
    v35.NewCallButton = if v20.currentPage == v6.CallHistory then v2.createElement(l_ImageSetButton_0, {
        Size = UDim2.fromOffset(32, 32), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        Image = "rbxassetid://15239778003", 
        LayoutOrder = 4, 
        [v2.Event.Activated] = v31
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        })
    }) else nil;
    return l_createElement_0(v33, v34, v35);
end;
