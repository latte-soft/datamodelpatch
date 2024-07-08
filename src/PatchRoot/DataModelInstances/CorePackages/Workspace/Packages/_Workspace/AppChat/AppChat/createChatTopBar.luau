local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_getEnableCommunicationsContactConsent_0 = require(l_Parent_0.CommunicationsContactConsent).getEnableCommunicationsContactConsent;
local v9 = game:DefineFastFlag("EnableAppChatTopBarRootTitleFontFix2", false);
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local l_HeaderBar_0 = v5.App.Bar.HeaderBar;
local v12 = require(l_Parent_0.AppHeaderBar);
local function v13()
    return nil;
end;
return function(v14)
    local v15 = v14.navigation.getScreenProps("navigateToRootStack", nil);
    local v16 = v14.shouldRenderCenter and v14.renderCenter ~= nil;
    local v17 = v14.headerText or {};
    local v18 = if not l_GetFFlagUIBloxUseNewHeaderBar_0() then l_HeaderBar_0.renderLeft.backButton else v12.makeBackButton;
    return l_withLocalization_0({
        headerText = not not v17.shouldLocalize and v17.raw or nil
    })(function(v19)
        local v20 = not not v17.shouldLocalize and v19.headerText or v17.raw;
        local v21 = nil;
        local v22 = nil;
        local v23 = nil;
        if not v16 then
            v21 = function()
                return not not v14.renderRight and v14.renderRight() or nil;
            end;
            v22 = nil;
            if not l_getEnableCommunicationsContactConsent_0() then
                v23 = if not v15 then not not v14.backButtonEnabled and v18(function()
                    v14.navigation.pop();
                end) or v13 else not not v14.backButtonEnabled and v18(function()
                    if v14.closeInputBar then
                        v14.closeInputBar();
                    end;
                    if not v14.isRoot then
                        v14.navigation.pop();
                        return ;
                    else
                        v14.navigation.navigate(v2.EmptyConversation);
                        v15();
                        return ;
                    end;
                end) or v13;
            else
                local v24 = if not v14.backButtonEnabled then nil else v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    BackButton = v3.createElement(v18(not v15 and function()
                        v14.navigation.pop();
                    end or function()
                        if v14.closeInputBar then
                            v14.closeInputBar();
                        end;
                        if not v14.isRoot then
                            v14.navigation.pop();
                            return ;
                        else
                            v14.navigation.navigate(v2.EmptyConversation);
                            v15();
                            return ;
                        end;
                    end))
                });
                local v26 = if not not v14.lockIconEnabled and v14.isPrivateConversation then l_withStyle_0(function(v25)
                    return v3.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.fromOffset(v25.Tokens.Semantic.Icon.Size.Medium, v25.Tokens.Semantic.Icon.Size.Medium), 
                        BackgroundTransparency = 1, 
                        Image = v5.App.ImageSet.Images["icons/graphic/lock_xxlarge"], 
                        ImageColor3 = v25.Theme.SystemPrimaryDefault.Color, 
                        ImageTransparency = v25.Theme.SystemPrimaryDefault.Transparency, 
                        LayoutOrder = 2
                    });
                end) else nil;
                v23 = (v24 or v26) and function(_)
                    return v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 72, 1, 0)
                    }, {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        BackButton = v24, 
                        LockIcon = v26
                    });
                end or v13;
            end;
        else
            v20 = "";
            v21 = nil;
            v23 = nil;
            v22 = v14.renderCenter;
        end;
        local v28 = not v14.backButtonEnabled and not v16;
        if not (not v9 or not v14.shouldBoldHeader) and v23 == v13 then
            v23 = nil;
        end;
        if not v15 then
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 56), 
                LayoutOrder = -1
            }, {
                headerBar = v3.createElement(l_HeaderBar_0, {
                    title = v20 or "", 
                    barHeight = 56, 
                    renderLeft = not v28 and v23 or nil, 
                    renderCenter = not v28 and v22 or nil, 
                    renderRight = v21
                })
            });
        else
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 56), 
                LayoutOrder = -1
            }, {
                headerBar = v3.createElement(l_HeaderBar_0, {
                    title = v20 or "", 
                    barHeight = 56, 
                    renderLeft = v23, 
                    renderCenter = v22, 
                    renderRight = v21
                })
            });
        end;
    end);
end;
