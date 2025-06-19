global class BatchAccountCleanup implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id FROM Account WHERE LastModifiedDate < LAST_N_YEARS:2');
    }
    global void execute(Database.BatchableContext BC, List<Account> scope) {
        delete scope;
    }
    global void finish(Database.BatchableContext BC) {
        System.debug('Batch completed.');
    }
}