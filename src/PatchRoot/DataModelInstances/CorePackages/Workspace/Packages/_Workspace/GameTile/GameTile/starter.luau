return {
    Flags = {
        getFFlagLuaAppSingleHoveredGridTile = require(script.Parent.Flags.getFFlagLuaAppSingleHoveredGridTile)
    }, 
    AppExperienceActionRow = require(script.Parent.AppExperienceActionRow), 
    AppGameTile = require(script.Parent.AppGameTile), 
    ExperienceFooter = require(script.Parent.Footer.ExperienceFooter), 
    FriendIcon = require(script.Parent.Footer.FriendIcon), 
    GameStats = require(script.Parent.Footer.GameStats), 
    GameTileConstants = require(script.Parent.GameTileConstants), 
    OpenCentralOverlayForPlacesList = require(script.Parent.OpenCentralOverlayForPlacesList), 
    OpenSponsoredTooltip = require(script.Parent.OpenSponsoredTooltip), 
    SponsoredGamesRecordClick = require(script.Parent.SponsoredGamesRecordClick), 
    usePlayerCountText = require(script.Parent.Footer.usePlayerCountText), 
    UserIconList = require(script.Parent.Footer.UserIconList), 
    WideGameTileViewConfig = require(script.Parent.WideGameTileViewConfig), 
    gameTileOtaValidator = require(script.Parent.gameTileOtaValidator), 
    ["jest.config"] = script.Parent["jest.config"]
};
