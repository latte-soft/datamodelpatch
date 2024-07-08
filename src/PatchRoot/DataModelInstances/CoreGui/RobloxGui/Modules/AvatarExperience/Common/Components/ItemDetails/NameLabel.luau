local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.AvatarExperienceDeps);
local v5 = require(l_CorePackages_0.UIBlox);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_ShimmerPanel_0 = v5.App.Loading.ShimmerPanel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_GetWrappedTextWithIcon_0 = v5.Core.Text.GetWrappedTextWithIcon;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_RoactFitComponents_0 = v4.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v17 = l_Images_0["icons/status/premium_small"];
return function(v18)
    local v19 = l_useStyle_0();
    local l_Theme_0 = v19.Theme;
    local l_Font_0 = v19.Font;
    local v22, v23 = v3.createBinding(false);
    local function v27(v24)
        if v18.actionBarHeaderRef then
            local l_current_0 = v18.actionBarHeaderRef.current;
            if l_current_0 then
                local v26 = v24.AbsolutePosition.Y < l_current_0.AbsolutePosition.Y;
                l_current_0.Visible = not v26;
                v23(v26);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local function _()
        return l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    end;
    local function _()
        local v29 = v18.name or "";
        if v18.showPremiumBenefits or false then
            v29 = l_GetWrappedTextWithIcon_0(v29, l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, l_Font_0.Header1.Font, l_IconSize_0.Small, v7.PremiumIconPadding);
        end;
        return v29;
    end;
    local l_Small_0 = l_IconSize_0.Small;
    local v32 = v18.name or "";
    if v18.showPremiumBenefits or false then
        v32 = l_GetWrappedTextWithIcon_0(v32, l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, l_Font_0.Header1.Font, l_IconSize_0.Small, v7.PremiumIconPadding);
    end;
    local l_v32_0 = v32;
    v32 = l_Font_0.Header1.Font;
    local v34 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
    return v2.createElement(l_FitFrameVertical_0, {
        width = UDim.new(1, 0), 
        LayoutOrder = 0, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsolutePosition] = v27
    }, {
        TextLabel = if not l_IsVRAppBuild_0() then if l_v32_0 then v2.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            Visible = v22, 
            BackgroundTransparency = 1, 
            Font = v32, 
            Text = l_v32_0, 
            TextSize = v34, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextWrapped = true
        }, {
            PremiumIcon = if not v18.showPremiumBenefits then nil else v2.createElement(l_ImageSetLabel_0, {
                Position = UDim2.new(0, 0, 0, 5), 
                Size = UDim2.new(0, l_Small_0, 0, l_Small_0), 
                ScaleType = Enum.ScaleType.Fit, 
                Image = v17, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                BackgroundTransparency = 1
            })
        }) else v2.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 0, v34)
        }) else nil, 
        RefUpdater = v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            [v2.Ref] = function(v35)
                if not (not v35 or not v35.Parent) then
                    local l_Parent_0 = v35.Parent;
                    if v18.actionBarHeaderRef then
                        local l_current_1 = v18.actionBarHeaderRef.current;
                        if l_current_1 then
                            local v38 = l_Parent_0.AbsolutePosition.Y < l_current_1.AbsolutePosition.Y;
                            l_current_1.Visible = not v38;
                            v23(v38);
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                end;
            end
        })
    });
end;
