local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v5 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_FitTextLabel_0 = v4.RoactFitComponents.FitTextLabel;
local l_withStyle_0 = v3.Style.withStyle;
return function(v8)
    local l_contentWidth_0 = v8.contentWidth;
    local l_layoutOrder_0 = v8.layoutOrder;
    local l_richText_0 = v8.richText;
    local l_text_0 = v8.text;
    return l_withStyle_0(function(v13)
        local l_Font_0 = v13.Font.Body.Font;
        if v8.useBold == true then
            l_Font_0 = v13.Font.Header1.Font;
        end;
        local l_Color_0 = v13.Theme.TextDefault.Color;
        if v8.useEmphasis == true then
            l_Color_0 = v13.Theme.TextEmphasis.Color;
        end;
        local l_RelativeSize_0 = v13.Font.Body.RelativeSize;
        if v8.size == v5.Header1 then
            l_RelativeSize_0 = v13.Font.Header1.RelativeSize;
        elseif v8.size == v5.Footer then
            l_RelativeSize_0 = v13.Font.Footer.RelativeSize;
        end;
        local l_Center_0 = Enum.TextXAlignment.Center;
        if v8.alignLeft == true then
            l_Center_0 = Enum.TextXAlignment.Left;
        end;
        local v18 = nil;
        if not (l_contentWidth_0 ~= 0) or l_contentWidth_0 == nil then
            v18 = Enum.AutomaticSize.X;
        end;
        return v2.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            width = l_FitTextLabel_0.Width.FitToText, 
            maximumWidth = l_contentWidth_0, 
            Font = l_Font_0, 
            LayoutOrder = l_layoutOrder_0 or nil, 
            RichText = l_richText_0, 
            AutomaticSize = v18, 
            Text = l_text_0, 
            TextColor3 = l_Color_0, 
            TextSize = l_RelativeSize_0 * v13.Font.BaseSize, 
            TextTransparency = v13.Theme.TextDefault.Transparency, 
            TextWrapped = true, 
            TextXAlignment = l_Center_0, 
            AnchorPoint = Vector2.new(0, 0), 
            onActivated = v8.onActivated
        });
    end);
end;
