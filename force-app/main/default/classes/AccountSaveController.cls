public with sharing class AccountSaveController {
    public Account acct {get;set;}
    public List<String> acctFields {get;set;}
    public AccountSaveController() {
        acct = new Account();
        for(Schema.FieldSetMember fieldMember : 
            SObjectType.Account.FieldSets.AccountRecordsFieldSet.getFields()) {
                acctFields.add(fieldMember.getFieldPath());
            }
    }

    public Pagereference saveRecord() {
        insert acct;
        return new Pagereference('/'+acct.Id);
    }
}
