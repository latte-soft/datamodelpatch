local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.GlobalConfig);
local v5 = require(l_Parent_0.Localization.withLocalization);
local v6 = require(l_Parent_0.Components.ThemedTextLabel);
local v7 = l_t_0.strictInterface({
    Position = l_t_0.UDim2, 
    Size = l_t_0.UDim2, 
    AnchorPoint = l_t_0.Vector2
});
return function(v8)
    if v4.propValidation then
        assert(v7(v8));
    end;
    return v5({
        lockedText = "CoreScripts.InGameMenu.GameSettings.LockedByDeveloper"
    })(function(v9)
        return l_Roact_0.createElement(v6, {
            themeKey = "TextDefault", 
            fontKey = "CaptionBody", 
            TextTransparency = 0.5, 
            Text = v9.lockedText, 
            Size = UDim2.new(1, -72, 0.25, 0), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        });
    end);
end;
