trigger OpportunityRollup on Opportunity (after insert, after update) {
    Map<Id, Decimal> accountOppSum = new Map<Id, Decimal>();
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null) {
            accountOppSum.put(opp.AccountId, accountOppSum.getOrDefault(opp.AccountId, 0) + opp.Amount);
        }
    }
    List<Account> accountsToUpdate = new List<Account>();
    for (Id accId : accountOppSum.keySet()) {
        accountsToUpdate.add(new Account(Id=accId, Total_Opportunity_Value__c=accountOppSum.get(accId)));
    }
    update accountsToUpdate;
}