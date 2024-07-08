return {
    installReducer = require(script.Parent.installReducer), 
    FriendsCarousel = require(script.Parent.Components.Carousel), 
    FetchFriendsCarousel = require(script.Parent.Networking.FetchFriendsAndRecommendations), 
    setupFireEvent = require(script.Parent.Analytics.setupFireEvent), 
    EventNames = require(script.Parent.Analytics.EventNames), 
    CarouselWithLoadingTimer = require(script.Parent.Analytics.CarouselWithLoadingTimer), 
    useCreateCarouselList = require(script.Parent.Components.useCreateCarouselList), 
    Constants = require(script.Parent.Common.Constants), 
    Signals = require(script.Parent.Signals), 
    dependencies = require(script.Parent.dependencies), 
    ["jest.config"] = script.Parent["jest.config"]
};
