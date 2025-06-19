global class BatchEmailDispatcher implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id, Email FROM Contact WHERE Email != null]);
    }
    global void execute(Database.BatchableContext BC, List<Contact> contacts) {
        for (Contact c : contacts) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {c.Email});
            email.setSubject('Hello from Salesforce');
            email.setPlainTextBody('This is a test email.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        }
    }
    global void finish(Database.BatchableContext BC) {
        System.debug('Batch completed.');
    }
}