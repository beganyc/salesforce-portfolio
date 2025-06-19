public with sharing class ExternalOrderSync {
    @AuraEnabled
    public static String syncOrder(String orderJson) {
        // Simulate parsing external order JSON
        System.debug('Order JSON: ' + orderJson);
        return 'Order synced successfully';
    }
}