local v0 = require(script.Parent.Parent.Parent.Rodux);
local v1 = require(script.Parent.CaptureManager);
local v2 = require(script.Parent.Captures);
local v3 = require(script.Parent.Carousel);
local v4 = require(script.Parent.IsActive);
local v5 = require(script.Parent.IsCapturesCoreGuiEnabled);
local v6 = require(script.Parent.IsMenuOpen);
local v7 = require(script.Parent.IsOverlayActive);
local v8 = require(script.Parent.IsOverlayFlashActive);
local v9 = require(script.Parent.Prompts);
local v10 = require(script.Parent.Toast);
return function()
    return v0.combineReducers({
        CaptureManager = v1, 
        Captures = v2, 
        Carousel = v3, 
        IsActive = v4, 
        IsCapturesCoreGuiEnabled = v5, 
        IsMenuOpen = v6, 
        IsOverlayActive = v7, 
        IsOverlayFlashActive = v8, 
        Prompts = v9, 
        Toast = v10
    });
end;
