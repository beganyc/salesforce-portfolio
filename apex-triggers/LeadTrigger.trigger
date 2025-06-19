trigger LeadTrigger on Lead (before insert) {
    for (Lead l : Trigger.new) {
        if (l.Company == null) {
            l.Company = 'Default Company';
        }
    }
}