local l_MessageBusService_0 = game:GetService("MessageBusService");
return {
    NAME = "Payments", 
    MESSAGE_PROCESS_PENDING_PURCHASE = l_MessageBusService_0:GetMessageId("Payments", "processPendingPurchase"), 
    MESSAGE_SEND_IAP_EVENT = l_MessageBusService_0:GetMessageId("Payments", "sendIAPEvent"), 
    MESSAGE_ON_PURCHASE_PROCESSED_EVENT = l_MessageBusService_0:GetMessageId("Payments", "onPurchaseProcessed"), 
    METHOD_LIST_NATIVE_PRODUCTS = "listNativeProducts", 
    METHOD_IS_AVAILABLE = "isAvailable"
};
