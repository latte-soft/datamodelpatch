return {
    ["jest.config"] = script.Parent["jest.config"], 
    DisplayQRCode = require(script.Parent.DisplayQRCode), 
    ECLevels = require(script.Parent.Common.ECLevels), 
    FFlagQrCodeDrawToEditableImage = require(script.Parent.Flags.FFlagQrCodeDrawToEditableImage)
};
